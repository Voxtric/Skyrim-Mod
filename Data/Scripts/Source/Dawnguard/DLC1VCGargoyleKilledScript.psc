ScriptName DLC1VCGargoyleKilledScript extends ObjectReference

ObjectReference Property DLC1VCGargoyleTrackerRef auto

bool property done auto

Event OnDeath(Actor akKiller)
	if !done
		done = True
		(DLC1VCGargoyleTrackerRef as DLC1VCGargoyleTrackerScript).GargoyleKilled()
	endif
endEvent
