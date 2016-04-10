Scriptname BYOHHiddenObjectScript extends ObjectReference  
{scripted object that adds specified item to player's inventory when added to player}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		debug.trace(self+" akNewContainer = "+akNewContainer+",  akOldContainer = "+akOldContainer)
		; add item to player
		if itemToAddPotion
			Game.GetPlayer().AddItem(itemToAddPotion, itemCount, true)
		endif
		if itemToAddIngredient
			Game.GetPlayer().AddItem(itemToAddIngredient, itemCount, true)
		endif
		; now remove myself
		Game.GetPlayer().RemoveItem(myBase, 999, true)
	EndIf
EndEvent



Potion Property itemToAddPotion  Auto  
{item to add to player - potion}

Ingredient Property itemToAddIngredient  Auto  
{item to add to player - ingredient}


Int Property ItemCount = 1 Auto  
{how many to add?}

MiscObject Property myBase Auto
{ my base object - can't access this from inventory scripts }
