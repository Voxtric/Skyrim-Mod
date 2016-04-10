Scriptname DLC2RR02TilisuTriggerScript extends ObjectReference

Quest Property pDLC2RR02  Auto  
int Property pTriggered Auto
ReferenceAlias Property pTilisuAlias Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == pTilisuAlias.GetRef()
			if pDLC2RR02.GetStage() == 40
				pDLC2RR02.SetStage(50)
				pTriggered = 1
			endif
		endif
	endif

endEvent
