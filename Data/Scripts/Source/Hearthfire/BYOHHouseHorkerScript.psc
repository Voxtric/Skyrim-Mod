Scriptname BYOHHouseHorkerScript extends Actor  
{; makes them "tame" after you build the hatchery}

Faction Property WEPlayerFriend  Auto  

Event OnCellAttach()
	; check linked hatchery for fish
	BYOHHouseFishHatcheryScript myHatchery = GetLinkedRef() as BYOHHouseFishHatcheryScript
	if myHatchery && myHatchery.IsEnabled() && myHatchery.iSpawnCount > 0
		AddToFaction(WEPlayerFriend)
	endif
endEvent