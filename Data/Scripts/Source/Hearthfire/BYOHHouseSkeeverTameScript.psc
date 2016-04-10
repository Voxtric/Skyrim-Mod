Scriptname BYOHHouseSkeeverTameScript extends Actor  
{script for tame skeever in house}

BYOHhousescript  Property myHouse Auto  
{set when skeever is placed by BYOHSkeeverInfestationQuest}

Event OnDeath(Actor akKiller)
	if myHouse
		myHouse.bHaveSkeever = false
	endif
endEvent