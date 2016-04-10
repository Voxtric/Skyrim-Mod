Scriptname DLC1LD_AetherialCrownScript extends ReferenceAlias
{Script for the DLC1LD Aetherial Crown reward item}

;DLC1LD Postquest quest, since we need to keep the crown on an alias.
Quest property DLC1LD_Postquest Auto

;Perk that traps the Doomstone activation.
Perk property DLC1LD_AetherialCrownPerk Auto

;Standard doomstone spells & perks.							;Int value used for tracking purposes.
Spell property pDoomApprenticeAbility Auto				;1
Spell property pdoomApprenticeNegativeAbility Auto	
Spell property pDoomAtronachAbility Auto				;2
Spell property pDoomLadyAbility Auto					;3
Spell property pDoomLordAbility Auto					;4
Spell property pDoomLoverAbility Auto					;5
Spell property pDoomMageAbility Auto					;6
Spell property pDoomRitualAbility Auto					;7
Perk property pDoomRitualPerk Auto
Spell property pDoomSerpentAbility Auto					;8
Spell property pDoomShadowAbility Auto					;9
Spell property pDoomSteedAbility Auto					;10
Spell property pDoomThiefAbility Auto					;11
Spell property pDoomTowerAbility Auto					;12
Spell property pDoomWarriorAbility Auto					;13

;Standard doomstone removed messages.
Message property pDoomApprenticeRemovedMSG Auto
Message property pDoomAtronachRemovedMSG Auto
Message property pDoomLadyRemovedMSG Auto
Message property pDoomLordRemovedMSG Auto
Message property pDoomLoverRemovedMSG Auto
Message property pDoomMageRemovedMSG Auto
Message property pDoomRitualRemovedMSG Auto
Message property pDoomSerpentRemovedMSG Auto
Message property pDoomShadowRemovedMSG Auto
Message property pDoomSteedRemovedMSG Auto
Message property pDoomThiefRemovedMSG Auto
Message property pDoomTowerRemovedMSG Auto
Message property pDoomWarriorRemovedMSG Auto

;Rested abilities, which have to be removed when the Lover Stone bonus is added.
Spell property pRested Auto
Spell property pWellRested Auto
Spell property pMarriageRested Auto

;The current ability stored in the crown.
int currentCrownAbility

;The current doomstone on the player.
int currentDoomstoneAbility

;Internal variables for the effect stored in the crown.
Spell currentSpell1
Spell currentSpell2
Perk currentPerk
Message currentRemoveMessage

;Timestamp of when the player last interacted with a doomstone.
float interactionTimestamp = 0.0


;When the player equips the crown, turn on the activation-trap perk and begin tracking.
Event OnEquipped(Actor akActor)
	if (akActor == Game.GetPlayer())
		;Debug.Trace("CROWN: Aetherial Crown equipped. Current Ability = " + currentCrownAbility)
		akActor.AddPerk(DLC1LD_AetherialCrownPerk)
		currentDoomstoneAbility = IdentifyCurrentDoomstoneEffect()
		if (currentCrownAbility != currentDoomstoneAbility)
			;Reinstate the last-recorded doomstone ability.
			ApplyCrownEffect(True)
		EndIf
		;Debug.Trace("CROWN: Aetherial Crown equip done. Current Doomstone recorded as: " + currentDoomstoneAbility)
	EndIf
EndEvent


;When the player removes the crown, turn off the activation-trap perk.
Event OnUnequipped(Actor akActor)
	;Debug.Trace("CROWN: Aetherial Crown unequipped. Current Ability = " + currentCrownAbility)
	akActor.RemovePerk(DLC1LD_AetherialCrownPerk)
	ApplyCrownEffect(False)
EndEvent


;When the perk catches a Doomstone activation, it calls this function so we can record it.
;We have to wait briefly for the player to exit the Doomstone menu so we know whether he took the new ability.
Function DoomstoneActivated()
	;Debug.Trace("CROWN: Doomstone activation received.")
	;Debug.Trace("CROWN: Current Doomstone recorded as: " + currentDoomstoneAbility)
	;Debug.Trace("CROWN: Registering for update.")
	interactionTimestamp = Utility.GetCurrentRealTime()
	UnregisterForUpdate()
	RegisterForSingleUpdate(0.5)
EndFunction


;Check to see if the player changed doomstone abilities. If so, change the ability stored in the crown.
Event OnUpdate()
	RunUpdate()
EndEvent

Function RunUpdate()
	;Debug.Trace("CROWN: OnUpdate: " + currentDoomstoneAbility + " - " + IdentifyCurrentDoomstoneEffect())
	;Did the player change doomstone abilities?
	int identifiedEffect = IdentifyCurrentDoomstoneEffect()
	;Debug.Trace("CROWN: We have: " + identifiedEffect + ", " + currentDoomstoneAbility + ", " + currentCrownAbility)
	if (identifiedEffect > 0)
		if (identifiedEffect != currentDoomstoneAbility)
			;Debug.Trace("CROWN: Now updating.")
			ApplyCrownEffect(False)							;Remove the old ability stored in the crown.
			SelectNewCrownEffect(currentDoomstoneAbility)	;Determine which ability should now be stored by the crown.
			ApplyCrownEffect(True)							;Apply the new ability.
			currentDoomstoneAbility = identifiedEffect		;Record the current doomstone for reference in the next loop.
		ElseIf (Utility.GetCurrentRealTime() - interactionTimestamp < 60)
			;Debug.Trace("CROWN: Re-Registering for Update, v1.")
			UnregisterForUpdate()
			RegisterForSingleUpdate(0.5)
		Else
			;Debug.Trace("CROWN: Timer expired, v1.")
		EndIf
	ElseIf (Utility.GetCurrentRealTime() - interactionTimestamp < 60)
		;Debug.Trace("CROWN: Re-Registering for Update, v2.")
		UnregisterForUpdate()
		RegisterForSingleUpdate(0.5)
	Else
		;Debug.Trace("CROWN: Timer expired, v2.")
	EndIf
EndFunction


;Add or remove the ability stored by the crown.
Function ApplyCrownEffect(bool shouldAdd)
	if (shouldAdd)
		;Debug.Trace("CROWN: Adding Crown ability." + currentCrownAbility + " " + currentSpell1)
		if (currentSpell1 != None)		
			Game.GetPlayer().AddSpell(currentSpell1)
			if (currentSpell2 != None)
				Game.GetPlayer().AddSpell(currentSpell2)
			EndIf
			if (currentPerk != None)
				Game.GetPlayer().AddPerk(currentPerk)
			EndIf
		EndIf		
	Else
		;Debug.Trace("CROWN: Removing Crown ability for " + currentCrownAbility + " " + currentSpell1)
		if (currentSpell1 != None)
			Game.GetPlayer().RemoveSpell(currentSpell1)
			if (currentSpell2 != None)
				Game.GetPlayer().RemoveSpell(currentSpell2)
			EndIf
			if (currentPerk != None)
				Game.GetPlayer().RemovePerk(currentPerk)
			EndIf
			currentRemoveMessage.Show()
		EndIf
	EndIf
EndFunction

;Given the int value of a new effect (see list at top, or the identifying function below), set up the new effect stored in the crown.
Function SelectNewCrownEffect(int newEffect)
	currentCrownAbility = newEffect
	if (currentCrownAbility == 1)
		currentSpell1 = pDoomApprenticeAbility
		currentSpell2 = pdoomApprenticeNegativeAbility
		currentPerk = None
		currentRemoveMessage = pDoomApprenticeRemovedMSG
	ElseIf (currentCrownAbility == 2)
		currentSpell1 = pDoomAtronachAbility
		currentSpell2 = None
		currentPerk = None
		currentRemoveMessage = pDoomAtronachRemovedMSG
	ElseIf (currentCrownAbility == 3)
		currentSpell1 = pDoomLadyAbility
		currentSpell2 = None
		currentPerk = None
		currentRemoveMessage = pDoomLadyRemovedMSG
	ElseIf (currentCrownAbility == 4)
		currentSpell1 = pDoomLordAbility
		currentSpell2 = None
		currentPerk = None
		currentRemoveMessage = pDoomLordRemovedMSG
	ElseIf (currentCrownAbility == 5)
		;Special case - Remove Rested bonuses for Lover.
		Game.GetPlayer().RemoveSpell(pRested)
		Game.GetPlayer().RemoveSpell(pWellRested)
		Game.GetPlayer().RemoveSpell(pMarriageRested)
		currentSpell1 = pDoomLoverAbility
		currentSpell2 = None
		currentPerk = None
		currentRemoveMessage = pDoomLoverRemovedMSG
	ElseIf (currentCrownAbility == 6)
		currentSpell1 = pDoomMageAbility
		currentSpell2 = None
		currentPerk = None
		currentRemoveMessage = pDoomMageRemovedMSG
	ElseIf (currentCrownAbility == 7)
		currentSpell1 = pDoomRitualAbility
		currentSpell2 = None
		currentPerk = pDoomRitualPerk
		currentRemoveMessage = pDoomRitualRemovedMSG
	ElseIf (currentCrownAbility == 8)
		currentSpell1 = pDoomSerpentAbility
		currentSpell2 = None
		currentPerk = None
		currentRemoveMessage = pDoomSerpentRemovedMSG
	ElseIf (currentCrownAbility == 9)
		currentSpell1 = pDoomShadowAbility
		currentSpell2 = None
		currentPerk = None
		currentRemoveMessage = pDoomShadowRemovedMSG
	ElseIf (currentCrownAbility == 10)
		currentSpell1 = pDoomSteedAbility
		currentSpell2 = None
		currentPerk = None
		currentRemoveMessage = pDoomSteedRemovedMSG
	ElseIf (currentCrownAbility == 11)
		currentSpell1 = pDoomThiefAbility
		currentSpell2 = None
		currentPerk = None
		currentRemoveMessage = pDoomThiefRemovedMSG
	ElseIf (currentCrownAbility == 12)
		currentSpell1 = pDoomTowerAbility
		currentSpell2 = None
		currentPerk = None
		currentRemoveMessage = pDoomTowerRemovedMSG
	ElseIf (currentCrownAbility == 13)
		currentSpell1 = pDoomWarriorAbility
		currentSpell2 = None
		currentPerk = None
		currentRemoveMessage = pDoomWarriorRemovedMSG
	EndIf
	;Debug.Trace("CROWN: New crown ability selected for " + currentCrownAbility)
EndFunction


;Determine which doomstone ability the player has by testing the abilities on them.
int Function IdentifyCurrentDoomstoneEffect()
	;Debug.Trace("CROWN: Now Identifying: " + currentCrownAbility)
	if (Game.GetPlayer().HasSpell(pDoomApprenticeAbility) && currentCrownAbility != 1 && currentDoomstoneAbility != 1)
		return 1
	ElseIf (Game.GetPlayer().HasSpell(pDoomAtronachAbility) && currentCrownAbility != 2 && currentDoomstoneAbility != 2)
		return 2
	ElseIf (Game.GetPlayer().HasSpell(pDoomLadyAbility) && currentCrownAbility != 3 && currentDoomstoneAbility != 3)
		return 3
	ElseIf (Game.GetPlayer().HasSpell(pDoomLordAbility) && currentCrownAbility != 4 && currentDoomstoneAbility != 4)
		return 4
	ElseIf (Game.GetPlayer().HasSpell(pDoomLoverAbility) && currentCrownAbility != 5 && currentDoomstoneAbility != 5)
		return 5
	ElseIf (Game.GetPlayer().HasSpell(pDoomMageAbility) && currentCrownAbility != 6 && currentDoomstoneAbility != 6)
		return 6
	ElseIf (Game.GetPlayer().HasSpell(pDoomRitualAbility) && currentCrownAbility != 7 && currentDoomstoneAbility != 7)
		return 7
	ElseIf (Game.GetPlayer().HasSpell(pDoomSerpentAbility) && currentCrownAbility != 8 && currentDoomstoneAbility != 8)
		return 8
	ElseIf (Game.GetPlayer().HasSpell(pDoomShadowAbility) && currentCrownAbility != 9 && currentDoomstoneAbility != 9)
		return 9
	ElseIf (Game.GetPlayer().HasSpell(pDoomSteedAbility) && currentCrownAbility != 10 && currentDoomstoneAbility != 10)
		return 10
	ElseIf (Game.GetPlayer().HasSpell(pDoomThiefAbility) && currentCrownAbility != 11 && currentDoomstoneAbility != 11)
		return 11
	ElseIf (Game.GetPlayer().HasSpell(pDoomTowerAbility) && currentCrownAbility != 12 && currentDoomstoneAbility != 12)
		return 12
	ElseIf (Game.GetPlayer().HasSpell(pDoomWarriorAbility) && currentCrownAbility != 13 && currentDoomstoneAbility != 13)
		return 13
	Else
		return 0
	EndIf
EndFunction