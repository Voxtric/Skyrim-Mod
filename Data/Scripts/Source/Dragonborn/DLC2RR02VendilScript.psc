Scriptname DLC2RR02VendilScript extends ReferenceAlias  

Quest Property pDLC2RR02 Auto

Event OnDying(Actor akKiller)

	if pDLC2RR02.GetStageDone(100) == 0
		pDLC2RR02.SetStage(100)
	endif

endEvent