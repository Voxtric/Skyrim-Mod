scriptName DCL1VQ03VampSeductionSetStageScript extends ActiveMagicEffect
{This script checks the stage on the quest and sets the stage to allow Dexion to get up}

Quest Property DLC1VQ03Vampire auto
Int Property PrereqStage = 67 auto
Int Property StageToSet = 68 auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if DLC1VQ03Vampire.IsRunning() && DLC1VQ03Vampire.getStage() == PrereqStage
		DLC1VQ03Vampire.setStage(StageToSet)
	endif
endEvent
