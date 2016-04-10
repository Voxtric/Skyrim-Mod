Scriptname BYOHRelationshipAdoptableScript extends Quest Conditional
{Quest Script for BYOHRelationshipAdoptable.}

;This script is responsible for:
; - Managing all of the dialogue, behaviors, events, and subquests related to adopting children.
; - Handing off newly-adopted children to RelationshipAdoption, which takes them from there.
; - Tracking and validating which houses and children's bedrooms the player owns (in conjunction with the HousePurchase quest).

;----------------------------------------------------------------------------------------------------
;PROPERTIES & VARIABLES
;-------------------------------------
;Track whether the player owns a house their spouse could live in.
;For the BYOH houses, this represents both owning the house and having some basic furniture built for it.
bool property BYOHAdoption_PlayerOwnsAnyHouse = False auto conditional
bool property BYOHAdoption_PlayerOwns_BYOHFalkreath = False auto conditional
bool property BYOHAdoption_PlayerOwns_BYOHHjaalmarch = False auto conditional
bool property BYOHAdoption_PlayerOwns_BYOHPale = False auto conditional

;Track which houses have children's bedrooms.
bool property BYOHAdoption_HasChildBedroom_Any = False auto conditional
bool property BYOHAdoption_HasChildBedroom_Multiple = False auto conditional
bool property BYOHAdoption_HasChildBedroom_Solitude = False auto conditional
bool property BYOHAdoption_HasChildBedroom_Windhelm = False auto conditional
bool property BYOHAdoption_HasChildBedroom_Markarth = False auto conditional
bool property BYOHAdoption_HasChildBedroom_Riften = False auto conditional
bool property BYOHAdoption_HasChildBedroom_Whiterun = False auto conditional
bool property BYOHAdoption_HasChildBedroom_BYOHFalkreath = False auto conditional
bool property BYOHAdoption_HasChildBedroom_BYOHHjaalmarch = False auto conditional
bool property BYOHAdoption_HasChildBedroom_BYOHPale = False auto conditional

;Enable markers for the children's bedrooms.
ObjectReference property BYOHAdoption_ChildBedroomMarker_Solitude auto
ObjectReference property BYOHAdoption_ChildBedroomMarker_Windhelm auto
ObjectReference property BYOHAdoption_ChildBedroomMarker_Markarth auto
ObjectReference property BYOHAdoption_ChildBedroomMarker_Riften auto
ObjectReference property BYOHAdoption_ChildBedroomMarker_Whiterun auto

;The DLC01 House quests.
Quest property BYOHHouseFalkreath Auto
Quest property BYOHHouseHjaalmarch Auto
Quest property BYOHHousePale Auto

;Main Courier Quest
Quest property CourierQuest Auto

;Orphanage Courier event and related variables.
Quest property DB02 Auto
Quest property WICourier Auto
Book property BYOHAdoptionConstanceLetter Auto
bool orphanageCourierHasTriggered

;Steward's Courier event and related variables.
Keyword property BYOHAdoptionStewardCourierEvent Auto
Quest property BYOHRelationshipAdoptableStewardCourier Auto
Location property SolitudeLocation Auto
Location property WindhelmLocation Auto
Location property MarkarthLocation Auto
Location property RiftenLocation Auto
Location property WhiterunLocation Auto

;Orphanable Children and related variables.
Faction property BYOHRelationshipAdoptableFaction Auto
Faction property BYOHRelationshipAdoptionFaction Auto
Quest property BYOHRelationshipAdoptableUrchins Auto
Keyword property LinkCustom01 Auto			;Link to the child's father, if any.
Keyword property LinkCustom02 Auto			;Link to the child's mother, if any.
Keyword property LinkCustom03 Auto			;Link to the child's guardian, if any.
Keyword property LinkCustom04 Auto			;Link to the child's guardian, if any.

;Orphanage Adoption quest and related variables.
ObjectReference property ConstanceMichelRef Auto
Quest property BYOHRelationshipAdoptableOrphanage Auto

;Other Quests
Quest property HousePurchase Auto
Quest property RelationshipMarriageFIN Auto
Quest property WIKill05 Auto


;DLC Initialization Objects - Objects that need to be pushed into base-game objects and formlists.
;Note that objects that need to be pushed to or from BYOH lists are handled on BYOHHouseBuildingScript
;to avoid duplicating cross-DLC functionality any more than necessary.
Weapon property BYOHWoodenSword Auto
MiscObject property BYOHChildrensDoll Auto
MiscObject property ClothesChild01Female Auto
MiscObject property ClothesChild01Male Auto
MiscObject property ClothesChild02Female Auto
MiscObject property ClothesChild02Male Auto
MiscObject property ClothesChild03Female Auto
MiscObject property ClothesChild03Male Auto
MiscObject property ClothesChild04Female Auto
MiscObject property ClothesChild04Male Auto
MiscObject property ClothesChild05Female Auto
MiscObject property ClothesChild05Male Auto
LeveledItem property BYOHRelationshipAdoptionLItemChildrensClothes01 Auto
LeveledItem property BYOHRelationshipAdoptionLItemChildrensClothes02 Auto
LeveledItem property BYOHRelationshipAdoptionLItemChildrensClothes03 Auto
LeveledItem property BYOHRelationshipAdoptionLItemChildrensClothes04 Auto
LeveledItem property BYOHRelationshipAdoptionLItemChildrensClothes05 Auto

LeveledItem property LItemClothesAll Auto
LeveledItem property LItemMiscVendorMiscItems75 Auto


;----------------------------------------------------------------------------------------------------
;ADOPTION STARTUP SCRIPT
;-----------------------

;This function should run when the DLC first starts, or at game start, to fixup the system for Adoption.
Function BYOHAdoptionStartup()
	;Update LeveledItem and Formlists from the base game.
	UpdateBaseGameLists()

	;Update enable markers in player houses.
	(HousePurchase as BYOHRelationshipAdoptionHousePurchase).BYOHRelationshipAdoptionHousePurchaseSTARTUP()
	
	;Update this script's records of which houses and bedrooms have been purchased.
	Self.UpdateHouseStatus()
	
	;Trigger the Steward's Courier event if applicable.
	Self.TriggerStewardCourierEvent()
	
	;Start the update loop, which:
	; - Checks all of the Orphanable children to see if they've been orphaned.
	; - Triggers the Orphanage Courier event if applicable.
	Self.OnUpdateGameTime()
	
	;Begin tracking the spouse's location.
	if (RelationshipMarriageFIN.IsRunning())
		(RelationshipMarriageFIN as RelationshipMarriageSpouseHouseScript).UpdateSpouseHouseInt()
	EndIf
EndFunction


;Update LeveledItem and Formlist lists from the base game to contain Adoption-related content.
Function UpdateBaseGameLists()
	;Khajiit Caravans: Sell all toys, chance of clothes. Added to their chests in the ESM, since we can't update containers via script.
	;Radiant Raiment: Sell all children's clothes. Add the clothes to LItemClothesAll, since Raiment is the only user of this list.
	LItemClothesAll.AddForm(ClothesChild01Female, 1, 1)
	LItemClothesAll.AddForm(ClothesChild01Male, 1, 1)
	LItemClothesAll.AddForm(ClothesChild02Female, 1, 1)
	LItemClothesAll.AddForm(ClothesChild02Male, 1, 1)
	LItemClothesAll.AddForm(ClothesChild03Female, 1, 1)
	LItemClothesAll.AddForm(ClothesChild03Male, 1, 1)
	LItemClothesAll.AddForm(ClothesChild04Female, 1, 1)
	LItemClothesAll.AddForm(ClothesChild04Male, 1, 1)
	LItemClothesAll.AddForm(ClothesChild05Female, 1, 1)
	LItemClothesAll.AddForm(ClothesChild05Male, 1, 1)
	;Misc Merchants/Loot: Add wooden sword, doll, clothes sublists to LItemMiscVendorMiscItems75 to ensure a chance of them at other merchants.
	LItemMiscVendorMiscItems75.AddForm(BYOHWoodenSword, 1, 1)
	LItemMiscVendorMiscItems75.AddForm(BYOHChildrensDoll, 1, 1)
	LItemMiscVendorMiscItems75.AddForm(BYOHWoodenSword, 1, 1)
	LItemMiscVendorMiscItems75.AddForm(BYOHChildrensDoll, 1, 1)	
	LItemMiscVendorMiscItems75.AddForm(BYOHRelationshipAdoptionLItemChildrensClothes01, 1, 1)
	LItemMiscVendorMiscItems75.AddForm(BYOHRelationshipAdoptionLItemChildrensClothes02, 1, 1)
	LItemMiscVendorMiscItems75.AddForm(BYOHRelationshipAdoptionLItemChildrensClothes03, 1, 1)
	LItemMiscVendorMiscItems75.AddForm(BYOHRelationshipAdoptionLItemChildrensClothes04, 1, 1)
	LItemMiscVendorMiscItems75.AddForm(BYOHRelationshipAdoptionLItemChildrensClothes05, 1, 1)
EndFunction


;----------------------------------------------------------------------------------------------------
;HOUSE PURCHASE TRACKING
;-----------------------

;Update house tracking variables whenver something significant happens to a player house.
Function UpdateHouseStatus()
	;Do we know the player owns a house at all? If not, check.
	if (!BYOHAdoption_PlayerOwnsAnyHouse)
		if (((HousePurchase as HousePurchaseScript).SolitudeHouseVar >= 1) \
			 || ((HousePurchase as HousePurchaseScript).WindhelmHouseVar >= 1) \
			 || ((HousePurchase as HousePurchaseScript).MarkarthHouseVar >= 1) \
			 || ((HousePurchase as HousePurchaseScript).RiftenHouseVar >= 1) \
			 || ((HousePurchase as HousePurchaseScript).WhiterunHouseVar >= 1) \
			 || ((BYOHHouseFalkreath as BYOHHouseScript).bAllowSpouse) \
			 || ((BYOHHouseHjaalmarch as BYOHHouseScript).bAllowSpouse) \		
			 || ((BYOHHousePale as BYOHHouseScript).bAllowSpouse))
			BYOHAdoption_PlayerOwnsAnyHouse = True
		EndIf
	EndIf
	
	
	;For the BYOH Houses, has the player built the basic house and a bed for their spouse?
	;The name is a bit misleading, since bAllowSpouse can be false (because you haven't built a bed) while bAllowChildren is true.
	if ((BYOHHouseFalkreath as BYOHHouseScript).bAllowSpouse)
		BYOHAdoption_PlayerOwns_BYOHFalkreath = True
	EndIf
	if ((BYOHHouseHjaalmarch as BYOHHouseScript).bAllowSpouse)
		BYOHAdoption_PlayerOwns_BYOHHjaalmarch = True
	EndIf
	if ((BYOHHousePale as BYOHHouseScript).bAllowSpouse)
		BYOHAdoption_PlayerOwns_BYOHPale = True
	EndIf
	
	
	;Next, check to see if the player owns any children's bedrooms.
	int childBedroomCount = 0
		
	;Standard houses.
	if (!BYOHAdoption_ChildBedroomMarker_Solitude.IsDisabled())
		childBedroomCount = childBedroomCount + 1
		BYOHAdoption_HasChildBedroom_Solitude = True
	Else
		BYOHAdoption_HasChildBedroom_Solitude = False
	EndIf
	if (!BYOHAdoption_ChildBedroomMarker_Windhelm.IsDisabled())
		childBedroomCount = childBedroomCount + 1
		BYOHAdoption_HasChildBedroom_Windhelm = True
	Else
		BYOHAdoption_HasChildBedroom_Windhelm = False
	EndIf
	if (!BYOHAdoption_ChildBedroomMarker_Markarth.IsDisabled())
		childBedroomCount = childBedroomCount + 1
		BYOHAdoption_HasChildBedroom_Markarth = True
	Else
		BYOHAdoption_HasChildBedroom_Markarth = False
	EndIf
	if (!BYOHAdoption_ChildBedroomMarker_Riften.IsDisabled())
		childBedroomCount = childBedroomCount + 1
		BYOHAdoption_HasChildBedroom_Riften = True
	Else
		BYOHAdoption_HasChildBedroom_Riften = False
	EndIf
	if (!BYOHAdoption_ChildBedroomMarker_Whiterun.IsDisabled())
		childBedroomCount = childBedroomCount + 1
		BYOHAdoption_HasChildBedroom_Whiterun = True
	Else
		BYOHAdoption_HasChildBedroom_Whiterun = False
	EndIf
		
	;BYOH Houses
	if ((BYOHHouseFalkreath as BYOHHouseScript).bAllowChildren)
		childBedroomCount = childBedroomCount + 1
		BYOHAdoption_HasChildBedroom_BYOHFalkreath = True
	Else
		BYOHAdoption_HasChildBedroom_BYOHFalkreath = False
	EndIf
	if ((BYOHHouseHjaalmarch as BYOHHouseScript).bAllowChildren)
		childBedroomCount = childBedroomCount + 1
		BYOHAdoption_HasChildBedroom_BYOHHjaalmarch = True
	Else
		BYOHAdoption_HasChildBedroom_BYOHHjaalmarch = False
	EndIf
	if ((BYOHHousePale as BYOHHouseScript).bAllowChildren)
		childBedroomCount = childBedroomCount + 1
		BYOHAdoption_HasChildBedroom_BYOHPale = True
	Else
		BYOHAdoption_HasChildBedroom_BYOHPale = False
	EndIf
	
	
	;Then update the 'Any' and 'Multiple' variables.
	if (childBedroomCount == 0)
		BYOHAdoption_HasChildBedroom_Any = False
		BYOHAdoption_HasChildBedroom_Multiple = False
	ElseIf (childBedroomCount == 1)
		BYOHAdoption_HasChildBedroom_Any = True
		BYOHAdoption_HasChildBedroom_Multiple = False
	Else
		BYOHAdoption_HasChildBedroom_Any = True
		BYOHAdoption_HasChildBedroom_Multiple = True
	EndIf
EndFunction

;When a move is triggered, confirm that the player's family can actually be moved to that location. If not, select the best alternative.
;Used to handle edge cases, such as choosing a destination with Constance, then selling the child's bedroom there, THEN going through with the adoption.
int Function ValidateMoveDestination(int destination, int secondary)
	int tertiary = 0
	if (BYOHAdoption_HasChildBedroom_Solitude)
		if (destination == 1)
			return destination
		ElseIf (tertiary == 0)
			tertiary = 1
		EndIf
	EndIf
	if (BYOHAdoption_HasChildBedroom_Windhelm)
		if (destination == 2)
			return destination
		ElseIf (tertiary == 0)
			tertiary = 2
		EndIf
	EndIf
	if (BYOHAdoption_HasChildBedroom_Markarth)
		if (destination == 3)
			return destination
		ElseIf (tertiary == 0)
			tertiary = 3
		EndIf
	EndIf
	if (BYOHAdoption_HasChildBedroom_Riften)
		if (destination == 4)
			return destination
		ElseIf (tertiary == 0)
			tertiary = 4
		EndIf
	EndIf
	if (BYOHAdoption_HasChildBedroom_Whiterun)
		if (destination == 5)
			return destination
		ElseIf (tertiary == 0)
			tertiary = 5
		EndIf
	EndIf
	if (BYOHAdoption_HasChildBedroom_BYOHFalkreath)
		if (destination == 6)
			return destination
		ElseIf (tertiary == 0)
			tertiary = 6
		EndIf
	EndIf
	if (BYOHAdoption_HasChildBedroom_BYOHHjaalmarch)
		if (destination == 7)
			return destination
		ElseIf (tertiary == 0)
			tertiary = 7
		EndIf
	EndIf
	if (BYOHAdoption_HasChildBedroom_BYOHPale)
		if (destination == 8)
			return destination
		ElseIf (tertiary == 0)
			tertiary = 8
		EndIf
	EndIf

	if (secondary > 0)
		return secondary
	EndIf
	
	return tertiary 
EndFunction


;----------------------------------------------------------------------------------------------------
;COURIER EVENTS
;--------------

;Handle Steward's Courier Event.
;Occurs only on DLC Start, to notify the player of Child Bedroom availability.
Function TriggerStewardCourierEvent()
	if (BYOHAdoption_PlayerOwnsAnyHouse)
		Location homeCityLoc
		if ((HousePurchase as HousePurchaseScript).WhiterunHouseVar >= 1)
			homeCityLoc = WhiterunLocation
		ElseIf ((HousePurchase as HousePurchaseScript).SolitudeHouseVar >= 1)
			homeCityLoc = SolitudeLocation
		ElseIf ((HousePurchase as HousePurchaseScript).WindhelmHouseVar >= 1)
			homeCityLoc = WindhelmLocation
		ElseIf ((HousePurchase as HousePurchaseScript).MarkarthHouseVar >= 1)
			homeCityLoc = MarkarthLocation
		Else ;Riften
			homeCityLoc = RiftenLocation
		EndIf
		
		;Trigger the event.
		;Debug.Trace("Starting the Steward's Courier for: " + homeCityLoc)
		BYOHAdoptionStewardCourierEvent.SendStoryEvent(homeCityLoc)
	EndIf	
EndFunction

;Handle Orphanage Courier Event.
;Occurs once the player has escaped from the shack in DB02, or at DLC start if that has already happened.
Function TriggerOrphanageCourierEvent()
	;Debug.Trace("Orphanage Courier Update.")
	if (DB02.GetStage() >= 40 && !(ConstanceMichelRef as Actor).IsDead())
		orphanageCourierHasTriggered = True
		(WICourier as WICourierScript).AddItemToContainer(BYOHAdoptionConstanceLetter)
	EndIf
EndFunction

;Manage the 'Adopt Children from the Orphanage' Misc Objective.
; [1] Show the Orphanage Objective when the player reads the courier's letter.
; [2] Complete it when the player completes Constance's questionnaire.
; [3] Hide it quietly when Constance dies or when the player adopts two children from other sources.
Function ShowOrphanageObjective(int objState)
	;Debug.Trace("ShowOrphanageObjective: " + objState + ", " + IsObjectiveDisplayed(10))
	if (objState == 1)	;Try to display the objective.
		if (!GetStageDone(255) && !(ConstanceMichelRef as Actor).IsDead() && BYOHRelationshipAdoptableOrphanage.GetStage() < 100)
			;If we can still adopt kids, and Constance is alive, and the player hasn't completed her questionnaire, allow the objective.
			SetObjectiveDisplayed(10)
		EndIf
	ElseIf (objState == 2)
		if (IsObjectiveDisplayed(10))
			;Complete it when the player adopts a child.
			SetObjectiveCompleted(10)
		EndIf
	Else
		;Otherwise, hide it quietly.
		SetObjectiveDisplayed(10, False, False)
	EndIf
EndFunction


;----------------------------------------------------------------------------------------------------
;ORPHANABLE CHILDREN EVENTS
;--------------------------

;Adoptable's update loop:
; - Triggers the Orphanage Courier event if applicable.
; - Checks all of the Orphanable children to see if they've been orphaned.
Event OnUpdateGameTime()
	;Debug.Trace("Adoptable Update Loop")
	if ((Self as Quest).GetStage() < 255)
		;If the Orphanage Courier event hasn't triggered yet, test it again.
		if (!orphanageCourierHasTriggered)
			TriggerOrphanageCourierEvent()
		EndIf
		
		;Check for orphaned children and update their status.
		UpdateOrphanablesStatus()
		
		;Schedule a new update in 24h.
		;Debug.Trace("Rescheduling Adoptable Update Loop")
		RegisterForSingleUpdateGameTime(1)
	EndIf
EndEvent

;On DLC Start, and once every 24h, check to see whether each Orphanable Child has been orphaned.
Function UpdateOrphanablesStatus()
	;This function runs only if the player has not already adopted two children. Once they do, everything reverts to the base game behavior.
	if (Self.GetStage() == 0)
		Actor child
		ObjectReference father
		ObjectReference mother
		ObjectReference guardian01
		ObjectReference guardian02
		int i = 0
		Debug.Trace("Updating Orphanables Status: ------------------------")
		While (i < ((Self as Quest) as BYOHRelationshipAdoptableAccessor).OrphanableChildren.Length)
			child = ((Self as Quest) as BYOHRelationshipAdoptableAccessor).OrphanableChildren[i]
			
			if (child != None)	
				;Is the child an orphan? If they haven't been orphaned before, check to see if they're an orphan now.
				if (child.GetFactionRank(BYOHRelationshipAdoptableFaction) < 0)
					;Debug.Trace("Updating Orphanables Status for " + child)
					
					;Identify the NPCs responsible for the child.
					father = child.GetLinkedRef(LinkCustom01)
					mother = child.GetLinkedRef(LinkCustom02)
					guardian01 = child.GetLinkedRef(LinkCustom03)
					guardian02 = child.GetLinkedRef(LinkCustom04)
			
					;Determine whether the child has been orphaned.
					if ((father == None || (father as Actor).IsDead() || (father as Actor).IsCommandedActor()) && \
						(mother == None || (mother as Actor).IsDead() || (mother as Actor).IsCommandedActor()) && \
						(guardian01 == None || (guardian01 as Actor).IsDead() || (guardian01 as Actor).IsCommandedActor()) && \
						(guardian02 == None || (guardian02 as Actor).IsDead() || (guardian02 as Actor).IsCommandedActor()))
						
						;If all of these tests pass, the child has been orphaned.
						Debug.Trace(child + " has been orphaned.")
						
						;Push the child into the Adoptable faction and update its rank. This enables the orphan dialogue.
						if (!child.IsInFaction(BYOHRelationshipAdoptableFaction))
							child.AddToFaction(BYOHRelationshipAdoptableFaction)
						EndIf
						child.SetFactionRank(BYOHRelationshipAdoptableFaction, 0)
			
						;Reset RelationshipRank to avoid awkward "I Hate You" dialogue.
						child.SetRelationshipRank(Game.GetPlayer(), 0)
			
						;Set Variable06 to identify which lines they should use.
						if (father == None && mother == None)
							child.SetAV("Variable06", 1)
						ElseIf (mother == None)
							child.SetAV("Variable06", 2)
						ElseIf (father == None)
							child.SetAV("Variable06", 3)
						Else
							child.SetAV("Variable06", 1)
						EndIf
					EndIf
				EndIf
				
				;If the child is an orphan, try to transfer them to the Orphanage.
				if (child.GetFactionRank(BYOHRelationshipAdoptableFaction) >= 0)
					Debug.Trace("Requesting transfer for " + child)
					RequestOrphanageTransfer(child)
				EndIf
			Else
				;If the next item in the list is a 'None', bail out.
				i = ((Self as Quest) as BYOHRelationshipAdoptableAccessor).OrphanableChildren.Length
				Debug.Trace("-------------------")
			EndIf
			i = i + 1	
		EndWhile
	EndIf
EndFunction


;Once the player adopts two children, disable further adoptions from any source.
Function DisableNewAdoptions()
	;This quest manages the Orphanable Children directly.
	;Debug.Trace("Disable Orphanable Adoptions.")
	Actor child
	int i = 0
	While (i < ((Self as Quest) as BYOHRelationshipAdoptableAccessor).OrphanableChildren.Length)
		child = ((Self as Quest) as BYOHRelationshipAdoptableAccessor).OrphanableChildren[i]
		if (child != None)
			;Debug.Trace("Disabling Adoption for " + child)
			if (!child.IsInFaction(BYOHRelationshipAdoptionFaction))
				child.SetFactionRank(BYOHRelationshipAdoptableFaction, -1)
			EndIf
		Else
			;Bail when we reach a 'None' object in the list.
			i = ((Self as Quest) as BYOHRelationshipAdoptableAccessor).OrphanableChildren.Length
		EndIf
		i = i + 1	
	EndWhile
	
	;Orphanage Orphans delegated to a seperate quest.
	;Debug.Trace("Disable Orphanage Adoptions.")
	if (BYOHRelationshipAdoptableOrphanage.IsRunning())
		(BYOHRelationshipAdoptableOrphanage as BYOHRelationshipAdoptableOrphanageSc).DisableOrphanageAdoptions()
	EndIf
	ShowOrphanageObjective(3)
	
	;Urchin Orphans delegated to a seperate quest.
	;Debug.Trace("Disable Urchin Adoptions.")
	(BYOHRelationshipAdoptableUrchins as BYOHRelationshipAdoptableUrchinScript).DisableUrchinAdoption()
EndFunction


;Orphaned children can request a 'transfer' to the Orphanage side of the system.
;Transfers occur only after DB01 has been completed, either in response to that or when the children are tagged as Orphaned.
;Transfer requests are 'approved' if the player is not in the same location, Constance is alive, and fewer than 7 children have been transfered.
;Children transferred to the Orphanage fall under the jurisdiction of the Orphanage system and work like Orphanage Orphans as long as Constance is alive.
Function RequestOrphanageTransfer(Actor child)
	;If the Orphanage quest isn't running, we need to start it now.
	if (!BYOHRelationshipAdoptableOrphanage.IsRunning())
		BYOHRelationshipAdoptableOrphanage.SetStage(0)
	EndIf
	if (Game.GetPlayer().GetCurrentLocation() != child.GetCurrentLocation() && \
		(BYOHRelationshipAdoptableOrphanage as BYOHRelationshipAdoptableOrphanageSc).AcceptingTransfers(child))
		Debug.Trace("Transferring " + child + " to the Orphanage.")
		;Stop WIKill05 (Run Home & Mourn)
		if (WIKill05.IsRunning())
			WIKill05.Stop()
		EndIf
		(BYOHRelationshipAdoptableOrphanage as BYOHRelationshipAdoptableOrphanageSc).TransferOrphan(child)
	Else
		Debug.Trace("Transfer of " + child + " was rejected.")
	EndIf
EndFunction