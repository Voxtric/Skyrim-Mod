Scriptname BYOHRelationshipAdoptionChildScript extends ReferenceAlias Conditional
{Script on the Child Aliases in RelationshipAdoption.}

;This script is responsible for:
;  - Alerting RelationshipAdoption when the child's location changes.
;  - Processing orders given to the child (via RelationshipAdoption).
;  - Processing gifts given to the child  (via RelationshipAdoption).

;----------------------------------------------------------------------------------------------------
;PROPERTIES & VARIABLES
;-------------------------------------
Quest property BYOHRelationshipAdoption Auto
ReferenceAlias property CurrentChildsChest Auto	;Link to the child's chest, as determined by the Scheduler.
Keyword property BYOHAdoptionClothesKeyword Auto	;Keyword to identify children's clothes tokens.
Keyword property BYOHAdoptionToyKeyword Auto		;Keyword to identify children's toys (dolls, etc.).

Armor property ClothesChild01 Auto				;Armor forms for the childrens' outfits.
Armor property ClothesChild02 Auto
Armor property ClothesChild03 Auto
Armor property ClothesChild04 Auto
Armor property ClothesChild05 Auto
Outfit property ChildOutfit01 Auto		;Outfit forms for the childrens' outfits.
Outfit property ChildOutfit02 Auto
Outfit property ChildOutfit03 Auto
Outfit property ChildOutfit04 Auto
Outfit property ChildOutfit05 Auto
MiscObject property ClothesChild01Male Auto	;Since children's clothes are non-Playable, the system manipulates MiscObject 'tokens' that represent them.
MiscObject property ClothesChild02Male Auto	;These are the tokens for the boy versions of the clothes.
MiscObject property ClothesChild03Male Auto
MiscObject property ClothesChild04Male Auto
MiscObject property ClothesChild05Male Auto
MiscObject property ClothesChild01Female Auto	;Tokens for the girl versions of the clothes.
MiscObject property ClothesChild02Female Auto
MiscObject property ClothesChild03Female Auto
MiscObject property ClothesChild04Female Auto
MiscObject property ClothesChild05Female Auto

bool ordersReceived = False		;Internal: Am I under any orders right now?
bool giftsBeingGiven = False		;Internal: Is the player giving me gifts right now.
Weapon weaponToEquip = None		;Internal: Which weapon do we want to equip when gift-giving ends?
MiscObject clothesToEquip = None	;Internal: Which clothes do we want to equip when gift-giving ends?
Armor clothesToRemove = None		;Internal: Which clothes do we want to unequip when gift-giving ends?
bool wasGivenToy = False			;Internal: Were we just given a toy?


;----------------------------------------------------------------------------------------------------
;MOVING SYSTEM
;-------------------------------------

;After adopting a child, whenever the child's location changes, notify the Adoption Quest.
Event OnLocationChange(Location oldLoc, Location newLoc)
	;Debug.Trace("Child OnLocationChange")
	(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).ChildLocationChanged(Self.GetActorRef(), newLoc, oldLoc)
EndEvent


;----------------------------------------------------------------------------------------------------
;ORDERS SYSTEM
;-------------------------------------

;Send the child an order, using the ints listed on BYOHRelationshipAdoption.
Function IssueOrder(float order, float time)
	;Debug.Trace("Child: " + Self.GetActorRef() + " received order " + order)
	
	;Clear any prior registration (orders) from this child.
	UnregisterForUpdateGameTime()
	
	;Record that we're processing an order.
	ordersReceived = True
	
	;Set Variable06 to override the child's scheduled packages (see the list of values in BYOHRelationshipAdoption).
	Self.GetActorRef().SetAV("Variable06", order)
	Self.GetActorRef().EvaluatePackage()
	
	;Orders last the specified amount of time.
	Self.RegisterForSingleUpdateGameTime(time)	
EndFunction


;Normally, orders are passed from dialogue fragment scripts, through RelationshipAdoption, before being prcessed by IssueOrder, above.
;However, when the player gives the child a gift, this script is responsible for processing it. So we send out the 'play with gift' order from here.
Function IssuePlayOrder(float order)
	;Debug.Trace("Play Order Issued: " + order)
	
	;Send the call back to RelationshipAdoption to make sure it works as usual.
	(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).OrderToConfirm = order
	(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).IssueOrderWithDuration(Self.GetActorRef(), 1)
EndFunction


;When the timer expires, remove the order.
Event OnUpdateGameTime()
	;Debug.Trace("Child OnUpdateGameTime.")
	if (ordersReceived)
		ordersReceived = False
		;Debug.Trace("Releasing child from current order.")
		
		;We now return you to your regularly scheduled behavior.
		Self.GetActorRef().SetAV("Variable06", 0)
		Self.GetActorRef().EvaluatePackage()
	EndIf
EndEvent


;----------------------------------------------------------------------------------------------------
;GIFT SYSTEM
;-------------------------------------

;When the player starts giving gifts, turn on a flag to begin processing OnItemAdded events.
;When the player stops, turn off the flag and decide what to do based on the items the child was given.
Function SetGiftState(bool giftState)
	;Debug.Trace("SetGiftState called!")
	giftsBeingGiven = giftState
	
	;Debug.Trace("Setting Gift State: " + giftsBeingGiven + " " + weaponToEquip)
	
	;If given a doll, play with it.
	if (!giftsBeingGiven && wasGivenToy)
		IssuePlayOrder(1.2)	;Order 1.2 - Play with doll for 1h.
		wasGivenToy = False
	EndIf
	
	;If given a weapon, equip it, then go spar.
	if (!giftsBeingGiven && weaponToEquip != None)
		;Debug.Trace("Now Equipping: " + weaponToEquip)
		Self.GetActorRef().EquipItem(weaponToEquip)
		IssuePlayOrder(1.1)	;Order 1.1 - Spar with practice dummy for 1h.
		weaponToEquip = None
	EndIf
	
	if (!giftsBeingGiven && clothesToEquip != None)
		;Debug.Trace("Now Equipping: " + clothesToEquip)
		EquipNewClothes()
		RemoveOldClothes()
		clothesToEquip = None
	EndIf
EndFunction


;When the player is giving gifts (and only then), process OnItemAdded events and direct the items accordingly.
Event OnItemAdded(Form item, int count, ObjectReference ref, ObjectReference source)
	if (giftsBeingGiven)
		;Calculate the item's gold value for later reference.
		int value = item.GetGoldValue() * count
		
		;Debug.Trace("Item Added: " + item + " x " + count + " = " + value)
	
		;Determine what type of item this is.
		if ((item as Weapon) != None)
			;WEAPONS: Equip the new weapon. Send the previously-equipped weapon (and any excess copies of this one) to the child's chest.
			;The logic here is complicated because RemoveItem sometimes creates new items the child didn't have when it 'removes' them to the other container.
			;Debug.Trace("Weapon processed.")
			if (Self.GetActorRef().GetEquippedWeapon() != None)
				Weapon weaponToUnequip = Self.GetActorRef().GetEquippedWeapon()
				;Debug.Trace("Unequipping A: " + weaponToUnequip)
				Self.GetActorRef().UnEquipItem(weaponToUnequip)
				Self.GetActorRef().RemoveItem(weaponToUnequip, 1, false, CurrentChildsChest.GetReference())
			EndIf
			if (weaponToEquip != None && Self.GetActorRef().GetItemCount(weaponToEquip) > 0)
				if (weaponToEquip == (item as Weapon))
					;Debug.Trace("Unequipping B1: " + weaponToEquip)
					Self.GetActorRef().RemoveItem(weaponToEquip, Self.GetActorRef().GetItemCount(weaponToEquip) - 1, false, CurrentChildsChest.GetReference())
				Else
					;Debug.Trace("Unequipping B2: " + weaponToEquip)
					Self.GetActorRef().RemoveItem(weaponToEquip, Self.GetActorRef().GetItemCount(weaponToEquip), false, CurrentChildsChest.GetReference())
				EndIf
			EndIf
			if (Self.GetActorRef().GetItemCount(item) > 1)
				;Debug.Trace("Removing Excess:  " + weaponToEquip + " " + count)
				Self.GetActorRef().RemoveItem(item, Self.GetActorRef().GetItemCount(item) - 1, false, CurrentChildsChest.GetReference())
			EndIf
			weaponToEquip = (item as Weapon)
			(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).UpdateGiftValues(Self.GetActorRef(), value, 0)
		ElseIf ((item as MiscObject) != None)
			;Determine what type of misc object this is...
			if (item.HasKeyword(BYOHAdoptionClothesKeyword))
				;CLOTHES (TOKENS): Store one instance of this token in clothesToEquip. Send any excess, or anything already in this variable, to the chest.
				;Don't bother equipping the clothes until the gift-giving process is over.
				if (clothesToEquip != None)
					;Debug.Trace("Removing Previous Gift:  " + clothesToEquip)
					Self.GetActorRef().RemoveItem(clothesToEquip, 1, false, CurrentChildsChest.GetReference())
				EndIf
				if (Self.GetActorRef().GetItemCount(item) > 1)
					;Debug.Trace("Removing Excess:  " + item + " " + count)
					Self.GetActorRef().RemoveItem(item, Self.GetActorRef().GetItemCount(item) - 1, false, CurrentChildsChest.GetReference())
				EndIf
				clothesToEquip = (item as MiscObject)
				(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).UpdateGiftValues(Self.GetActorRef(), value, 0)				
			ElseIf (item.HasKeyword(BYOHAdoptionToyKeyword))
				;TOYS (Doll, etc.): Keep one, send excess to the chest.
				wasGivenToy = True
				Self.GetActorRef().RemoveItem(item, Self.GetActorRef().GetItemCount(item) - 1, false, CurrentChildsChest.GetReference())
				(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).UpdateGiftValues(Self.GetActorRef(), value, 0)
			Else
				Debug.Trace("ERROR: Unrecognized Misc Item: " + item)
			EndIf
		ElseIf ((item as Book) != None)
			;BOOKS: Send any and all books to the chest.
			;Debug.Trace("Book processed.")
			Self.GetActorRef().RemoveItem(item, count, false, CurrentChildsChest.GetReference())
			(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).UpdateGiftValues(Self.GetActorRef(), value, 0)
		ElseIf ((item as Potion) != None)
			;POTIONS (FOOD): Consume food, and give the child it's equivalent gold value.
			;Debug.Trace("Potion processed.")
			Self.GetActorRef().RemoveItem(item, count)
			(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).UpdateGiftValues(Self.GetActorRef(), value, value)
		Else
			Debug.Trace("ERROR: Unrecognized Item: " + item)
		EndIf
	EndIf
EndEvent


;Unequip the child's current clothes, create a token representing them, and move that token to the chest.
;For cleanliness, we'll do this with a helper function.
Function RemoveOldClothes()
	RemoveOldClothesIfPresent(ClothesChild01, ClothesChild01Male, ClothesChild01Female)
	RemoveOldClothesIfPresent(ClothesChild02, ClothesChild02Male, ClothesChild02Female)
	RemoveOldClothesIfPresent(ClothesChild03, ClothesChild03Male, ClothesChild03Female)
	RemoveOldClothesIfPresent(ClothesChild04, ClothesChild04Male, ClothesChild04Female)
	RemoveOldClothesIfPresent(ClothesChild05, ClothesChild05Male, ClothesChild05Female)
EndFunction

;In game, children's clothing exists as three objects:
; - The actual clothes the children wear are non-playable Armor.
; - 'Boy' and 'Girl' MiscObject clothes tokens.
;   - Because non-playable items don't show up in the player's inventory, but we want the player to be able to give children clothes,
;     we represent the clothes with MiscObjects that are manipulated by this function and the following one.
Function RemoveOldClothesIfPresent(Armor clothes, MiscObject maleToken, MiscObject femaleToken)
	if ((Self.GetActorRef().GetItemCount(clothes) > 0 && !Self.GetActorRef().IsEquipped(clothes)) || Self.GetActorRef().GetItemCount(clothes) > 1)
		Self.GetActorRef().RemoveItem(clothes)
		if (Self.GetActorRef().GetActorBase().GetSex() == 0)
			;Debug.Trace("Unequipped " + clothes + " and moved " + maleToken + " to chest.")
			CurrentChildsChest.GetReference().AddItem(maleToken)
		Else
			;Debug.Trace("Unequipped " + clothes + " and moved " + femaleToken + " to chest.")
			CurrentChildsChest.GetReference().AddItem(femaleToken)
		EndIf	
	EndIf
EndFunction


;Create the Armor corresponding to the child's clothes, equip it, then discard the token in their inventory.
Function EquipNewClothes()
	;Debug.Trace("Verify!")
	if (clothesToRemove != None)
		Self.GetActorRef().UnequipItem(clothesToRemove)
		clothesToRemove = None
	EndIf
	if (clothesToEquip == ClothesChild01Male || clothesToEquip == ClothesChild01Female)
		clothesToRemove = ClothesChild01
		Self.GetActorRef().SetOutfit(ChildOutfit01, True)
		Self.GetActorRef().EquipItem(ClothesChild01, True)
	ElseIf (clothesToEquip == ClothesChild02Male || clothesToEquip == ClothesChild02Female)
		clothesToRemove = ClothesChild02
		Self.GetActorRef().SetOutfit(ChildOutfit02, True)
		Self.GetActorRef().EquipItem(ClothesChild02, True)
	ElseIf (clothesToEquip == ClothesChild03Male || clothesToEquip == ClothesChild03Female)
		clothesToRemove = ClothesChild03
		Self.GetActorRef().SetOutfit(ChildOutfit03, True)
		Self.GetActorRef().EquipItem(ClothesChild03, True)
	ElseIf (clothesToEquip == ClothesChild04Male || clothesToEquip == ClothesChild04Female)
		clothesToRemove = ClothesChild04
		Self.GetActorRef().SetOutfit(ChildOutfit04, True)
		Self.GetActorRef().EquipItem(ClothesChild04, True)
	ElseIf (clothesToEquip == ClothesChild05Male || clothesToEquip == ClothesChild05Female)
		clothesToRemove = ClothesChild05
		Self.GetActorRef().SetOutfit(ChildOutfit05, True)
		Self.GetActorRef().EquipItem(ClothesChild05, True)
	Else
		Debug.Trace("ERROR: Trying to equip clothes not in the list. " + clothesToEquip)
	EndIf
	Self.GetActorRef().RemoveItem(clothesToEquip, 1)
	;Debug.Trace("New clothes equipped.")
EndFunction
