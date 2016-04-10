Scriptname DLC2RRFavor02QuestScript extends Quest  Conditional

Ingredient Property pDLC2NetchJelly Auto Conditional
GlobalVariable Property pDLC2RRF02JellyCount Auto Conditional

Function Jellycount()

	float CurrentCount = Game.GetPlayer().GetItemCount(pDLC2NetchJelly)

	pDLC2RRF02JellyCount.Value = CurrentCount
	UpdateCurrentInstanceGlobal(pDLC2RRF02JellyCount)
	if CurrentCount >= 5
		if IsObjectiveDisplayed(20) == 0
			SetObjectiveCompleted(10,1)
			SetObjectiveDisplayed(20,true,true)
		endif
	elseif CurrentCount < 5
		SetObjectiveCompleted(10,0)
		SetObjectiveDisplayed(20,0)
		SetObjectiveDisplayed(10,true,true)	
	endif

endFunction