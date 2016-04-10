Scriptname DLC1VQ07BasinScript extends ReferenceAlias  Conditional

Quest Property pDLC1VQ07  Auto  
int Property pStageToSet Auto

Event OnActivate(ObjectReference akActionRef)
	debug.trace(self + "OnActivate()")
	if pDLC1VQ07.GetStageDone(pStageToSet) == 0
		if akActionRef == Game.GetPlayer()
			pDLC1VQ07.SetStage(pStageToSet)
		endif
	endif

endEvent