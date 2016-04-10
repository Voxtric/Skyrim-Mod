Scriptname DLC01WESC04Script extends ObjectReference  
{When the player moves in range, the Vampiric Assassin teleports in.}

Quest property DLC01WESC04 Auto
ReferenceAlias property SceneCenterMarker Auto
ReferenceAlias property Vampire Auto

Event OnLoad()
	While (DLC01WESC04.GetStage() == 0)
		if (SceneCenterMarker.GetReference().GetDistance(Game.GetPlayer()) > 1000)
			Utility.Wait(1)
		Else
			Vampire.GetActorRef().Activate(Self)
			DLC01WESC04.SetStage(10)
		EndIf
	EndWhile
EndEvent

Event OnUnload()
	CheckUnload()
EndEvent

Event OnCellDetach()
	CheckUnload()
EndEvent

Function CheckUnload()
	;Let the quest know we've unloaded.
	DLC01WESC04.SetStage(110)
EndFunction