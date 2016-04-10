Scriptname DLC2AshShellScript extends ActiveMagicEffect  


Event OnEffectStart (Actor akTarget, Actor akCaster)
; 	debug.trace("DLC2AshShellScript: START caster = " + akcaster + ", target = " + aktarget)
;	akTarget.ModActorValue("MagicResist", 99)
;	akTarget.ModActorValue("DamageResist", 500)
;	game.GetPlayer().AddPerk(DLC2AshShellDmgPerk)
	akTarget.SetGhost(true)
	akTarget.Stopcombat()
EndEvent

Event OnEffectFinish (Actor akTarget, Actor akCaster)
; 	debug.trace("DLC2AshShellScript: FINISH caster = " + akcaster + ", target = " + aktarget)
;	akTarget.ModActorValue("MagicResist", -99)
;	akTarget.ModActorValue("DamageResist", -500)
;	game.GetPlayer().RemovePerk(DLC2AshShellDmgPerk)
	akTarget.SetGhost(false)
EndEvent

Perk Property DLC2AshShellDmgPerk  Auto  
