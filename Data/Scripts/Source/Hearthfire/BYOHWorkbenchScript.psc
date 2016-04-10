Scriptname BYOHWorkbenchScript extends ObjectReference  
{set the current house location when activated by player}

Int Property houseLocation = 0 Auto  
{house location to tell master script which quest to talk to when crafting
0 = Falkreath
1 = Hjaalmarch
2 = The Pale
}

int property roomID = 0 Auto
{ room ID - optional - used for interior workbenches only }

string property variantID Auto
{ variant ID - optional - used for interior workbenches only
   use format "A", "B", etc.
}

BYOHHouseBuildingScript Property BYOHHouseBuilding Auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		; set current house on master quest
		BYOHHouseBuilding.SetActiveHouseLocation(self, roomID, variantID)
		; try doing crafting swap here
		BYOHHouseCraftingTriggerScript mytrigger = (GetLinkedRef() as 	BYOHHouseCraftingTriggerScript)
		myTrigger.StartCrafting()
	endif
endEvent
