Scriptname DLC2ThirskDoorScript extends ObjectReference  

ObjectReference Property OutsideMarker auto
ReferenceAlias Property Bujold auto
Scene Property ExileScene auto

Event OnActivate(ObjectReference akActivator)
	if (IsActivationBlocked())
		if (akActivator == Game.GetPlayer())
			; don't let the player through
		else
			; akActivator.MoveTo(OutsideMarker)
			Activate(akActivator, true)
			if (akActivator == Bujold.GetReference() && ExileScene.IsPlaying())
				ExileScene.Stop()
			endif
		endif
	endif
EndEvent
