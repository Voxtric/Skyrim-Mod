Scriptname DLC2RR01CariusAliasScript extends ReferenceAlias  Conditional

Quest Property pDLC2RR01 Auto

Event OnDying(Actor akKiller)

	if pDLC2RR01.GetStage() >= 50 && pDLC2RR01.GetStage() < 90
		pDLC2RR01.SetStage(90)
	else
		pDLC2RR01.SetStage(100)
	endif

endEvent