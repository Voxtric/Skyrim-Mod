Scriptname DLC1RH06PrisonerScript extends ReferenceAlias  
{Script attached to Prisoner alias in DLC1RH06}

;doing this here instead of in dialogue, in case some other higher priority quest has dialogue that is overriding this quest's dialogue - we still want to release them
Event OnActivate(ObjectReference akActivator)
	if akActivator == Game.GetPlayer()
		GetOwningQuest().setStage(50)
	endif
EndEvent