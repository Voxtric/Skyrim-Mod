Scriptname DLC1PlayerVampireScript extends ReferenceAlias  


Event OnInit()
	DLC1BatsCount.Value = 0
EndEvent

Event OnRaceSwitchComplete()
	; The player was made invlunerable just before the race switch.
	; Now that that is finished, make sure the player isn't invulnerable or ghosted any more.
	if ( GetActorReference() == Game.GetPlayer() )
    		Game.GetPlayer().GetActorBase().SetInvulnerable( false )
    		Game.GetPlayer().SetGhost( false )
	endif

	if (GetActorReference().GetRace() == VampireLordRace)
		Debug.Trace("VAMPIRE: Getting notification that race swap TO vampire is complete.")
		(GetOwningQuest() as DLC1PlayerVampireChangeScript).StartTracking()
	else
		Debug.Trace("VAMPIRE: Getting notification that race swap FROM vampire is complete.")
		(GetOwningQuest() as DLC1PlayerVampireChangeScript).Shutdown()
 	endif
EndEvent

; When the player loads a game, tell the Vampire Change Script to handle the event.
Event OnPlayerLoadGame()
	(GetOwningQuest() as DLC1PlayerVampireChangeScript).HandlePlayerLoadGame()
EndEvent

Event OnSpellCast(Form akSpellCast)
	Debug.Trace("VAMPIRE BATS: Spell detected")
	If akSpellCast == DLC1VampireBats
		If DLC1BatsCount.Value == 0
			Debug.Trace("VAMPIRE BATS: Registering single update " + BatsCooldown)
			RegisterForSingleUpdateGameTime(BatsCoolDown)
		endIf
		DLC1BatsCount.Value += 1
		Debug.Trace("VAMPIRE BATS: Bats count = " + DLC1BatsCount.Value)
		if Game.GetPlayer().IsInInterior() == false && DLC1BatsCount.Value >= BatsOutdoorMaxUses
			DLC1BatsWaitMessage.Show()
			GetActorRef().RemoveSpell(DLC1VampireBats)
		elseif Game.GetPlayer().IsInInterior() == true && DLC1BatsCount.Value >= BatsIndoorMaxUses
			DLC1BatsWaitMessage.Show()
			GetActorRef().RemoveSpell(DLC1VampireBats)
		endIf
	endIf
EndEvent

Event OnUpdateGameTime()
	UnRegisterforUpdateGameTime()
	Debug.Trace("VAMPIRE BATS: Bats available again")
	if (Game.GetPlayer().IsInInterior() == false && DLC1BatsCount.Value >= BatsOutdoorMaxUses) || (Game.GetPlayer().IsInInterior() == true && DLC1BatsCount.Value >= BatsIndoorMaxUses)
		DLC1BatsReadyMessage.Show()
		GetActorRef().AddSpell(DLC1VampireBats, false)
		if GetActorRef().GetEquippedSpell(2) == none
			Debug.Trace("VAMPIRE BATS: Nothing else equipped, equip bats")
			GetActorRef().EquipSpell(DLC1VampireBats, 2)
		endIf
	endIf
	DLC1BatsCount.Value = 0
EndEvent

GlobalVariable Property DLC1BatsCount  Auto  

Race Property VampireLordRace auto

SPELL Property DLC1VampireBats  Auto  

Message Property DLC1BatsWaitMessage  Auto  
Message Property DLC1BatsReadyMessage  Auto  

Float Property BatsCooldown  Auto  

SPELL Property CurrentEquippedPower  Auto  

Int Property BatsOutdoorMaxUses  Auto  
Int Property BatsIndoorMaxUses  Auto  

SPELL Property DLC1Mistform  Auto  
