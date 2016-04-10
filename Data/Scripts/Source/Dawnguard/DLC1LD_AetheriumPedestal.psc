scriptname DLC1LD_AetheriumPedestal extends ReferenceAlias
{Script on the Aetherium Pedestal alias in DLC1LD. Handles the pedestal and tower animations.}

Quest property DLC1LD Auto
ReferenceAlias property CrestPedestal Auto
ReferenceAlias property Shard1 Auto
ReferenceAlias property Shard2 Auto
ReferenceAlias property Shard3 Auto
ReferenceAlias property Shard4 Auto
ReferenceAlias property Crest Auto
ReferenceAlias property Katria Auto
Message property DLC1LD_PedestalFailMessage Auto
Message property DLC1LD_PedestalFailCombatMessage Auto
bool hasPerformedAction
int animState = 1

Auto State Ready
	Event OnCellAttach()
		if (DLC1LD.GetStageDone(181))
			DLC1LD.SetStage(182)
		EndIf
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			GoToState("Animating")
			hasPerformedAction = False
			if (animState < 5)
				if (animState == 1 && Game.GetPlayer().GetItemCount(Shard1.GetReference()))
					Game.GetPlayer().RemoveItem(Shard1.GetReference(), 1)
					CrestPedestal.GetReference().PlayAnimationAndWait("crest01", "done")
					hasPerformedAction = True
					animState = 2
				EndIf
				if (animState == 2 && Game.GetPlayer().GetItemCount(Shard2.GetReference()))
					Game.GetPlayer().RemoveItem(Shard2.GetReference(), 1)
					CrestPedestal.GetReference().PlayAnimationAndWait("crest02", "done")
					hasPerformedAction = True
					animState = 3
				EndIf
				if (animState == 3 && Game.GetPlayer().GetItemCount(Shard3.GetReference()))
					Game.GetPlayer().RemoveItem(Shard3.GetReference(), 1)
					CrestPedestal.GetReference().PlayAnimationAndWait("crest03", "done")
					hasPerformedAction = True
					animState = 4
				EndIf
				if (animState == 4 && Game.GetPlayer().GetItemCount(Shard4.GetReference()))
					Game.GetPlayer().RemoveItem(Shard4.GetReference(), 1)
					CrestPedestal.GetReference().PlayAnimationAndWait("crest04", "done")
					hasPerformedAction = True
					;Notify DLC1LD that the player has placed all the shards.
					DLC1LD.SetStage(175)
					animState = 5
				EndIf
				if (!hasPerformedAction)
					DLC1LD_PedestalFailMessage.Show()
				EndIf
			Else			
				if (animState == 5 && !Game.GetPlayer().IsInCombat() && !Katria.GetActorRef().IsInCombat())
					Self.GetReference().Disable()
					;Enable the Bthalft Stand Clear trigger to catch the player even if they fast-travel away.
					DLC1LD.SetStage(179)
					CrestPedestal.GetReference().PlayAnimationAndWait("take", "done")
					hasPerformedAction = True
					;Notify DLC1LD that we're ready to open.
					DLC1LD.SetStage(180)
					animState = 6
				Else
					DLC1LD_PedestalFailCombatMessage.Show()
				EndIf
			EndIf
			GoToState("Ready")
		EndIf
	EndEvent
EndState

State Animating
	Event OnCellAttach()
		if (DLC1LD.GetStageDone(181))
			DLC1LD.SetStage(182)
		EndIf
	EndEvent
	
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState

State TowerOpened
	;Do nothing special.
EndState

Function OpenBthalft()
	CrestPedestal.GetReference().PlayAnimation("open")
	DLC1LD.SetStage(187)
	animState = 7
	GoToState("TowerOpened")
EndFunction

Function ReferenceAttach()
	;Debug.Trace("Cell attached. Waiting for 3D to load.")
	If (CrestPedestal.GetReference() == None || !DLC1LD.IsRunning())
		Return
	ElseIf (!CrestPedestal.GetReference().Is3DLoaded())
		int i = 0
		While (CrestPedestal.GetReference() != None && DLC1LD.IsRunning() && (!CrestPedestal.GetReference().Is3DLoaded()))
			i = i + 1
			Utility.Wait(0.25)
			if (i > 100)
				Debug.Trace("Cancel 2")
				Return
			EndIf
		EndWhile
	EndIf
	;Debug.Trace("Updating animations.")
	if (animState >= 2)
		CrestPedestal.GetReference().PlayAnimationAndWait("crest01", "done")
	EndIf
	if (animState >= 3)
		CrestPedestal.GetReference().PlayAnimationAndWait("crest02", "done")
	EndIf
	if (animState >= 4)
		CrestPedestal.GetReference().PlayAnimationAndWait("crest03", "done")
	EndIf
	if (animState >= 5)
		CrestPedestal.GetReference().PlayAnimationAndWait("crest04", "done")
	EndIf
	if (animState >= 6)
		CrestPedestal.GetReference().PlayAnimationAndWait("take", "done")
	EndIf	
	if (animState >= 6)
		CrestPedestal.GetReference().PlayAnimationAndWait("open", "done")
	EndIf
EndFunction