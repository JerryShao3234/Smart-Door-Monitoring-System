var express = require("express")
var bodyParser = require('body-parser')
const oneDay = 1000 * 60 * 60 * 24;
var app = express()
const crypto = require('crypto')

app.use(bodyParser.urlencoded({
	  extended: true
}));

const { MongoClient } = require("mongodb") //setup MongoDB
const uri = "mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.6.2"
const client = new MongoClient(uri) //client is the database interface/API

totalAccesses = 0
app.use(express.json())

app.get("/", (req, res) => {
	res.send("Server is currently up! Total accesses since last server restart: " + totalAccesses)
	totalAccesses += 1
})

app.post("/signup", (req, res) => {
	console.log(req.body)
	client.db("sdmsDB").collection("user").insertOne(
		{
			"username": req.body.username,
			"password": req.body.password,
			"de1socID": req.body.de1socID,
			"token": null,
			"visitHistory": [],
			"outgoingMessages": [],
			"incomingMessages": []
		}
	)
})

app.post("/login", async (req, res) => {
	console.log(req.body)
	var username = req.body.username
	var password = req.body.password
	const user = await client.db("sdmsDB").collection("user").findOne({ "username": username })
	if (user == null || user === undefined) {
		console.log("user not found")
		res.send("User not found")
		return
	}
	if (user.password === password) {
		console.log("login successful")
		//add token to user object
		user_id = user._id
		await client.db("sdmsDB").collection("user").updateOne(
			{
				"_id": user_id
			},
			{
				$set: {
					"token": crypto.randomBytes(64).toString('hex')
				}
			}
		)
		res.send({
			"token": user.token,
			"username": user.username
		})

	} else {
		console.log("incorrect password")
		res.send("Incorrect password")
	}
})

app.post("/logout", async (req, res) => {
	console.log(req.body)
	var username = req.body.username
	const user = await client.db("sdmsDB").collection("user").findOne({"username": username})
	if (user == null || user === undefined) {
		console.log("user not found")
		res.send("User not found")
		return
	}

	if(user.token === req.body.token) {
		user.token = null
		user_id = user._id
		await client.db("sdmsDB").collection("user").updateOne(
			{
				"_id": user_id
			},
			{
				$set: {
					"token": null
				}
			}
		)
	}
})

app.post("/getvisits", async (req, res) => {
	var username = req.body.username
	var token = req.body.token
	var user = await client.db("sdmsDB").collection("user").findOne({"username": req.body.username})
	if (user == null || user === undefined) {
		console.log("user not found")
		res.send("User not found")
		return
	}

	if(user.token === token) {
		res.send(user.visitHistory)
	} else {
		res.send("Invalid token")
	}
})

/*
 * Used by DE1-SoC to update visit history and send notification to visitor (pending)
*/
app.post("/visit", (req, res) => {
	console.log(req.body)

	client.db("sdmsDB").collection("user").updateOne(
		{
			"username": req.body.username,
		}, 
		{
			$push: {
				"visitHistory": {
					"visitor": req.body.visitor,
					"date": req.body.date,
					"message": req.body.message,
					"image": req.body.image
				}
			}
		}
	).catch((err) => {
		res.send("Error")
		console.log(err)
	})
})

/*
 * Realtime notification from homeowner to visitor (needs DE1-SoC endpoint to be integrated to work)
*/
app.post("/messagevisitor", (req, res) => {
	client.db("sdmsDB").collection("user").findOne(
		{
			"username": req.body.username,
		}
	).then((result) => {
		//add message to user's visit history
		console.log(req.body.message)
	})
})

async function run() {
	try {
		await client.connect() //connect to client (db), we are app
		console.log("Successfully connected to the database")
		var server = app.listen(3000, (req, res) => { //init server after connecting to db
			var host = server.address().address
			var port = server.address().port
			console.log("Example server successfully running at http://%s:%s", host, port)
		})
	}
	catch (err) {
		console.log(err)
		await client.close()
	}
}

run()
