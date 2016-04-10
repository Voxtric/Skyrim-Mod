Scriptname DLC2RR02PlayerAliasScript extends ReferenceAlias  

Quest Property pDLC2RR02 Auto
Book Property pDLC2RR02EvidenceNote Auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if akBaseItem == pDLC2RR02EvidenceNote
		if pDLC2RR02.GetStageDone(70) == 0
			pDLC2RR02.SetStage(70)
		endif
	endif

endEvent