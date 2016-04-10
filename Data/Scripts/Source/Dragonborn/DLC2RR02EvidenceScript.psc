Scriptname DLC2RR02EvidenceScript extends ReferenceAlias  

Quest Property pDLC2RR02 Auto

Event OnRead()

	if pDLC2RR02.GetStageDone(90) == 0
		pDLC2RR02.SetStage(90)
	endif

endEvent