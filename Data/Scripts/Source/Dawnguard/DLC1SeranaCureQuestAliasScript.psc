Scriptname DLC1SeranaCureQuestAliasScript extends ReferenceAlias  



Event OnLoad()
	(GetOwningQuest() as DLC1SeranaCureQuestScript).SetEyes()
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	(GetOwningQuest() as DLC1SeranaCureQuestScript).SetEyes()
EndEvent
