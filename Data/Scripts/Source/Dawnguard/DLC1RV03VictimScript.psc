Scriptname DLC1RV03VictimScript extends ReferenceAlias  
{Script attached to Victim Alias in DLC1RV03 quest}

Event OnUpdate()

	Quest myQuest = GetOwningQuest()

	if myQuest.GetStage() < 255 && (GetActorReference().isDisabled() || GetActorReference().isDeleted())
		myQuest.SetStage(300) ;fail quest

	elseif myQuest.GetStage() < 255
		registerForSingleUpdate(5)

	endif
	
EndEvent