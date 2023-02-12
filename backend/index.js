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
	    catch(err) {
		            console.log(err)
		            await client.close()
		        }
}

run()
