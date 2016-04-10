Scriptname DLC1testPhilVortexSCRIPT extends ActiveMagicEffect  

import game
import utility
import debug

formlist property validObjects auto
float property fRange = 512.0 auto
float property fHurlForce = 128.0 auto
float property floatHeight = 128.0 auto

EVENT OnEffectStart(Actor Target, Actor Caster)
	
	objectReference[] debrisArray = new objectReference[10]
	
	; first, fill the array with objects.  Note that it's likely some will be duplicates or NONE(?)
	; NOTE - if and how should that be handled?  Failure in particular.
	;debug.notification("Chaos Field - begin searching for debris")
	int i = 0
	while i < 10
		debrisArray[i] = findRandomReferenceofanyTypeInLIst(validObjects, target.x, target.y, target.z, fRange)
		debug.trace("i - "+debrisArray[i])
		i += 1
		wait(0.01)
	endWhile
	
	;debug.notification("Chaos Field - begin rolling debris")
	; once the array is (hopefully) filled, start tossing stuff around.
	i = 0
	while i < 10
		prepDebris(debrisArray[i],target)
		i += 1
		wait(0.01)
	endWhile
	
	wait(1.5)
	
	;debug.notification("Chaos Field - begin hurling debris")
	i = 0
	while i < 10
		hurlDebris(debrisArray[i],target)
		i += 1
		wait(0.01)
	endWhile


ENDEVENT 


FUNCTION prepDebris(objectReference Debris, actor victim)
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
	transZ = (victim.getPositionZ()) - (debris.getPositionZ() + 128)
	debris.applyHavokImpulse(transX, transY, transZ, fHurlForce)

ENDFUNCTION 