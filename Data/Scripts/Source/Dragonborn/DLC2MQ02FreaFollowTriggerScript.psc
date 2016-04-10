Scriptname DLC2MQ02FreaFollowTriggerScript extends ReferenceAlias  Conditional

Quest Property DLC2MQ02  Auto  

ReferenceAlias Property Frea  Auto  

Scene Property FreaFollowScene  Auto

Event OnTriggerEnter (ObjectReference ActionRef)

DLC2MQ02QuestScript QuestScript = DLC2MQ02 as DLC2MQ02QuestScript

	if ActionRef == Game.GetPlayer()
		If DLC2MQ02.GetStage() == 30
			if QuestScript.FreaHold == 1
				FreaFollowScene.Start()
			endif
		endif
	endif

EndEvent