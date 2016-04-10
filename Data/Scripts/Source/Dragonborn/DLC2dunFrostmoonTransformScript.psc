Scriptname DLC2dunFrostmoonTransformScript extends Actor
{Script for the werewolves at Frostmoon Crag. Handles their werewolf transformations.}

Spell property DLC2dunFrostmoonWerewolfChangeFX Auto
Quest property DLC2dunFrostmoonQST Auto
Race property NordRace Auto
bool property AllowWerewolfTransform = False Auto
bool WaitingForWerewolfTransform

Event OnCombatStateChanged(Actor akTarget, int combatState)
	if (akTarget == Game.GetPlayer() && combatState > 0)
		DLC2dunFrostmoonQST.SetStage(20)
		if (Self.GetRace() == NordRace && AllowWerewolfTransform && !WaitingForWerewolfTransform)
			WaitingForWerewolfTransform = True
			Utility.Wait(Utility.RandomFloat(0.0, 1.5))
			Self.SetAV("Variable07", 1)
			Self.StopCombat()
			Self.EvaluatePackage()
			Self.DoCombatSpellApply(DLC2dunFrostmoonWerewolfChangeFX, Self)
		EndIf
	EndIf
EndEvent

Event OnRaceSwitchComplete()
	WaitingForWerewolfTransform = False
	if (Self.GetRace() != NordRace)
		Utility.Wait(2)
; 		;Debug.Trace("HIT")
		Self.SetAV("Variable07", 0)
		Self.StartCombat(Game.GetPlayer())
		Self.EvaluatePackage()
	EndIf
EndEvent

Event OnCellLoad()
	WaitingForWerewolfTransform = False
	Self.SetAV("Variable07", 0)
	Self.EvaluatePackage()
	Self.SetRace(NordRace)
EndEvent