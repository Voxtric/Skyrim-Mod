Scriptname BYOHHouseMudcrabScript extends ObjectReference  
{mudcrabs enable themselves based on the number of fish in the hatchery}

Event OnCellAttach()
	BYOHHouseFishHatcheryScript myHatchery = GetLinkedRef() as BYOHHouseFishHatcheryScript
	if myHatchery && myHatchery.iSpawnCount >= iMinSpawnCount
		Enable()
	endif
endEvent

int Property iMinSpawnCount = 1 auto
