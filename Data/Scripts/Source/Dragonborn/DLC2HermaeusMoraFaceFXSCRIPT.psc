Scriptname DLC2HermaeusMoraFaceFXSCRIPT extends ObjectReference  
{Plays all of the HM face fx when activated}

ObjectReference Property myHMface01 Auto
ObjectReference Property myHMface02 Auto
ObjectReference Property myHMface03 Auto
ObjectReference Property myHMface04 Auto
ObjectReference Property myHMface05 Auto
ObjectReference Property myHMface06 Auto
ObjectReference Property myHMface07 Auto
ObjectReference Property myHMface08 Auto

int iMaxCount = 10 ; max times to loop waiting for 3D to load

auto State Waiting
; default state
endState

State HermaeusMoraAppear

Event OnBeginState() ;;;this bloc makes the hermaeus mora art appear
	 if (myHMface01)
	 	myHMface01.disable();;this delay gets same peices out of sync
		utility.wait(Utility.RandomFloat(0.2, 0.5))
		myHMface01.enable();;;;;;;;;;;;
		waitfor3D(myHMface01)
		myHMface01.SetAnimationVariableFloat("fToggleBlend", 1.0)
	endif
	 if (myHMface02)
		myHMface02.SetAnimationVariableFloat("fToggleBlend", 1.0)
	endif
	 if (myHMface03)
		myHMface03.disable();;this delay gets same peices out of sync
		utility.wait(Utility.RandomFloat(0.2, 0.5))
		myHMface03.enable()	;;;;;;	
		waitfor3D(myHMface03)
		myHMface03.SetAnimationVariableFloat("fToggleBlend", 1.0)
	endif
	 if (myHMface04)
		myHMface04.SetAnimationVariableFloat("fToggleBlend", 1.0)
	endif
	 if (myHMface05)
	 	 myHMface05.disable();;this delay gets same peices out of sync
		utility.wait(Utility.RandomFloat(0.2, 0.5))
		myHMface05.enable();;;;;;;;;;;;
		waitfor3D(myHMface05)
		myHMface05.SetAnimationVariableFloat("fToggleBlend", 1.0)
	endif
	 if (myHMface06)
		myHMface06.SetAnimationVariableFloat("fToggleBlend", 1.0)
	endif
	 if (myHMface07)
	 	 myHMface07.disable();;this delay gets same peices out of sync
		utility.wait(Utility.RandomFloat(0.2, 0.5))
		myHMface07.enable();;;;;;;;;;;;
		waitfor3D(myHMface07)
		myHMface07.SetAnimationVariableFloat("fToggleBlend", 1.0)
	endif
	 if (myHMface08)
		myHMface08.SetAnimationVariableFloat("fToggleBlend", 1.0)
	endif
EndEvent

endState

State HermaeusMoraDisappear

Event OnLoad()
	; failsafe in case HM was unloaded when changed to disappeared state
	myHMface01.Disable()
	myHMface02.Disable()
	myHMface03.Disable()
	myHMface04.Disable()
	myHMface05.Disable()
	myHMface06.Disable()
	myHMface07.Disable()
	myHMface08.Disable()
EndEvent

Event OnBeginState() ;;;this bloc makes the hermaeus mora art disappear
	 if (myHMface01)
		utility.wait(Utility.RandomFloat(0.2, 0.5))
		myHMface01.SetAnimationVariableFloat("fToggleBlend", 0.0)
	endif
	 if (myHMface02)
		myHMface02.SetAnimationVariableFloat("fToggleBlend", 0.0)
	endif
	 if (myHMface03)
		utility.wait(Utility.RandomFloat(0.2, 0.5))
		myHMface03.SetAnimationVariableFloat("fToggleBlend", 0.0)
	endif
	 if (myHMface04)
		myHMface04.SetAnimationVariableFloat("fToggleBlend", 0.0)
	endif
	 if (myHMface05)
		utility.wait(Utility.RandomFloat(0.2, 0.5))
		myHMface05.SetAnimationVariableFloat("fToggleBlend", 0.0)
	endif
	 if (myHMface06)
		myHMface06.SetAnimationVariableFloat("fToggleBlend", 0.0)
	endif
	 if (myHMface07)
		utility.wait(Utility.RandomFloat(0.2, 0.5))
		myHMface07.SetAnimationVariableFloat("fToggleBlend", 0.0)
	endif
	 if (myHMface08)
		myHMface08.SetAnimationVariableFloat("fToggleBlend", 0.0)
	endif
EndEvent

endState

function ChangeState(bool bHermaeusMoraAppear = true)
	if bHermaeusMoraAppear
		GotoState("HermaeusMoraAppear")
	else
		gotoState("HermaeusMoraDisappear")
	endif
endFunction

; pass in ref, returns when 3D is loaded or maxCount reached in loop
function waitFor3D(ObjectReference myFace)
; 	debug.trace(self + " waiting to load " + myFace)
; 	debug.trace(self + " iCount=" + iCount + ", is3dloaded=" +myFace.Is3DLoaded())
	int iCount = 0
	while !myFace.Is3DLoaded() && iCount < iMaxCount
		iCount = iCount + 1
		utility.wait(Utility.RandomFloat(0.2, 0.5))
; 		debug.trace(self + " iCount=" + iCount + ", is3dloaded=" +myFace.Is3DLoaded())
	endwhile
endFunction

