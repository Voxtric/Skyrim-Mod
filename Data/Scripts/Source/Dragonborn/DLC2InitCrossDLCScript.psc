Scriptname DLC2InitCrossDLCScript extends ReferenceAlias
{Handle Cross-DLC scripting between DLC2 and DLC1/BYOH.}

Formlist Property DLC2KarstaagSummonWorldSpaces Auto
Formlist Property RidableWorldSpaces Auto
Formlist Property SunDamageExceptionWorldSpaces Auto


Quest Property MQ306 Auto
Faction Property DLC2BendWillImmuneFaction Auto
Actor Property OdahviingRef Auto

Faction Property DLC2MorasGraspExcludedFaction Auto

Faction Property DLC2CrimeFactionRavenRock Auto
Faction Property DLC2SkaalVillageCitizenFaction Auto
Faction Property DLC2ThirskNordCrimeFaction Auto

bool Property DLC1Initialized Auto Hidden
bool Property BYOHInitialized Auto Hidden
bool Property DLC1AndBYOHInitialized Auto Hidden

Actor property DLC2SVAetaRef Auto
Race property DwarvenSpiderRace Auto
Race property DwarvenSphereRace Auto
Ingredient property DLC2BoarTusk Auto
Ingredient property DLC2HangingMoss Auto
Ingredient property DLC2Scathecraw01 Auto
Ingredient property DLC2SpikyGrassAsh01 Auto
Ingredient property DLC2TramaRoot01 Auto
Potion property DLC2dunBloodskalPotionOfWaterWalking Auto
Weapon property DLC2NordicDagger Auto
Weapon property DLC2StalhrimDagger Auto
Worldspace property DLC2ApocryphaWorld auto


Event OnPlayerLoadGame()
	Quest DLC1SampleForm = Game.GetFormFromFile(0x0000352A, "Dawnguard.esm") as Quest ;DLC1VQ01
	Quest BYOHSampleForm = Game.GetFormFromFile(0x000042B4, "HearthFires.esm") as Quest ;BYOHRelationshipAdoption
; 	Debug.Trace("DLC2InitCrossDLCScript found: " + DLC1SampleForm + ", " + BYOHSampleForm)
	if (DLC1SampleForm && !DLC1Initialized)
		;Initialize DLC2 -> DLC1.
		DLC1Initialized = True
		;-------------------------------------------------
		;| DLC02 <-> DLC01 Karstaag & Arvak Worldspaces  | 
		;-------------------------------------------------
		;Add Solstheim to Arvak's list.
; 		Debug.Trace("Arvak: Adding " + Game.GetFormFromFile(0x0000800, "Dragonborn.esm") + " to " + RidableWorldSpaces)
		RidableWorldSpaces.AddForm(Game.GetFormFromFile(0x0000800, "Dragonborn.esm"))
		;Add Soul Cairn & Dayspring Canyon to Karstaag's list.
		DLC2KarstaagSummonWorldSpaces.AddForm(Game.GetFormFromFile(0x00001408, "Dawnguard.esm"))
		DLC2KarstaagSummonWorldSpaces.AddForm(Game.GetFormFromFile(0x00001DB8, "Dawnguard.esm"))

		;------------------------------------------------
		; Durnehviir Bend Will immunity
		;------------------------------------------------
		actor durnehviir = Game.GetFormFromFile(0x00007A31, "Dawnguard.esm") as Actor
		if durnehviir
; 			debug.trace(self + " found Durnehviir in Dawnguard.esm")
			durnehviir.AddToFaction(DLC2BendWillImmuneFaction)
		endif

		;------------------------------------------------
		; Adding raven rock crime faction to vampire hate factions
		;------------------------------------------------
		FormList DLC1VampireHateFactions = Game.GetFormFromFile(0x0000989F, "Dawnguard.esm") as FormList
		DLC1VampireHateFactions.AddForm(DLC2CrimeFactionRavenRock)
		DLC1VampireHateFactions.AddForm(DLC2SkaalVillageCitizenFaction)
		DLC1VampireHateFactions.AddForm(DLC2ThirskNordCrimeFaction)

		;------------------------------------------------
		; Make Harkon immune to Mora's Grasp.
		;------------------------------------------------
		(Game.GetFormFromFile(0x0000EC1B, "Dawnguard.esm") as Actor).AddToFaction(DLC2MorasGraspExcludedFaction)
		(Game.GetFormFromFile(0x0000EC8B, "Dawnguard.esm") as Actor).AddToFaction(DLC2MorasGraspExcludedFaction)

		;------------------------------------------------
		; Update global to allow Nordic/Stalhrim arrow smithing
		;------------------------------------------------
		DLC2ArrowSmithing.SetValue(1)

	EndIf
	if (BYOHSampleForm && !BYOHInitialized)
		;Initialize DLC2 -> BYOH.
		BYOHInitialized = True
; 		Debug.Trace("Now updating Hearthfire content.")
		
		;---------------------------------
		;| Make Aeta Adoptable           | 
		;---------------------------------
		Quest BYOHRelationshipAdoptable = Game.GetFormFromFile(0x00004291, "HearthFires.esm") as Quest
		(BYOHRelationshipAdoptable as BYOHRelationshipAdoptableAccessor).AddOrphanableChild(DLC2SVAetaRef)
		
		;---------------------------------
		;| Update pet and critter lists  | 
		;---------------------------------
		;DO NOT allow pet adoption of DLC2 Kagrumez Spiders and Spheres.
		;Unfortunately, there's a bug in the Hearthfire dialogue conditions that means the child will always call the creature a 'dog'.
		;
		;FormList PetAllowedRacesList = Game.GetFormFromFile(0x000192D2, "HearthFires.esm") as FormList
		;PetAllowedRacesList.AddForm(DwarvenSpiderRace)
		;PetAllowedRacesList.AddForm(DwarvenSphereRace)
		
		;---------------------------------
		;| Update gift lists             | 
		;---------------------------------
		;Add DLC2 items to the childrens' lists.
		FormList Gifts0000 = Game.GetFormFromFile(0x00002F5C, "HearthFires.esm") as FormList
		FormList Gifts0500 = Game.GetFormFromFile(0x00002F60, "HearthFires.esm") as FormList
		Gifts0000.AddForm(DLC2BoarTusk)
		Gifts0000.AddForm(DLC2HangingMoss)
		Gifts0000.AddForm(DLC2Scathecraw01)
		Gifts0000.AddForm(DLC2SpikyGrassAsh01)
		Gifts0000.AddForm(DLC2TramaRoot01)
		Gifts0500.AddForm(DLC2dunBloodskalPotionOfWaterWalking)
		
		;Add DLC2 Daggers to the acceptable gifts list.
		FormList GiftsFemale = Game.GetFormFromFile(0x00007B75, "HearthFires.esm") as FormList
		FormList GiftsMale = Game.GetFormFromFile(0x00007B74, "HearthFires.esm") as FormList
		GiftsFemale.AddForm(DLC2NordicDagger)
		GiftsMale.AddForm(DLC2NordicDagger)
		GiftsFemale.AddForm(DLC2StalhrimDagger)
		GiftsMale.AddForm(DLC2StalhrimDagger)
		
; 		Debug.Trace("Done updating Hearthfire content.")
	EndIf

	if (DLC1SampleForm && BYOHSampleForm && !DLC1AndBYOHInitialized)
		;Initialize DLC2 -> [DLC1 & BYOH].
		DLC1AndBYOHInitialized = True
	EndIf

	; Other checks:
	if MQ306.GetStageDone(10) == false
		OdahviingRef.AddToFaction(DLC2BendWillImmuneFaction)
	else
		OdahviingRef.RemoveFromFaction(DLC2BendWillImmuneFaction)
	endif
	SunDamageExceptionWorldSpaces.addForm(DLC2ApocryphaWorld)
	;Adding the Apocrypha Worldspace to the Sun Damage Exception list so vampires will not take sun damage there
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; failsafe to start Solstheim quests if player enters Solstheim
	if GetOwningQuest().GetStageDone(100) == false && akNewLoc == DLC2SolstheimLocation
		GetOwningQuest().setstage(100)
	endif	
EndEvent


Location Property DLC2SolstheimLocation  Auto  

GlobalVariable Property DLC2ArrowSmithing  Auto  
