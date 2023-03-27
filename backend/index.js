var express = require("express")
var bodyParser = require('body-parser')
const http = require('http');

var app = express()
const server = http.createServer(app);
var io = require('socket.io')(server);
const oneDay = 1000 * 60 * 60 * 24;
const crypto = require('crypto')
const speech = require('@google-cloud/speech');
const sCli = new speech.SpeechClient();
const fs = require('fs');

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

const { MongoClient, ObjectId } = require("mongodb") //setup MongoDB
const uri = "mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.6.2"
const client = new MongoClient(uri) //client is the database interface/API

totalAccesses = 0
app.use(express.json())

app.get("/", (req, res) => {
        res.status(200).send("Server is currently up! Total accesses since last server restart: " + totalAccesses)
        totalAccesses += 1
})

app.post("/hardware", (req, res) => {
        console.log(req.body)
        res.status(200).send("Received!")
        io.sockets.emit('hardware_message', 'hardware says hi')
        io.sockets.emit('hardware_message', req.body)
})

app.post("/signup", (req, res) => {
        console.log(req.body)
        client.db("sdmsDB").collection("user").insertOne(
                {
                        "name": req.body.name,
                        "email": req.body.email,
                        "password": req.body.password,
                        "token": null,
                        "de1socID": req.body.de1socID,
                        "lastVisit": null,
                        "presetOptions": ["Is anybody home?", "Your delivery has arrived!", "Are you available to for a moment to discuss our lord and saviour chatGPT?"]
                }
        )
        res.status(200).send("User created")
})

app.post("/login", async (req, res) => {
        console.log(req.body)
        var email = req.body.email
        var password = req.body.password
        const user = await client.db("sdmsDB").collection("user").findOne({ "email": email })
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
                        "name": user.name,
                        "email": user.email,
                        "de1socID": user.de1socID
                })

        } else {
                console.log("incorrect password")
                res.status(404).send("Incorrect password")
        }
})

app.post("/logout", async (req, res) => {
        console.log(req.body)
        var email = req.body.email
        const user = await client.db("sdmsDB").collection("user").findOne({"email": email})
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
// app.post("/getmessagesuser", async (req, res) => {
//         var token = req.body.token
//         var user = await client.db("sdmsDB").collection("user").findOne({"token": token}) //find via _userID, search in visits collection
//         if (user == null || user === undefined) {
//                 console.log("user not found")
//                 res.status(404).send("User not found")
//                 return
//         }
//         user_id = user._id
//         var messages = await client.db("sdmsDB").collection("messages").find({"userID": user_id}).toArray()
//         res.status(200).send(messages)
// })

//get all visits (with messages) of a user
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
        for (var i = 0; i < visits.length; i++) {
                var messages = await client.db("sdmsDB").collection("messages").find({"visitID": visits[i]._id.toString()}).toArray()
                visits[i].messages = messages
        }

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
		//generate a unique id for the visit
        insert_id = new ObjectId()
	date = (new Date()).getTime()
        await client.db("sdmsDB").collection("visits").insertOne(
                {
                        "_id": insert_id,
                        "userID": user_id,
                        "visitor": req.body.visitor,
                        "date": date,
                        "intent": req.body.intent,
                        "img": req.body.img
                }
        )
        console.log(insert_id)
        await client.db("sdmsDB").collection("user").updateOne(
                {"_id": user_id},
                {$set: {"lastVisit": insert_id.toString()}}
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
        visit_id = user.lastVisit
		date = (new Date()).getTime()
        await client.db("sdmsDB").collection("messages").insertOne(
                {
                        "userID": user_id,
                        "messageInfo": req.body.messageInfo,
                        "date": date,
                        "sender": "visitor",
                        "read": false,
                        "visitID": visit_id
                }, (err, res) => {
                        msg_id = res.insertedId
                        io.sockets.emit('message', req.body.messageInfo + " " + msg_id + "")
                        res.status(200).send("Message sent")
                }
        )
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
        visit_id = user.lastVisit
		date = (new Date()).getTime()
        await client.db("sdmsDB").collection("messages").insertOne(
                {
                        "userID": user_id,
                        "messageInfo": req.body.messageInfo,
                        "date": date,
                        "sender": "user",
                        "read": false,
                        "visitID": visit_id
                }
        )
        res.status(200).send("Message sent")
})

//user acknowledges message
app.post("/readMessage", async (req, res) => {
	console.log(req.body)
	await client.db("sdmsDB").collection("messages").updateOne(
		{
			"_id": new ObjectId(req.body.messageID)
		},
		{
			$set: {
				"read": true
			}
		}
	)
	res.status(200).send("Message read")
})

async function quickstart() {
        // The path to the remote LINEAR16 file stored in Google Cloud Storage
        const gcsUri = 'gs://cloud-samples-data/speech/brooklyn_bridge.raw';

        // The audio file's encoding, sample rate in hertz, and BCP-47 language code
        const audio = {
                uri: gcsUri,
        };
        const config = {
                encoding: 'LINEAR16',
                sampleRateHertz: 16000,
                languageCode: 'en-US',
        };
        const request = {
                audio: audio,
                config: config,
        };

        // Detects speech in the audio file
        const [response] = await sCli.recognize(request);
        const transcription = response.results
                .map(result => result.alternatives[0].transcript)
                .join('\n');
        console.log(`Transcription: ${transcription}`);
}

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
        speech2text()
}

async function speech2text() {
	        const filename = './real.mp3'
	        const file = fs.readFileSync(filename)
	        const audioBytes = file.toString('base64')

	        const audio = {
			                content: audioBytes,
			        };

	        const config = {
			                encoding: 'MP3',
			                sampleRateHertz: 16000,
			                languageCode: 'en-US',
			        };
	        const request = {
			                audio: audio,
			                config: config,
			        };
	        const [response] = await sCli.recognize(request);
	        const transcription = response.results
	                .map(result => result.alternatives[0].transcript)
	                .join('\n');
	        console.log(`Transcription: ${transcription}`);
}


run()
