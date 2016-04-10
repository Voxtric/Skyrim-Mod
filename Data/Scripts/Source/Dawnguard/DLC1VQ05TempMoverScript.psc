Scriptname DLC1VQ05TempMoverScript extends ObjectReference  Conditional

ReferenceAlias Property pRNPC Auto
ObjectReference Property pPlayerMarker Auto
ObjectReference Property pRNPCMarker Auto

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		Game.GetPlayer().MoveTo(pPlayerMarker)
		pRNPC.GetActorRef().MoveTo(pRNPCMarker)
	endif

endEvent