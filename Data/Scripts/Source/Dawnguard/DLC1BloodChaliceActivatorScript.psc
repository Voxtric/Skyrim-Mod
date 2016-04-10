Scriptname DLC1BloodChaliceActivatorScript extends ObjectReference  
{Attached to DLC1BloodChaliceActivatorFull activator}

DLC1RadiantScript Property DLC1Radiant auto

Event OnActivate(ObjectReference akActivator)
	if akActivator == Game.GetPlayer()
		DLC1Radiant.ChaliceDrink()
	endif
EndEvent

