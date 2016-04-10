Scriptname DLC1InitScript extends Quest  

Faction Property VampireLordFaction auto
Faction[] Property EnemyFactions auto

Faction Property PlayerFaction auto
Faction Property DLC1SeranaFaction auto

Faction Property DLC1VampireFaction auto
FormList Property WerewolfHateFactions auto

; doing this here so we don't have to touch the other factions in the 
;  masterfile
Function VampLordFactionSetup()
	int count = 0
	while (count < EnemyFactions.length)
		VampireLordFaction.SetEnemy(EnemyFactions[count])
		count += 1
	endwhile
EndFunction

Function SetupSerana()
	PlayerFaction.SetAlly(DLC1SeranaFaction)
EndFunction

Function AddWerewolfCrimeFactions()
	WerewolfHateFactions.AddForm(DLC1VampireFaction)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Trap Block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;		Existing Set of formlist for explosive Gas/Oil

formlist property flExplodesGasTrapOnHit auto
{projectiles that will set this off when they hit}

formlist property flExplodesGasTrapOnEnter auto
{objects that will set this off when they enter}

formlist property flExplodesGasTrapOnMagicEffectApply auto
{magicEffects that will set this off when applied}

formlist property flExplodesGasTrapEquippedSpell auto
{Spells that will set this off if equipped and drawn}

formlist property trapGasWeapon auto
{weapons that will set this off on hit, specifically explosions}

;		New Set of formlist for explosive Gas/Oil

formlist property DLC1flExplodesGasTrapOnHit auto
{projectiles that will set this off when they hit}

formlist property DLC1flExplodesGasTrapOnEnter auto
{objects that will set this off when they enter}

formlist property DLC1flExplodesGasTrapOnMagicEffectApply auto
{magicEffects that will set this off when applied}

formlist property DLC1flExplodesGasTrapEquippedSpell auto
{Spells that will set this off if equipped and drawn}

formlist property DLC1trapGasWeapon auto
{weapons that will set this off on hit, specifically explosions}

;Make any changes necessary to existing traps, this is called in the start up stage on the quest
Function SetUpTraps()
	debug.Trace(self + ": appending explosive gas formlists")
	AppendFormList(flExplodesGasTrapOnHit, DLC1flExplodesGasTrapOnHit)
	AppendFormList(flExplodesGasTrapOnEnter, DLC1flExplodesGasTrapOnEnter)
	AppendFormList(flExplodesGasTrapOnMagicEffectApply, DLC1flExplodesGasTrapOnMagicEffectApply)
	AppendFormList(flExplodesGasTrapEquippedSpell, DLC1flExplodesGasTrapEquippedSpell)
	AppendFormList(trapGasWeapon, DLC1trapGasWeapon)
endFunction

;		Function to add all new forms from NewFormList to ExistingFormList
Function AppendFormList(formList ExistingFormList, formList NewFormList)
	int Index
	while (Index < NewFormList.getSize())
		form CurrentForm = NewFormList.getAt(Index)
		if !ExistingFormList.hasForm(CurrentForm)
			debug.Trace(self + ": " + CurrentForm + " is being added to list " + ExistingFormList)
			ExistingFormList.addForm(CurrentForm)
		endif
		Index += 1
	endWhile
endFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Trap Block End
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

