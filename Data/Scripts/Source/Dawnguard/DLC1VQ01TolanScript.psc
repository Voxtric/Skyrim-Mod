Scriptname DLC1VQ01TolanScript extends ReferenceAlias  

event OnUnload()
	if GetOwningQuest().GetStageDone(12) == false
		GetOwningQuest().SetStage(12)
	endif
endEvent
