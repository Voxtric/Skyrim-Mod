Scriptname DLC1LD_AetherialStaffSummonScript extends Actor
{Script on the creatures summoned by the Aetherial Staff. Manages their VFX.}

;Summon VFX
Activator property SummonValorTargetFXActivator Auto			;Activator to use.
bool property isMishapScrap = False Auto
bool property isMishapDead = False Auto
Formlist property DLC1LD_AetherialStaffScrapList Auto			;Mishap Scrap to 'summon'.

;Faction to track that the staff effect is in use.
Faction property DLC1LD_AetherialStaffBusyFaction Auto

Event OnInit()
	Self.EnableAI(False)
	Self.SetAlpha(0, False)
EndEvent

Event OnLoad()
	Self.PlaceAtMe(SummonValorTargetFXActivator)
	Utility.Wait(1.5)
	if (isMishapScrap)
		;Junk comes out.
		int junk = Utility.RandomInt(4, 7)
		While (junk > 0)
			ObjectReference scrap = Self.PlaceAtMe(DLC1LD_AetherialStaffScrapList.GetAt(Utility.RandomInt(0, DLC1LD_AetherialStaffScrapList.GetSize() - 1)))
			scrap.ApplyHavokImpulse(Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), 1, Utility.RandomFloat(5, 25))
			junk = junk - 1
		EndWhile
		Self.Disable()
		Self.Delete()
	Else
		Self.EnableAI(True)
		Self.SetAlpha(1, True)
	EndIf
	If (isMishapDead)
		Utility.Wait(1)
		Self.Kill()
	EndIf
	Game.GetPlayer().RemoveFromFaction(DLC1LD_AetherialStaffBusyFaction)
EndEvent