Scriptname testPhilSlotMachineCoinSlotSCRIPT extends ObjectReference  

MESSAGE PROPERTY depositMSG AUTO

OBJECTREFERENCE PROPERTY controllerScript AUTO
testPhilSlotMachineLeverSCRIPT mainScript

EVENT ONLOAD()
	; //setting the master script to be the one with the stored vars
	mainScript = controllerScript AS testPhilSlotMachineLeverSCRIPT


ENDEVENT

EVENT ONACTIVATE(OBJECTREFERENCE trigRef)

	if(trigRef == game.getPlayer())
		mainscript.deposit = depositMSG.Show()

	endif

ENDEVENT