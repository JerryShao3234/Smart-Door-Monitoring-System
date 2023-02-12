var express = require("express")
var app = express()

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
			"visitHistory": {}
		}
	)
})

app.get("/gethistory", (req, res) => {
	console.log(req.query)
	client.db("sdmsDB").collection("user").findOne(
		{
			"username": req.query.username,
		}
	).then((result) => {
		res.send(result.visitHistory)
	})
})

app.post("/visit", (req, res) => {
	console.log(req.body)
	client.db("sdmsDB").collection("user").findOne(
		{
			"username": req.body.username,
		}
	).then((result) => {
		//add visit to user's visit history
		var visitHistory = result.visitHistory
		visitHistory[req.body.visitID] = {
			"date": req.body.date,
			"time": req.body.time,
			"intent": req.body.intent,
			"visitor": req.body.visitor,
			"message": req.body.message
		}
	})
})

/*
 * Realtime notification from homeowner to visitor (needs DE1-SoC endpoint to be integrated)
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
