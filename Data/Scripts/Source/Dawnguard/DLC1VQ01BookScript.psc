Scriptname DLC1VQ01BookScript extends ReferenceAlias  
{When the player reads the book and is on stage 15, this script sets the quest stage to 17}

;Properties
int Property myStage  Auto  
Quest Property myQuest  Auto  
Quest Property myQST auto
{Quest upon which to set stage. Default is the Alias's owning quest.}
int Property preReqStage = -1 auto
{(Optional)Stage that must be set for this script to run. Default: NONE}
int Property StageToSet auto
{Set this stage when the player picks up this item.}

event onRead()
	myQuest.setStage(myStage)
endEvent

auto State waiting	
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if (Game.GetPlayer() == akNewContainer)
			if ( (preReqStage == -1) || (myQST.GetStageDone(preReqStage) == True) )
				myQST.SetStage(stageToSet)
				GoToState("inactive")
			endif
		endif
	EndEvent
EndState

State inactive
EndState 
