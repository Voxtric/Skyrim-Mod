Scriptname DLC2MH01EnterThirskTrigger extends ObjectReference  


Quest Property DLC2MH01 auto
Quest Property DLC2MH01PostQuest auto
ReferenceAlias Property Bujold auto
Cell Property Thirsk auto
ObjectReference Property ThirskCenter auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (DLC2MH01.IsCompleted())
			if (DLC2MH01PostQuest.GetStage() < 10)
				Actor BujoldActor = Bujold.GetActorReference()
				if (!BujoldActor.IsDead() && BujoldActor.GetParentCell() != Thirsk)
					BujoldActor.MoveTo(ThirskCenter)
				endif
			endif
		endif
	endif
EndEvent
