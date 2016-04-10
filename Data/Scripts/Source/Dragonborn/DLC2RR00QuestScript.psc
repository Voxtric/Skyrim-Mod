Scriptname DLC2RR00QuestScript extends Quest  

GlobalVariable Property pDLC2RRQuestChain Auto Conditional

Function CountQuests()

	pDLC2RRQuestChain.SetValue(pDLC2RRQuestChain.GetValue() + 1)

	if pDLC2RRQuestChain.GetValue() >= 2
		SetStage(10)
	endif

endFunction