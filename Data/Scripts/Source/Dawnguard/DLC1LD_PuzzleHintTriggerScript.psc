scriptname DLC1LD_PuzzleHintTriggerScript extends ObjectReference
{Script that controls the timing and frequency of Katria's hints during the DLC1Arkngthamz Tonal Lock puzzle.}

Quest property DLC1LD_Arkngthamz Auto
ReferenceAlias property Katria Auto
bool runningLoop = False
bool readyForHint = False
bool shouldDelayHint = False

Event OnTriggerEnter(ObjectReference obj)
	if (obj == Game.GetPlayer() && DLC1LD_Arkngthamz.GetStage() < 90)
		runningLoop = True
		UpdateLoop()
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference obj)
	runningLoop = False
EndEvent

Function UpdateLoop()
	While (runningLoop)
		;Debug.Trace("New Loop")
             if (shouldDelayHint)
				;Debug.Trace("Delaying Hint")
                  shouldDelayHint = False
                  Utility.Wait(10)
             Else
		     Utility.Wait(25)
             EndIf
		;Debug.Trace("Evaluating")
		if (!shouldDelayHint && DLC1LD_Arkngthamz.GetStage() >= 85 && DLC1LD_Arkngthamz.GetStage() < 89 && !Katria.GetActorRef().IsInDialogueWithPlayer() && !Game.GetPlayer().IsInCombat() && !Katria.GetActorRef().IsInCombat())
			if (!readyForHint)
				readyForHint = True
			Else
				int newStage = DLC1LD_Arkngthamz.GetStage() + 1
				;Debug.Trace("Setting to: " + newStage)
				DLC1LD_Arkngthamz.SetStage(newStage)
			EndIf
		ElseIf (DLC1LD_Arkngthamz.GetStage() >= 90)
			runningLoop = False
		EndIf
	EndWhile
EndFunction

Function delayHint()
     shouldDelayHint = True
EndFunction