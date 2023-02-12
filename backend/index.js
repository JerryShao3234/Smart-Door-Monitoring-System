var express = require("express")
var app = express()

const { MongoClient } = require("mongodb") //setup MongoDB
const uri = "mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.6.2"
const client = new MongoClient(uri) //client is the database interface/API

totalAccesses = 0
app.use(express.json())

app.get("/", (req, res) => {
	res.send("Hello World! Total accesses since last server restart: " + totalAccesses)
	totalAccesses += 1
})
