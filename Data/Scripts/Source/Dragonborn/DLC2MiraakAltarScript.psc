Scriptname DLC2MiraakAltarScript extends DLC2ApocryphaBookScript Conditional
{script to respec perks}

FormList[] Property PerkArray  Auto  
{array of form lists of perks
indexed by skill, ordered by group:
0 = Illusion
1 = Conjuration
2 = Destruction
3 = Restoration
4 = Alteration
5 = Enchanting

6 = Smithing
7 = Heavy Armor
8 = Block
9 = TwoHanded
10 = OneHanded
11 = Archery

12 = Light Armor
13 = Sneak
14 = Lockpicking
15 = Pickpocket
16 = Speech
17 = Alchemy
}

bool hasOpenedBook	;Have we played the book-opening animation.
bool rewardsShown		;Have we displayed the constellation rewards?
Spell property DLC2ApocryphaRewardSpell Auto
bool doOnce

;--------------------------------------------------
;EVENTS
;-------

Event OnCellLoad()
	;See if the parent needs to do anything.
	Parent.OnCellLoad()
	if !DoOnce
		DoOnce = True
		PlayAnimation("startDown")
	endif
EndEvent


Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			GoToState("Busy")
			(DLC2BookDungeonController as DLC2BookDungeonControllerScript).ReadApocryphaBook(Self, False, True, rewardsShown, True)
			GoToState("Waiting")
		EndIf
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState


;--------------------------------------------------
;FUNCTIONS
;---------

Function OpenBook()
	if (!hasOpenedBook)
		hasOpenedBook = True
		
		;Disable the activators on the book while it opens.
		Self.DisableBothActivators()
		
		;Open the book.
		Self.PlayAnimationAndWait("Stage1", "Open")
	EndIf
EndFunction

Function ShowRewards()
	OpenBook()
	
	;TEMP VFX
	Game.GetPlayer().PlaceAtMe(ExplosionIllusionMassiveLight01)
	
	;Enable constellations
	ObjectReference nextConstellation = Self.GetLinkedRef(LinkCustom01)
	While (nextConstellation != None)
; 		Debug.Trace("Enabling " + nextConstellation)
		nextConstellation.EnableNoWait(True)
		nextConstellation = nextConstellation.GetLinkedRef(LinkCustom01)
		Utility.Wait(0.1)
	EndWhile		
	
	EnableToSolstheimActivator()
	rewardsShown = True
EndFunction

Function ConstellationActivated(ObjectReference constellation, int constellationID)
	Actor player = Game.GetPlayer()
	int iPerkCount = CountPerks(constellationID)
	
	;Make sure the player is not in combat, has a Dragon Soul, and has perks to recover.
	if (player.IsInCombat())
		DLC2AltarNotInCombatMSG.Show()
		Return
	ElseIf (player.GetActorValue("DragonSouls") == 0)
		DLC2AltarNoSoulsMSG.Show()
		Return
	ElseIf (iPerkCount == 0)
		DLC2AltarNoPerksInThisSkillMSG.Show()
		Return
	EndIf
	
	;Confirm that the player wants to clear their perks before doing so.
	int confirmed = 0
	if (iPerkCount == 1)
		confirmed = (DLC2AltarSkillMessagesSingular.GetAt(constellationID) as Message).Show(iPerkCount)
	Else
		confirmed = (DLC2AltarSkillMessagesPlural.GetAt(constellationID) as Message).Show(iPerkCount)
	EndIf
	
	;If the player agreed, remove the perks.
	if (confirmed == 1)
		;Play VFX
		DLC2ApocryphaRewardSpell.Cast(Player)
		;Spend Dragon Soul.
		player.ModActorValue("DragonSouls", -1)
		;Remove Perks
		int iPerkPoints = CountPerks(constellationID, true)
		;Restore Perk Points
		Game.AddPerkPoints(iPerkPoints)
		;Display confirmation message.
		if (iPerkPoints > 1)
			DLC2AltarPerkPointsRefundedPlural.Show(iPerkPoints)
		Else
			DLC2AltarPerkPointsRefundedSingular.Show(iPerkPoints)
		EndIf
	EndIf
EndFunction

int function CountPerks(int iSkill, bool bClearPerks = false)
; 	debug.trace(self + "CountPerks for skill=" + iSkill)
	; if bClearPerks = true, also clear the perks
		; iterate through form list of perks
		; give back each perk the player has, then remove perk
	actor player = Game.GetPlayer()
	int iItem = 0
	int iPerkCount = 0 ; how many perk points to give player when done
	FormList myPerks = PerkArray[iSkill]
	while iItem < myPerks.GetSize()
		if player.HasPerk(myPerks.GetAt(iItem) as Perk)
; 			debug.trace(self + " player has " + myPerks.GetAt(iItem) as Perk)
			iPerkCount = iPerkCount + 1
		EndIf
		if bClearPerks
; 			debug.trace(self + " - removing perk")
			player.RemovePerk(myPerks.GetAt(iItem) as Perk)
		endif
		iItem = iItem + 1
	endWhile
; 	debug.trace(self + " total of " + iPerkCount + " perks")
	return iPerkCount
endFunction



Message Property DLC2AltarNoSoulsMSG Auto
Message Property DLC2AltarNoPerksInThisSkillMSG Auto
Message Property DLC2AltarNotInCombatMSG  Auto
FormList Property DLC2AltarSkillMessagesSingular  Auto  
FormList Property DLC2AltarSkillMessagesPlural  Auto  
Message Property DLC2AltarPerkPointsRefundedSingular Auto
Message Property DLC2AltarPerkPointsRefundedPlural Auto
Explosion property ExplosionIllusionMassiveLight01 Auto
Keyword property LinkCustom01 Auto
  
