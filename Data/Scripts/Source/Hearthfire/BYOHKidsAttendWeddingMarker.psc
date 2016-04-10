Scriptname BYOHKidsAttendWeddingMarker extends ObjectReference
{Script on a marker in the Temple of Mara. Make sure adopted children attend the player's wedding and return home safely.}

Quest property BYOHRelationshipAdoption Auto
ReferenceAlias property Child1 Auto
ReferenceAlias property Child2 Auto
Quest property RelationshipMarriageWedding Auto
ReferenceAlias property PlayerWitness01 Auto
ReferenceAlias property PlayerWitness02 Auto
ObjectReference property PlayerWitnessMarker02 Auto
ObjectReference property PlayerWitnessMarker03 Auto
bool kidsMovedForCeremony = False

Event OnCellAttach()
	;Is the player about to get married?
	if (RelationshipMarriageWedding.GetStage() >= 10 && RelationshipMarriageWedding.GetStage() < 200)
		;Debug.Trace("It's your Wedding Day!")
		;Does the player have children?
		if (BYOHRelationshipAdoption.IsRunning())
			;Debug.Trace("Your kids are coming to your Wedding! How nice!")
			;If the player has adopted a child, force them into the PlayerWitness01 alias. Kick the old Witness03 back to their regularly-scheduled behavior.
			Actor oldWitness = PlayerWitness01.GetActorRef()
			PlayerWitness01.ForceRefTo(Child1.GetActorRef())
			PlayerWitness01.GetActorRef().MoveTo(PlayerWitnessMarker02)
			PlayerWitness01.GetActorRef().EvaluatePackage()
			PlayerWitness01.GetActorRef().Disable()
			PlayerWitness01.GetActorRef().MoveToPackageLocation()
			PlayerWitness01.GetActorRef().Enable()
			PlayerWitness01.GetActorRef().EvaluatePackage()
			if (PlayerWitness01.GetActorRef().GetAV("Variable07") > 0)
				if (PlayerWitness01.GetActorRef().GetAV("Variable07") == 6 || PlayerWitness01.GetActorRef().GetAV("Variable07") == 7)
					(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).BreakNameCalling(False, None)
				Else
					PlayerWitness01.GetActorRef().SetAV("Variable07", 0)
				EndIf
				(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).ForcegreetEventReady = False
			EndIf
			if (oldWitness != None)
				;Debug.Trace("Child1 displaces " + oldWitness)
				oldWitness.MoveToMyEditorLocation()
				oldWitness.MoveToPackageLocation()
				oldWitness.EvaluatePackage()
			EndIf
			;If the player has adopted two children, force the second child into the PlayerWitness02 alias. Kick the old Witness02 back to their regularly-scheduled behavior.\
			if (Child2.GetActorRef() != None)
				oldWitness = PlayerWitness02.GetActorRef()
				PlayerWitness02.ForceRefTo(Child2.GetActorRef())
				PlayerWitness02.GetActorRef().MoveTo(PlayerWitnessMarker03)
				PlayerWitness02.GetActorRef().EvaluatePackage()
				PlayerWitness02.GetActorRef().Disable()
				PlayerWitness02.GetActorRef().MoveToPackageLocation()
				PlayerWitness02.GetActorRef().Enable()
				PlayerWitness02.GetActorRef().EvaluatePackage()
				if (PlayerWitness02.GetActorRef().GetAV("Variable07") > 0)
					PlayerWitness02.GetActorRef().SetAV("Variable07", 0)
				EndIf
				if (oldWitness != None)
					;Debug.Trace("Child1 displaces " + oldWitness)
					oldWitness.MoveToMyEditorLocation()
					oldWitness.MoveToPackageLocation()
					oldWitness.EvaluatePackage()
				EndIf
			EndIf
			;Schedule the children to move back home when possible.
			kidsMovedForCeremony = True
		EndIf
	EndIf
EndEvent

Event OnCellDetach()
	if (kidsMovedForCeremony)
		Debug.Trace("Now queuing move to: " + (BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).newHome)
		(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).QueueMoveFamily((BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).newHome, True)
	EndIf
EndEvent