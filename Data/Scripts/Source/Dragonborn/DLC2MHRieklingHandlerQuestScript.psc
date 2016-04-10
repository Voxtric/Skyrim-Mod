Scriptname DLC2MHRieklingHandlerQuestScript extends Quest  

ReferenceAlias[] Property Rieklings auto
ReferenceAlias[] Property RieklingsRemote auto ; on MH01

GlobalVariable Property RieklingsAlive auto
GlobalVariable Property RieklingsTotal auto
GlobalVariable Property RieklingsKilled auto

Quest Property DLC2MH01 auto


Function ProcessFoundRieklings()
	RieklingsAlive.Value = 0
	RieklingsTotal.Value = 0

	int count = 0
	while (count < Rieklings.Length)
		ObjectReference riek = Rieklings[count].GetReference()
		
; 		Debug.Trace("DLC2MH01: Checking riekling slot " + count)
		if (riek != None)
; 			Debug.Trace("DLC2MH01: Slot " + count + " was filled; passing on.")
			RieklingsRemote[count].ForceRefTo(riek)
			RieklingsAlive.Value += 1
			RieklingsTotal.Value += 1
		endif

		count += 1
	endwhile

	count = 0
	while (count < Rieklings.Length)
		Actor riekRef = RieklingsRemote[count].GetActorReference()
		if (riekRef != None)
			if (riekRef.IsDead())
				RieklingsAlive.Value -= 1
			endif
		endif
		count += 1
	endwhile

	RieklingsKilled.Value = RieklingsTotal.Value - RieklingsAlive.Value

	DLC2MH01.UpdateCurrentInstanceGlobal(RieklingsTotal)
	DLC2MH01.UpdateCurrentInstanceGlobal(RieklingsKilled)

	if (!DLC2MH01.GetStageDone(20))
		DLC2MH01.SetStage(20)
	endif

; 	Debug.Trace("DLC2MH01: Swapping objectives as player got to Thirsk.")
	DLC2MH01.SetObjectiveDisplayed(20, false)
	DLC2MH01.SetObjectiveDisplayed(21, true)

EndFunction
