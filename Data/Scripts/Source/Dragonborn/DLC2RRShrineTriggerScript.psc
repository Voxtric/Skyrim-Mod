Scriptname DLC2RRShrineTriggerScript extends ObjectReference  

Quest Property DLC2DialogueRavenRock  Auto  


Event OnTriggerEnter (ObjectReference ActionRef)

DLC2DialogueRRQuestScript QuestScript = DLC2DialogueRavenRock as DLC2DialogueRRQuestScript

	if ActionRef == Game.GetPlayer()
		if QuestScript.ShrineTrigger == 0
			QuestScript.ShrineTrigger=1
			Disable()
		endif
	endif

EndEvent