var express = require("express")
var bodyParser = require('body-parser')
const http = require('http');

var app = express()
const server = http.createServer(app);
var io = require('socket.io')(server);
const oneDay = 1000 * 60 * 60 * 24;
const crypto = require('crypto')

app.use(bodyParser.urlencoded({
	  extended: true
}));

io.on('connection', (socket) => {
	console.log('connected');
	socket.on('message', (msg) => {
		console.log(msg);
		io.sockets.emit('message', msg)
	});
});

const { MongoClient } = require("mongodb") //setup MongoDB
const uri = "mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.6.2"
const client = new MongoClient(uri) //client is the database interface/API

totalAccesses = 0
app.use(express.json())

app.get("/", (req, res) => {
	res.status(200).send("Server is currently up! Total accesses since last server restart: " + totalAccesses)
	totalAccesses += 1
})

app.post("/signup", (req, res) => {
	console.log(req.body)
	client.db("sdmsDB").collection("user").insertOne(
		{
			"username": req.body.username,
			"password": req.body.password,
			"token": null,
			"de1socID": req.body.de1socID,
		}
	)
	res.status(200).send("User created")
})

app.post("/login", async (req, res) => {
	console.log(req.body)
	var username = req.body.username
	var password = req.body.password
	const user = await client.db("sdmsDB").collection("user").findOne({ "username": username })
	if (user == null || user === undefined) {
		console.log("user not found")
		res.status(404).send("User not found")
		return
	}
	if (user.password === password) {
		console.log("login successful")
		//add token to user object
		user_id = user._id
		token = crypto.randomBytes(64).toString('hex')
		await client.db("sdmsDB").collection("user").updateOne(
			{
				"_id": user_id
			},
			{
				$set: {
					"token": token
				}
			}
		)
		res.status(200).send({
			"token": token,
			"username": user.username
		})

	} else {
		console.log("incorrect password")
		res.status(404).send("Incorrect password")
	}
})

app.post("/logout", async (req, res) => {
	console.log(req.body)
	var username = req.body.username
	const user = await client.db("sdmsDB").collection("user").findOne({"username": username})
	if (user == null || user === undefined) {
		console.log("user not found")
		res.status(404).send("User not found")
		return
	}

	if(user.token === req.body.token) {
		user.token = null
		user_id = user._id
		await client.db("sdmsDB").collection("user").updateOne(
			{"_id": user_id}, {$set: {"token": null}}
		)
		res.status(200).send("Logout successful")
	}
})

//get all messages of a user
app.post("/getmessagesuser", async (req, res) => {
	var token = req.body.token
	var user = await client.db("sdmsDB").collection("user").findOne({"token": token}) //find via _userID, search in visits collection
	if (user == null || user === undefined) {
		console.log("user not found")
		res.status(404).send("User not found")
		return
	}
	user_id = user._id
	var messages = await client.db("sdmsDB").collection("messages").find({"userID": user_id}).toArray()
	res.status(200).send(messages)
})

//get all visits of a user
app.post("/getvisits", async (req, res) => {
	var token = req.body.token
	var user = await client.db("sdmsDB").collection("user").findOne({"token": token}) //find via _userID, search in visits collection
	if (user == null || user === undefined) {
		console.log("user not found")
		res.status(404).send("User not found")
		return
	}
	user_id = user._id
	var visits = await client.db("sdmsDB").collection("visits").find({"userID": user_id}).toArray()
	res.status(200).send(visits)
})

/*
 * Used by DE1-SoC to update visit history and send notification to visitor (pending)
 * DE1-SoC does not have a token, so we use the de1socID
 * The conventional token does not need to be checked because the DE1-SoC is trusted and this operation
 * does not expose any sensitive information
 * 
 * Should have a socket.io connection (doorbell analogy)
*/
app.post("/visit", async (req, res) => {
	console.log(req.body)
	user = await client.db("sdmsDB").collection("user").findOne({"de1socID": req.body.de1socID})
	if (user == null || user === undefined) {
		console.log("user not found")
		res.status(404).send("User not found")
		return
	}
	user_id = user._id
	await client.db("sdmsDB").collection("visits").insertOne(
		{
			"userID": user_id,
			"visitor": req.body.visitor,
			"date": req.body.date,
			"intent": req.body.intent,
			"img": req.body.img
		}
	)
	res.status(200).send("Visit logged")
	io.sockets.emit('visitNotification', "You have a visitor!")
})

//hardware will continuously poll for messages whenever a visit occurs, only stopping when the <STOP> token is received
app.post("/pollmessages", async (req, res) => {
	var user = await client.db("sdmsDB").collection("user").findOne({ "de1socID": req.body.de1socID })
	if (user == null || user === undefined) {
		console.log("user not found")
		res.status(404).send("User not found")
		return
	}
	user_id = user._id
	var messages = await client.db("sdmsDB").collection("messages").find({
		"userID": user_id,
		"sender": "user",
		"read": false
	}).toArray()

	if(messages.length === 0) {
		res.status(200).send("STOP")
		return
	}

	await client.db("sdmsDB").collection("messages").updateMany({
		"userID": user_id,
		"sender": "user",
		"read": false
	}, { $set: { "read": true } } //assume hardware will read all messages
	)
	res.status(200).send(messages)
})

//visitor->user message
//add message entry to message collection
//add message id to user's visit history
app.post("/visitormessage", async (req, res) => {
	console.log(req.body)
	user = await client.db("sdmsDB").collection("user").findOne({"de1socID": req.body.de1socID})
	if (user == null || user === undefined) {
		console.log("user not found")
		res.status(404).send("User not found")
		return
	}
	user_id = user._id
	await client.db("sdmsDB").collection("messages").insertOne(
		{
			"userID": user_id,
			"messageInfo": req.body.messageInfo,
			"date": req.body.date,
			"sender": "visitor",
			"read": false
		}
	)
	msg_id = await client.db("sdmsDB").collection("messages").findOne({"userID": user_id, "messageInfo": req.body.messageInfo, "date": req.body.date, "sender": "visitor", "read": false})
	io.sockets.emit('message', msg + " " + msg_id + "")
	res.status(200).send("Message sent")
})

//user->visitor message socket.io connection
//add message entry to message collection
//add message id to user's visit history
//in hardware, visitor should continuously poll for new messages until the <STOP> token is sent
app.post("/usermessage", async (req, res) => {
	console.log(req.body)
	user = await client.db("sdmsDB").collection("user").findOne({"token": req.body.token})
	if (user == null || user === undefined) {
		console.log("user not found")
		res.status(404).send("User not found")
		return
	}
	user_id = user._id
	await client.db("sdmsDB").collection("messages").insertOne(
		{
			"userID": user_id,
			"messageInfo": req.body.messageInfo,
			"date": req.body.date,
			"sender": "user",
			"read": false
		}
	)
	res.status(200).send("Message sent")
})

//user acknowledges message
app.post("/readMessage", async (req, res) => {
	console.log(req.body)
	await client.db("sdmsDB").collection("messages").updateOne(
		{
			"_id": req.body.messageID
		},
		{
			$set: {
				"read": true
			}
		}
	)
	res.status(200).send("Message read")
})

async function run() {
	try {
		await client.connect() //connect to client (db), we are app
		console.log("Successfully connected to the database")
		server.listen(3000, () => {
			console.log("Server is up on port 3000")
		})
	}
	catch (err) {
		console.log(err)
		await client.close()
	}
}

run()
