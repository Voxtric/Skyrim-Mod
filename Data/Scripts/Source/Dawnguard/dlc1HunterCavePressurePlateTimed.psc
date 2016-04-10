Scriptname dlc1HunterCavePressurePlateTimed extends OBJECTREFERENCE  

BOOL waitRunning=FALSE
BOOL PROPERTY TIMED=TRUE AUTO
INT PROPERTY timer=5 AUTO

EVENT  onTriggerEnter(OBJECTREFERENCE akActionRef)

	IF(!waitRunning)
		
		; // play the animation and sound
		playAnimation("Down")
		
		waitRunning = TRUE

		activate(self as OBJECTREFERENCE)

		; // if we're a timed version, run the timer
		IF(TIMED)
			utility.wait(timer)

			(self as OBJECTREFERENCE).getLinkedRef().activate(self as OBJECTREFERENCE)

			utility.wait(0.5)
		ENDIF

		waitRunning = FALSE

		; // play the animation
		playAnimation("Up")

	ENDIF


ENDEVENT 