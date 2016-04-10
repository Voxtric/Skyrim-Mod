Scriptname DLC2MQ05HermaeusMoraFXScript extends ObjectReference  
{specific for MQ05 Skaal scene}


ObjectReference[] Property myHMface Auto

int newState = 0
int lastState = 0
int iMaxCount = 10	; max times to loop waiting for 3D to load

auto State Waiting
; default state
endState

State HermaeusMoraAppear

Event OnBeginState() ;;;this bloc makes the hermaeus mora art appear

	int iIndex = lastState
	while iIndex < newState
; 		debug.trace(self + " iIndex=" + iIndex)
		if myHMFace[iIndex]
; 			debug.trace(self + " enabling " + myHMface[iIndex])
			myHMface[iIndex].disable()					
			;;this delay gets same peices out of sync
			utility.wait(Utility.RandomFloat(0.2, 0.5))
			myHMface[iIndex].enable()
			int iCount = 0
			while !myHMface[iIndex].Is3DLoaded() && iCount < iMaxCount
; 				debug.trace(self + " iCount=" + iCount + ", is3dloaded=" + myHMface[iIndex].Is3DLoaded())
				iCount = iCount + 1
				utility.wait(Utility.RandomFloat(0.2, 0.5))
			endwhile
			myHMface[iIndex].SetAnimationVariableFloat("fToggleBlend", 1.0)
		endif
		iIndex = iIndex + 1
	endWhile
	; save last state
	lastState = newState
EndEvent

endState

State HermaeusMoraDisappear

Event OnLoad()
	; failsafe in case HM was unloaded when changed to disappeared state
	int iIndex = 0
	while iIndex < myHMface.length
		if myHMface[iIndex]
			myHMface[iIndex].Disable()
		endif
		iIndex = iIndex + 1
	endWhile
EndEvent

Event OnBeginState() ;;;this bloc makes the hermaeus mora art disappear
	int iIndex = 0
	while iIndex < lastState
		if myHMface[iIndex]
			utility.wait(Utility.RandomFloat(0.2, 0.5))
			myHMface[iIndex].SetAnimationVariableFloat("fToggleBlend", 0.0)
		endif
		iIndex = iIndex + 1
	endWhile
	newState = 0
	lastState = 0
EndEvent

endState

function ChangeState(bool bHermaeusMoraAppear = true, int iChangeToState = -1)
	if bHermaeusMoraAppear
		; enable faces to new state
		if iChangeToState == -1
			newState = newState + 1
		else
			newState = iChangeToState
		endif
		GotoState("HermaeusMoraAppear")
	else
		gotoState("HermaeusMoraDisappear")
	endif
endFunction



