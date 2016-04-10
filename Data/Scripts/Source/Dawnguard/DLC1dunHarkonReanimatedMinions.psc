Scriptname DLC1dunHarkonReanimatedMinions extends Actor
{Script to faux-Reanimate the skeletons in the room, and disintegrate the rigid-body skeletons when Harkon dies at the end of the battle.}

Spell property DLC1dunHarkonBattleReanimate Auto
bool property DisintegrateOnSpecialDeath Auto
bool property IsSpecialDeath Auto Hidden
Activator property DefaultAshPile1 Auto
EffectShader property TurnUnDisintegrate01FXS Auto


Auto State Waiting
	Event OnActivate(ObjectReference obj)
		if (IsSpecialDeath)
			Self.Kill()
		ElseIf (obj != Game.GetPlayer())
			GoToState("Done")
			DLC1dunHarkonBattleReanimate.Cast(Self, Self)
		EndIf
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference obj)
		;Do nothing.
	EndEvent
EndState

Event OnDying(Actor akKiller)
	if (!IsDisabled())
		if (DisintegrateOnSpecialDeath)
			UnequipAll()
		EndIf
		if (DisintegrateOnSpecialDeath && IsSpecialDeath)
			TurnUnDisintegrate01FXS.play(Self, 4)
			Self.SetCriticalStage(Self.CritStage_DisintegrateStart)
			Utility.Wait(0.75)
			Self.AttachAshPile(DefaultAshPile1)
			Utility.Wait(1.65)
			Self.SetAlpha(0, True)
			Self.SetCriticalStage(Self.CritStage_DisintegrateEnd)
		EndIf
	EndIf
EndEvent
