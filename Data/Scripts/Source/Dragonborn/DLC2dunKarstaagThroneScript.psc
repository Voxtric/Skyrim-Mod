Scriptname DLC2dunKarstaagThroneScript extends ObjectReference
{Script on the trigger around Karstaag's throne. Checks to see that the player has the skull.}

Message property DLC2dunKarstaagThroneNeedsSkullMessage auto
Quest property DLC2dunKarstaagQST auto

Event OnCellAttach()
     if (DLC2dunKarstaagQST.GetStage() < 10)
          Self.Disable()
     Else
          Self.Enable()
     EndIf
EndEvent

Event OnActivate(ObjectReference akActivator)
	if (DLC2dunKarstaagQST.GetStage() < 10)
		DLC2dunKarstaagThroneNeedsSkullMessage.Show()
	ElseIf (DLC2dunKarstaagQST.GetStage() == 10)
		DLC2dunKarstaagQST.SetStage(20)
		Self.Disable()
	Else
		Self.GetLinkedRef().Activate(Game.GetPlayer())
	EndIf
EndEvent