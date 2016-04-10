Scriptname DLC2DefaultShowMessageOnActivate extends ObjectReference  
{Show the selected message when this is activated.}

Message Property myMessage Auto
{Message to show when this is activated)}


Event OnActivate(ObjectReference akActionRef)

	myMessage.Show()

EndEvent