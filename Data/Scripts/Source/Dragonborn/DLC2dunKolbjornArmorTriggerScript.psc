Scriptname DLC2dunKolbjornArmorTriggerScript extends ObjectReference  
{Script on the armor trigger in Kolbjorn Barrow. Disables the static armor and gives the player the real armor.}

Armor property DLC2dunKolbjornCuirass Auto

Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		GoToState("Done")
		Self.Disable()
		Self.GetLinkedRef().Disable() ;Disable static armor.
		akActivator.AddItem(DLC2dunKolbjornCuirass)
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState
