Scriptname DLC1VQ08HunterUpdateTriggerAliasScript extends ReferenceAlias  

Quest Property DLC1VQ08  Auto  



Event OnTriggerEnter(ObjectReference ActionRef)

DLC1VQ08QuestScript QuestScript = DLC1VQ08 as DLC1VQ08QuestScript

	if ActionRef == Game.GetPlayer()
		if DLC1VQ08.GetStage() == 40
			if QuestScript.HunterUpdate == 0
				QuestScript.HunterUpdate = 1
				QuestScript.HunterPackageUpdate()
			endif
		endif
	endif


EndEvent