scriptName DLC1VCBoatDoorScript extends objectReference

objectReference property MyMapMarker auto

event onActivate(objectReference ActivateRef)
	;if ActivateRef == game.getPlayer()
	;	game.FastTravel(MyMapMarker)
	;endif
	
	if ActivateRef == game.getPlayer()
	
		objectReference myDoor = getLinkedRef()
		myDoor.activate(game.getPlayer())
		;game.getPlayer().activate(myDoor)
	endif
endEvent
