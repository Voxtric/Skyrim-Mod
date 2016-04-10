Scriptname BYOHHouseTrophyBaseScript extends ObjectReference  
{script for trophy base workbench}

BYOHHouseBuildingScript Property BYOHHouseBuilding Auto

FormList Property BYOHHouseBuildingTrophyMasterList Auto
{ master list of trophy inventory objects }


Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		; set trophy base data on master quest
		BYOHHouseBuilding.SetTrophyBase(self, GetLinkedRef(), GetLinkedRef(BYOHBuildingTrophyLink))
		RegisterForSingleUpdate(1.0)
	endif
endEvent

Event OnUpdate()
	debug.trace(self + " OnUpdate" + GetDistance(Game.GetPlayer()))
;	if utility.IsInMenuMode() == false
	if Game.GetPlayer().GetItemCount(BYOHHouseBuildingTrophyMasterList) > 0
		debug.trace(self + " OnUpdate: TROPHY ITEMS DETECTED - remove crafting items")
		UnregisterForUpdate()
		Game.GetPlayer().RemoveItem(BYOHHouseBuildingTrophyMasterList, 99, true)
	else
		; keep updating while player is using me
		if GetDistance(Game.GetPlayer()) < 250
			RegisterForSingleUpdate(1.0)
		else
			UnregisterForUpdate()
		endif
	endif
endEvent

Keyword Property BYOHBuildingTrophyLink  Auto  
