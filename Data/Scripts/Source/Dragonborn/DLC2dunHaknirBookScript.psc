Scriptname DLC2dunHaknirBookScript extends ObjectReference  
{Script on copies of Deathbrand, the treasure quest book.}

Quest property myQuest Auto
int property myPrereqStage Auto
int property myStage Auto

Event OnRead()
	If (myQuest.GetStageDone(myPrereqStage))
		myQuest.SetStage(myStage)
	EndIf
endEvent

