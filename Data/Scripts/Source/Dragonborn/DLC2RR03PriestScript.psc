Scriptname DLC2RR03PriestScript extends ReferenceAlias  

Quest Property pDLC2RR03Priest Auto
int Property pDoOnce Auto

Event OnDying(Actor akKiller)

	if pDoOnce == 0
		pDLC2RR03Priest.SetStage(200)
		pDoOnce = 1
	endif

endEvent
