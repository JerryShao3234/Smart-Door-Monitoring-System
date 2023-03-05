var express = require("express")
var bodyParser = require('body-parser')

var app = express()
const http = require('http');
const server = http.createServer(app);
var io = require('socket.io')(server);

app.use(bodyParser.urlencoded({
	  extended: true
}));
app.use(cors());

io.on('connection', (socket) => {
	console.log('connected');
	socket.on('message', (msg) => {
		console.log(msg);
		socket.broadcast.emit('message', msg);
	});
});

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
			"visitHistory": [],
			"outgoingMessages": [],
			"incomingMessages": []
		}
	)
})

app.get("/getvisits/:username", (req, res) => {
	client.db("sdmsDB").collection("user").findOne(
		{
			"username": req.params.username,
		}
	).then((result) => {
		res.send(result.visitHistory == null ? "No visit history" : result.visitHistory)
	}).catch((err) => {
		res.send("Error with username. Are you sure you typed it correctly?")
	})
})

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
server.listen(3001);
