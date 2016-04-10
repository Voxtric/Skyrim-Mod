Scriptname DLC1SeranaCureSelfQuestPlayerScript extends ReferenceAlias  


Event OnPlayerLoadGame()
	Debug.Trace("SERANA CURE QUEST: Player loading, setting eyes.")
	(GetOwningQuest() as DLC1SeranaCureQuestScript).SetEyes()
EndEvent
