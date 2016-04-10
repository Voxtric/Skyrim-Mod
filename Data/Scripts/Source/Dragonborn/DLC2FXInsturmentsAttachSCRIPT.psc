Scriptname DLC2FXInsturmentsAttachSCRIPT extends ActiveMagicEffect conditional
{Attaches Instruments FX to actor}

import utility
import debug

VisualEffect property myFX Auto
ObjectReference selfRef

;******************************************************

Event OnEffectStart(Actor Target, Actor Caster)
	selfRef = caster		
	while !(selfRef.is3dLoaded())
		;wait for 3D to load before attach FX
		wait(0.25)
	endWhile
	;3D is loaded
	myFX.play(selfref, -1)
endEvent

;******************************************************

Event OnEffectFinish(Actor Target, Actor Caster)
	myFX.Stop(selfRef)
endEvent
	
;******************************************************