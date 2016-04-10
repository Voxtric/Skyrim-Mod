Scriptname DLC1OnAddHorseSkull extends ReferenceAlias  

int Property StageToSet Auto
{The stage to set the quest to when activated}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		while (Game.GetPlayer().isInCombat() == TRUE)
			utility.wait(0.5)
		endwhile
		GetOwningQuest().SetStage(StageToSet)	
	endif
EndEvent

  
