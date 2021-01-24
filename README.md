#Bro bot

Work in process, use it at your own risk.  It's a sort of parrot bot in that it 
repeats content from other channels.  The genesis of this was to build a sort of 
replacement for hivemind when it was taken down.  But rather than build a system 
store/maintain the content behind the bot we use discord channels instead.

The activation words and channels are listed below.  

### !bro
Channel: bro
Picks a random mesage from the first 100 and repeats it

### !broette
Channel: broette
Picks a random mesage from the first 100 and repeats it

### !scarporen
Channel: scarporen
Picks a random mesage from the first 100 and repeats it

### !brah
This is a bit more complex the rest.  What it does is take the parameters to 
the request and try to derive a channel name from it.  For example if the 
request was *!brah crew red battleship* it'd look for a channel named 
*brah-crew-red-battleship*.  Once the channel is determined the bot will then
read the first 100 messages from that channel and repeat them back.

### ***Note:***
Don't use any of the commands in the channels referenced by the command or 
the bot will activate on itself (yes I could prevent this but I'm lazy).  

It's also recommended that you make the channels the bot reads from private 
and not visible to your general user.

**Add it to your server today, if you want.**

### TODO Items

- support for embedded images
- tests
- get better with golang



