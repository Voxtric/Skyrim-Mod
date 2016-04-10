Scriptname DLC1DefaultEnableFastTravelTrigSCRIPT extends ObjectReference Hidden 
{Enables Fast Travel when the player enters this trigger.}

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		Game.EnableFastTravel()
	endif
EndEvent