Scriptname DLCHouseExteriorFinishRoomScript extends ObjectReference  
{script placed on finished single room pieces which
disables the specified array of refs onLoad

}

bool bDone		; do once flag

Event OnLoad()
	if !bDone
		debug.trace(self + "Loading - disabling specified refs...")
		bDone = true
		int currentIndex = 0
		while currentIndex < DisableList.Length
			debug.trace(self + " ... disabling " + DisableList[currentIndex])
			DisableList[currentIndex].Disable()
			currentIndex = currentIndex + 1
		endWhile

	endif
endEvent

ObjectReference[] Property DisableList  Auto  
{list of refs to disable when I'm enabled}



