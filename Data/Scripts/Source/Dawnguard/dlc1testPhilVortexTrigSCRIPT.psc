Scriptname dlc1testPhilVortexTrigSCRIPT extends ObjectReference  

import utility
import game
import debug

EFFECTSHADER PROPERTY vortexShader AUTO 

FLOAT property fHurlForce = 125.0 auto
FLOAT property floatHeight = 32.0 auto

INT i=0
INT arrayCount=0
FLOAT randWait=0.0
INT arraySize=10;

BOOL GO=FALSE
BOOL THROWING=FALSE


OBJECTREFERENCE[] debrisArray
OBJECTREFERENCE myActor

EVENT onLoad()
	debrisArray = new OBJECTREFERENCE[10]

	wait(0.25)

	GO = TRUE

	wait(1)

	THROWING = TRUE

ENDEVENT

EVENT onTrigger(OBJECTREFERENCE akTrigActor)

	myActor = akTrigActor

	IF(myActor as ACTOR == FALSE && GO && myActor != NONE && !THROWING)
		
		IF(debrisArray.find(myActor) < 0 )
			debrisArray[i] = myActor
			i += 1

		ENDIF

	ELSEIF(THROWING)	
		
		SELF.disable()
		THROWING = FALSE

		; //subtract one since arrays are 0-num
		arrayCount = (debrisArray.Length - 1)

		; //make'em float
		WHILE(arrayCount > 0)
			
			IF(debrisArray[arrayCount] != NONE)
				trace("prepping: " + debrisArray[arrayCount])
				vortexShader.play((debrisArray[arrayCount]))
				;vortexShader.play(game.getPlayer())
				
				prepDebris(debrisArray[arrayCount])
				
				randWait = randomFloat(0.1, 0.3)

				wait(randWait)
			
			ENDIF

			arrayCount -= 1
		
		ENDWHILE

		; //subtract one since arrays are 0-num
		arrayCount = (debrisArray.Length - 1)

		; //throw them!
		WHILE(arrayCount > 0)
			
			IF(debrisArray[arrayCount] != NONE)
				trace("launching: " + debrisArray[arrayCount])
				hurlDebris(debrisArray[arrayCount], game.getPlayer())
			
				randWait = randomFloat(0.1, 0.3)

				wait(randWait)

			ENDIF

			arrayCount -= 1
		
		ENDWHILE

	ENDIF

ENDEVENT

FUNCTION prepDebris(objectReference debris)
	debris.SetMotionType(debris.Motion_Keyframed)
	debris.translateTo(debris.x, debris.y, debris.z + floatHeight, debris.getangleX()+90, debris.getAngleY()+90, debris.getAngleZ()+90, 24, 64)
	
ENDFUNCTION 

FUNCTION hurlDebris(objectReference Debris, actor victim)
	debris.SetMotionType(debris.Motion_Dynamic)
	float transX
	float transY
	float transZ
	transX = (victim.getPositionX()) - (debris.getPositionX())
	transY = (victim.getPositionY()) - (debris.getPositionY())
	transZ = (victim.getPositionZ()) - (debris.getPositionZ() + 96)
	debris.applyHavokImpulse(transX, transY, transZ, (fHurlForce * debris.getMass()))
	;vortexShader.stop(debris)

ENDFUNCTION 

