## SDMS: Smart Door Monitoring System (Jerry's local copy)

### Project Description

We created a system which allows visitors to communicate with homeowners through an interface, while also allowing homeowners to view information about each visitor and communicate with them in real time.

Our system consists of three main components:

1. Hardware (`VGA_Touchscreen_Integration/source`) - Wifi, Touchscreen, and VGA all work together to provide an interface for visitors at the door to send messages to the homeowner.

2. User (`sdms-app`)- An Android mobile application which can be used by the homeowner to check messages and visitor information, send replies, and receive real-time notifications on their phone. The app also provides support to the hardware component by serving as a camera and microphone.

3. Cloud (`backend`)- A server and database for performing backend computations, storing information about each visit, and transmitting data between the Hardware and User components.
