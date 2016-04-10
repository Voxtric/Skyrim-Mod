Scriptname DLC2RR01AltLetterScript extends ReferenceAlias  Conditional

Quest Property pDLC2RR01 Auto

Event OnRead()

	if pDLC2RR01.GetStage() == 110
		if pDLC2RR01.GetStageDone(120) == 0
			pDLC2RR01.SetStage(120)
		endif
	endif

endEvent