Scriptname DLC1LD_AetherialStaffEffectScript extends ObjectReference
{Script on the marker 'summoned' by the Aetherial Staff. Determines what is actually summoned for each use.}

;The four summons that can result.
Spell property DLC1LD_AetherialStaffSummonDwarvenSpider01Spell Auto
Spell property DLC1LD_AetherialStaffSummonDwarvenSpider02Spell Auto
Spell property DLC1LD_AetherialStaffSummonDwarvenSphere01Spell Auto
Spell property DLC1LD_AetherialStaffSummonDwarvenSphere02Spell Auto
Spell property DLC1LD_AetherialStaffSummonMishapSphereSpell Auto
Spell property DLC1LD_AetherialStaffSummonMishapSpiderSpell Auto
Spell property DLC1LD_AetherialStaffSummonMishapScrapSpell Auto

;The mishaps that can result.
float MishapChance = 15.0										;15% base chance of a mishap.
ActorBase property DLC1LD_EncDwarvenSpiderSummonMishap Auto	;Mishap Spider to 'summon'
ActorBase property DLC1LD_EncDwarvenSphereSummonMishap Auto	;Mishap Sphere to 'summon'
Formlist property DLC1LD_AetherialStaffScrapList Auto			;Mishap Scrap to 'summon'.

;VFX to use for mishaps. Similar to those on DLC1LD_AetherialStaffSummonScript (for successful summons).
Activator property SummonValorTargetFXActivator Auto			;Activator to use.
Activator property DLC1LD_AetherialTimeWound Auto

;Faction to track that the staff effect is in use.
Faction property DLC1LD_AetherialStaffBusyFaction Auto

Event OnInit()
	int roll = Utility.RandomInt(1, 100)
	Debug.Trace(roll)
	if (Game.GetPlayer().IsInFaction(DLC1LD_AetherialStaffBusyFaction))
		;The player has used the staff twice in quick succession. Ignore this use entirely.
		Self.Disable()
		Self.Delete()
		Return
	Else
		Game.GetPlayer().AddToFaction(DLC1LD_AetherialStaffBusyFaction)
	EndIf
	;First, is this summon a mishap?
	if (roll < MishapChance)
		SummonMishap()
	ElseIf (Game.GetPlayer().GetLevel() < 15)
		;Level 1-15: 70% chance of Spider-1. Additional 15% chance of a mishap.
		if (roll < 30)
			SummonMishap()
		ElseIf (roll < 85)
			DLC1LD_AetherialStaffSummonDwarvenSpider01Spell.Cast(Game.GetPlayer(), Self)
		Else
			DLC1LD_AetherialStaffSummonDwarvenSphere01Spell.Cast(Game.GetPlayer(), Self)
		EndIf
	ElseIf (Game.GetPlayer().GetLevel() < 30)
		;Level 15-30: 42% chance of Spider-1, 43% chance of Sphere-1.
		if (roll < 57)
			DLC1LD_AetherialStaffSummonDwarvenSpider01Spell.Cast(Game.GetPlayer(), Self)
		Else
			DLC1LD_AetherialStaffSummonDwarvenSphere01Spell.Cast(Game.GetPlayer(), Self)
		EndIf
	ElseIf (Game.GetPlayer().GetLevel() < 45)
		;Level 30-45: 42% chance of Spider-2, 43% chance of Sphere-1.
		if (roll < 57)
			DLC1LD_AetherialStaffSummonDwarvenSpider02Spell.Cast(Game.GetPlayer(), Self)
		Else
			DLC1LD_AetherialStaffSummonDwarvenSphere01Spell.Cast(Game.GetPlayer(), Self)
		EndIf
	Else
		;Level 45+: 42% chance of Spider-2, 43% chance of Sphere-2.
		if (roll < 57)
			DLC1LD_AetherialStaffSummonDwarvenSpider02Spell.Cast(Game.GetPlayer(), Self)
		Else
			DLC1LD_AetherialStaffSummonDwarvenSphere02Spell.Cast(Game.GetPlayer(), Self)
		EndIf
	EndIf
	
	;Delete the marker.
	Self.Disable()
	Self.Delete()
EndEvent

Function SummonMishap()	
	int mishap = Utility.RandomInt(1, 5)
	Debug.Trace(mishap)
	if (mishap == 1)
		;Mishap 1: Dead Spider
		Debug.Trace("Mishap Dead Spider")
		DLC1LD_AetherialStaffSummonMishapSpiderSpell.Cast(Game.GetPlayer(), Self)
	ElseIf (mishap == 2)
		;Mishap 2: Dead Sphere
		Debug.Trace("Mishap Dead Sphere")
		DLC1LD_AetherialStaffSummonMishapSphereSpell.Cast(Game.GetPlayer(), Self)
	Else
		;Mishap 3-5: Dwemer Scrap
		Debug.Trace("Mishap Scrap")
		DLC1LD_AetherialStaffSummonMishapScrapSpell.Cast(Game.GetPlayer(), Self)
	EndIf		
EndFunction