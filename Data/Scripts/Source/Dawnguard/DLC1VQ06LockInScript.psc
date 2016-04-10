Scriptname DLC1VQ06LockInScript extends ObjectReference  


Quest Property DLC1VQ06 auto
GlobalVariable Property VampireLine auto
DLC1_NPCMentalModelScript Property MM Auto
ReferenceAlias Property Serana auto
DialogueFollowerScript Property dfScript auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer() && DLC1VQ06.GetStage() == 10)
		Serana.GetReference().MoveTo(Game.GetPlayer())
		if (dfScript.pPlayerFollowerCount.GetValueInt() > 0 && dfScript.pFollowerAlias.GetActorReference() != None && dfScript.pFollowerAlias.GetActorReference() != Serana.GetActorReference())
			dfScript.DismissFollower()
		endif
		MM.LockIn()
		if (VampireLine.GetValueInt() != 0)
			MM.SetHomeMarker(2)
		else
			MM.SetHomeMarker(1)
		endif
		Delete()
	endif
EndEvent
