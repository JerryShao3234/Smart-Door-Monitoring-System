var express = require("express")
var multer = require('multer')
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

const storage = multer.diskStorage({
        destination: (req, file, cb) => {
          // specify the destination folder for uploaded files, relative file path
          cb(null, 'uploads/');
        },
        filename: (req, file, cb) => {
          // specify how to name the uploaded files
          cb(null, file.originalname);
        }
      });
      
      const upload = multer({ storage: storage });

app.use(bodyParser.urlencoded({
          extended: true
}));

io.on('connection', (socket) => {
        console.log('connected');
        socket.on('message', (msg) => {
                console.log(msg);
                io.sockets.emit('message', msg)
        });
        socket.on('image', async (msg) => {
                console.log(msg);
                io.sockets.emit('image', "image received by server")
                //get userID using de1socID
                //update image in user object using lastvisit
		var msg_js = JSON.parse(msg)
                const user = await client.db("sdmsDB").collection("user").findOne({ de1socID: msg_js.de1socID})
                if (user == null || user === undefined) {
                        console.log("user not found")
                        const users = await client.db("sdmsDB").collection("user").find({}).toArray()
                        console.log(users)
                        io.sockets.emit('image', "problem with image: user not found")
                        return
                }
                await client.db("sdmsDB").collection("visits").updateOne(
                        {"_id": new ObjectId(user.lastVisit)},
                        {$set: {"img": msg_js.image}}
                ).then(()=>{console.log("image updated")})
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
	console.log(visits)
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

//If intent is "record" send a socket.io message to the app to start recording
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
                        "img": req.body.img //no longer necessary
                }
        )
        console.log(insert_id)
        await client.db("sdmsDB").collection("user").updateOne(
                {"_id": user_id},
                {$set: {"lastVisit": insert_id.toString()}}
        )
        //io.sockets.emit('newMessage', "You have a visitor!")
        obj = {
                "de1socID": "123",
                "visitor": "mockvisitorID"
        }

        if(req.body.intent === "Record") {
                obj = {
                        "de1socID": "123",
                        "visitor": req.body.visitor
                }
                io.sockets.emit('image', obj)
                io.sockets.emit('audio', obj)
                res.status(200).send("Visit logged")
                return
        }

        messageInfo = ""

        switch (req.body.intent) {
                case "Family or friend":
                        messageInfo = "A family member or friend is looking for you!";
                        break;
                case "Package Delivery":
                        messageInfo = "A package delivery has arrived at your door!";
                        break;
                case "Advertisement":
                        messageInfo = "A door-to-door sales representative wants to speak with you.";
                        break;
                // case "Record":
                //         messageInfo = "A visitor wants to record a message for you.";
                //         obj = {
                //                 "de1socID": "123",
                //                 "visitor": req.body.visitor
                //         }
                //         io.sockets.emit('audio', obj)
                //         break;
                default:
                        console.log("Invalid intent")
                        res.status(404).send("Invalid intent")
                        return
        }

        //create a message for the visit
        await client.db("sdmsDB").collection("messages").insertOne(
                {
                        "visitID": insert_id.toString(),
                        "userID": user_id,
                        "sender": "visitor",
                        "messageInfo": messageInfo,
                        "date": date,
                        "read": false,
                        "img": req.body.img
                }
        )

        await client.db("sdmsDB").collection("messages").updateMany({
                "userID": user_id,
                "sender": "user",
                "read": false
        }, { $set: { "read": true } } //assume hardware will read all messages
        )

        io.sockets.emit('image', obj)
        res.status(200).send("Visit logged")
})

app.post("/testaudio", async (req, res) => {
        console.log("testaudio called")
        obj = {
                "de1socID": "123",
                "visitor": "mockvisitorID"
        }
        io.sockets.emit('audio', obj)
        res.status(200).send("Visit logged")
})

app.post("/testimage", async (req, res) => {
        console.log("testimage called")
        obj = {
                "de1socID": "123",
                "visitor": "mockvisitorID"
        }
        io.sockets.emit('image', obj)
        res.status(200).send("Visit logged")
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

//multipart form data containing a wav file
//the endpoint will save the file locally
app.post("/audio", upload.single('audio'), async (req, res) => {
        console.log(req.file)

        //const filepath = "~/CPEN391_git/l2a-02-sdms/backend/" + "audio.wav"
        const filename = './uploads/audio.wav'
        const file = fs.readFileSync(filename)
        const audioBytes = file.toString('base64')

        const audio = {
                content: audioBytes,
        };

        const config = {
                //encoding: 'MP3',
                encoding: 'WAV',
                sampleRateHertz: 44100,
                languageCode: 'en-US',
                audioChannelCount: 2,
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
                        "messageInfo": transcription,
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

        res.status(200).send("Audio received")
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

async function speech2text() {
	        //const filename = './real.mp3'
                const filename = './uploads/audio.wav'
	        const file = fs.readFileSync(filename)
	        const audioBytes = file.toString('base64')

	        const audio = {
			                content: audioBytes,
			        };

	        const config = {
			                //encoding: 'MP3',
                                        encoding: 'WAV',
			                sampleRateHertz: 44100,
			                languageCode: 'en-US',
                                        audioChannelCount: 2,
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
