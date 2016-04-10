Scriptname DLC1VQ06DrawKnifeAliasScript extends ReferenceAlias  Conditional

GlobalVariable Property pDLC1VQ06HaveKnife Auto
Quest Property pDLC1VQ06 Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if pDLC1VQ06HaveKnife.GetValue() == 0
		if pDLC1VQ06.GetStage() == 10
			if akNewContainer == Game.GetPlayer()
				pDLC1VQ06HaveKnife.SetValue(1)
				pDLC1VQ06.SetStage(20)
			endif
		endif
	endif
 
endEvent