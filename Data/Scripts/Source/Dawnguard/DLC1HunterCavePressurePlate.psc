Scriptname DLC1HunterCavePressurePlate extends OBJECTREFERENCE  

BOOL PROPERTY plate1 AUTO
BOOL PROPERTY plate2 AUTO
BOOL PROPERTY plate3 AUTO
BOOL PROPERTY plate4 AUTO

; //the reference to the master script (dunKarthspirePuzzleMaster)
OBJECTREFERENCE PROPERTY controllerScript AUTO

; //main script variable
DLC1HunterCaveMultiPlateMasterSCRIPT mainScript

; //track the number of people in the trigger
OBJECTREFERENCE triggerActor

SOUND PROPERTY soundHack AUTO

INT actorCount

EVENT OnLoad()
	; //setting the master script to be the one with the stored vars
	mainScript = controllerScript AS DLC1HunterCaveMultiPlateMasterSCRIPT

	mainScript.plate2Down = TRUE

ENDEVENT

EVENT OnTriggerEnter(OBJECTREFERENCE akActionObj)
	
	debug.trace("show the thing already")

	; //increment the actor count
	actorCount += 1

	soundHack.play(self)
	playAnimation("Down")

	; //check for which plate we are and turn on the variable
	IF(plate1)
		mainScript.plate1Down = TRUE
		debug.TRACE("plate 1 down")
	ELSEIF(plate2)
		mainScript.plate2Down = TRUE
		debug.TRACE("plate 2 down")
	ELSEIF(plate3)
		mainScript.plate3Down = TRUE
		debug.TRACE("plate 3 down")
	ELSEIF(plate4)
		mainScript.plate4Down = TRUE
		debug.TRACE("plate 4 down")
	ENDIF

	; //if all the plates are down, open the portcullis
	IF(mainScript.plate1Down && mainScript.plate2Down && mainScript.plate3Down && mainScript.plate4Down)
		mainScript.portDoor.activate(controllerScript)

	ENDIF

	; // make sure to turn off plate1 in case we miss the leave event
	IF(plate1)
		utility.wait(0.5)
		mainScript.plate1Down = FALSE
		debug.TRACE("plate 1 up")

	ENDIF

ENDEVENT


EVENT OnTriggerLeave(OBJECTREFERENCE akActionObj)
	
	; //decrement the actor count
	actorCount -= 1

	; //if everyone has left, reset the plate
	IF(actorCount <= 0)
		
		actorCount = 0
		playAnimation("Up")

		; //check for which plate we are and turn off the variable
		IF(plate1)
			mainScript.plate1Down = FALSE
			debug.TRACE("plate 1 up")
		ELSEIF(plate2)
			mainScript.plate2Down = FALSE
			debug.TRACE("plate 2 up")
		ELSEIF(plate3)
			mainScript.plate3Down = FALSE
			debug.TRACE("plate 3 up")
		ELSEIF(plate4)
			mainScript.plate4Down = FALSE
			debug.TRACE("plate 4 up")
		ENDIF
	
	ENDIF

ENDEVENT