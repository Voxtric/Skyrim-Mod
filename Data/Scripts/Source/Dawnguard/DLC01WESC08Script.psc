Scriptname DLC01WESC08Script extends ReferenceAlias  
{When the player moves in range, set a stage to prevent this WE from recurring.}

Quest property DLC1_WESC08 Auto

Event OnLoad()
	While (DLC1_WESC08.GetStage() == 0)
		if (Self.GetReference().GetDistance(Game.GetPlayer()) > 768)
			Utility.Wait(1)
		Else
			DLC1_WESC08.SetStage(10)
		EndIf
	EndWhile
EndEvent