Scriptname DLC2RR01PlansScript extends ReferenceAlias  Conditional

Quest Property pDLC2RR01 Auto

Event OnRead()

	if pDLC2RR01.GetStageDone(70) == 0
		pDLC2RR01.SetStage(70)
	endif

endEvent