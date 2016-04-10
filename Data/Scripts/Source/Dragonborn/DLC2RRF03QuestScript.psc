Scriptname DLC2RRF03QuestScript extends Quest  

int Property pDLC2RRF03SpawnKilled Auto

Function SpawnDie()

	pDLC2RRF03SpawnKilled = (pDLC2RRF03SpawnKilled + 1)

	if pDLC2RRF03SpawnKilled >= 11
		SetStage(30)
	endif

endFunction