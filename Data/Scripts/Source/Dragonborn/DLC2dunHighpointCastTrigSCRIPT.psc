scriptName DLC2dunHighpointCastTrigSCRIPT extends objectReference
{when player enters trigger, three spells are cast at the central dias and then an ash guardian enables on the dias}

import utility
import debug

spell property mySpell auto
spell property myCenterSpell auto
objectReference property myMarker1 auto
objectReference property myMarker2 auto
objectReference property myMarker3 auto
objectReference property myCenterMarker auto
objectReference property myBase auto
EffectShader property myFXShader auto
objectReference property myTrigger auto

;******************************************************

auto State active
	Event onActivate(ObjectReference akActionRef)
			gotoState ("done")
			mySpell.Cast(myMarker1, myCenterMarker)
			Wait(0.25)
			mySpell.Cast(myMarker2, myCenterMarker)
			Wait(0.25)
			mySpell.Cast(myMarker3, myCenterMarker)
			Wait(0.25)
			mySpell.Cast(myMarker1, myCenterMarker)
			Wait(0.25)
			mySpell.Cast(myMarker3, myCenterMarker)
			Wait(0.25)
			mySpell.Cast(myMarker2, myCenterMarker)
			wait(0.25)
			myFXShader.play(myBase)
			Wait(1)
			myCenterSpell.Cast(myCenterMarker)
			myFXShader.stop(myBase)
			wait(1)
			myTrigger.enable()
	endEvent
endState

;******************************************************

State done
	; nothing happens here.
endState

;******************************************************