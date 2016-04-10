Scriptname DLC1VQ04EnterUndercroftTriggerScript extends ObjectReference  

ReferenceAlias Property Serana auto
DLC1VQ04RNPCQuestScript Property VQ04 auto

Event OnTriggerEnter(ObjectReference akActivator)
	Serana.GetReference().MoveTo(Game.GetPlayer())
	VQ04.LockSeranaIn()
	Delete()
EndEvent
