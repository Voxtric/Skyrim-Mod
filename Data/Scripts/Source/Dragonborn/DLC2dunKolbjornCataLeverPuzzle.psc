ScriptName DLC2dunKolbjornCataLeverPuzzle extends ObjectReference
{Activation manager for the catacomb pullbar puzzle in Phase 2 of Kolbjorn Barrow. Ensures the pullbar stay in sync so the player can't get stuck.}

ObjectReference Property Bar1 auto
ObjectReference Property Bar2 auto
ObjectReference Property Bar3 auto
ObjectReference Property Chain1 auto
ObjectReference Property Chain2 auto
ObjectReference Property EndTrigger auto

ObjectReference Property Gate1 auto
ObjectReference Property Gate2 auto
ObjectReference Property Gate3 auto
ObjectReference Property Gate1Collision auto
ObjectReference Property Gate2Collision auto
ObjectReference Property Gate3Collision auto
bool Property Gate1Open = False auto
bool Property Gate2Open = True auto
bool Property Gate3Open = True auto
bool Property done = False auto



Auto State WaitingForPlayer
	Event OnActivate (objectReference triggerRef)
		GoToState("WaitingForPullbar")
		if (triggerRef == EndTrigger)
			;The puzzle is locked in a completed state when the player enters the final chamber.
			done = True
			if (!Gate1Open)
				Gate1.Activate(Self)
				Gate1Open = True
				Gate1Collision.Disable()
			EndIf
			if (!Gate2Open)
				Gate2.Activate(Self)
				Gate2Open = True
				Gate2Collision.Disable()
			EndIf
			GotoState("WaitingForPlayer")
		ElseIf (done)
			;Once the puzzle is solved, the pullbars don't do anything.
			triggerRef.PlayAnimation("Pull")
			GotoState("WaitingForPlayer")
		ElseIf (triggerRef == Chain1)
			;Chain 1 activates Gate 1 only.
			Chain1.PlayAnimation("Pull")
			Gate1.Activate(Self)
			if (Gate1Open)
				Gate1Open = False
				Gate1Collision.Enable()
			Else
				Gate1Open = True
				Gate1Collision.Disable()
			EndIf
			Utility.Wait(2)
			GotoState("WaitingForPlayer")
		ElseIf (triggerRef == Chain2)
			;Chain 2 activates Gates 1 & 2.
			Chain2.PlayAnimation("Pull")
			Gate1.Activate(Self)
			Gate2.Activate(Self)
			if (Gate1Open)
				Gate1Open = False
				Gate1Collision.Enable()
			Else
				Gate1Open = True
				Gate1Collision.Disable()
			EndIf
			if (Gate2Open)
				Gate2Open = False
				Gate2Collision.Enable()
			Else
				Gate2Open = True
				Gate2Collision.Disable()
			EndIf
			Utility.Wait(2)
			GotoState("WaitingForPlayer")
		ElseIf (triggerRef == Bar1)
			;Bar 1 activates all three gates.
			Bar1.PlayAnimation("Pull")
			Gate1.Activate(Self)
			Gate2.Activate(Self)
			Gate3.Activate(Self)
			if (Gate1Open)
				Gate1Open = False
				Gate1Collision.Enable()
			Else
				Gate1Open = True
				Gate1Collision.Disable()
			EndIf
			if (Gate2Open)
				Gate2Open = False
				Gate2Collision.Enable()
			Else
				Gate2Open = True
				Gate2Collision.Disable()
			EndIf
			if (Gate3Open)
				Gate3Open = False
				Gate3Collision.Enable()
			Else
				Gate3Open = True
				Gate3Collision.Disable()
			EndIf
			Utility.Wait(2)
			GotoState("WaitingForPlayer")
		ElseIf (triggerRef == Bar2)
			;Bar 2 activates 1 & 3.
			;Bar 1 activates all three gates.
			Bar2.PlayAnimation("Pull")
			Gate1.Activate(Self)
			Gate3.Activate(Self)
			if (Gate1Open)
				Gate1Open = False
				Gate1Collision.Enable()
			Else
				Gate1Open = True
				Gate1Collision.Disable()
			EndIf
			if (Gate3Open)
				Gate3Open = False
				Gate3Collision.Enable()
			Else
				Gate3Open = True
				Gate3Collision.Disable()
			EndIf
			Utility.Wait(2)
			GotoState("WaitingForPlayer")
		Else ;(triggerRef == Bar2)
			;Bar 2 activates  3 only.
			Bar3.PlayAnimation("Pull")
			Gate3.Activate(Self)
			if (Gate3Open)
				Gate3Open = False
				Gate3Collision.Enable()
			Else
				Gate3Open = True
				Gate3Collision.Disable()
			EndIf
			Utility.Wait(2)
			GotoState("WaitingForPlayer")
		EndIf
	EndEvent
EndState

STATE WaitingForPullbar
	Event onActivate(objectReference triggerRef)
		;Do Nothing
	EndEvent
EndState