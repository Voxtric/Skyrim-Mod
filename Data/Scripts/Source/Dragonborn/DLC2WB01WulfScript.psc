Scriptname DLC2WB01WulfScript extends ReferenceAlias  


ReferenceAlias Property Letter auto

Event OnDeath(Actor akKiller)
	if ((GetOwningQuest().GetStage() > 0) && !GetOwningQuest().IsCompleted())
		GetActorReference().AddItem(Letter.GetReference())
		GetOwningQuest().SetStage(205)
	endif
EndEvent
