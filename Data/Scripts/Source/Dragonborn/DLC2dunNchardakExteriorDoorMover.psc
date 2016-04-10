Scriptname DLC2dunNchardakExteriorDoorMover extends ObjectReference
{Moves the player and their followers through Nchardak's fake exterior door.}

Quest property DLC2MQ04 Auto
ReferenceAlias property DLC2MQ04Neloth Auto
ReferenceAlias property PlayerFollower Auto
ReferenceAlias property PlayerAnimalCompanion Auto
ObjectReference property WarpDestination Auto

Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (DLC2MQ04.IsRunning() && DLC2MQ04Neloth.GetActorRef() != None)
			DLC2MQ04Neloth.GetActorRef().Disable()
			DLC2MQ04Neloth.GetActorRef().MoveTo(WarpDestination)
			DLC2MQ04Neloth.GetActorRef().Enable(True)
		EndIf
		if (PlayerFollower.GetActorRef() != None)
			PlayerFollower.GetActorRef().Disable()
			PlayerFollower.GetActorRef().MoveTo(WarpDestination)
			PlayerFollower.GetActorRef().Enable(True)
		EndIf
		if (PlayerAnimalCompanion.GetActorRef() != None)
			PlayerAnimalCompanion.GetActorRef().Disable()
			PlayerAnimalCompanion.GetActorRef().MoveTo(WarpDestination)
			PlayerAnimalCompanion.GetActorRef().Enable(True)
		EndIf
	EndIf
EndEvent