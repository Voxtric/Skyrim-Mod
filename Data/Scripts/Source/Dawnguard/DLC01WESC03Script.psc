Scriptname DLC01WESC03Script extends ObjectReference  
{Spawn a swarm of bats that fly at the player.}

Activator property DLC01_WESC03BatFX Auto
Quest property DLC01_WESC03 Auto
ReferenceAlias property Bat01 Auto
ReferenceAlias property Bat02 Auto
ReferenceAlias property Bat03 Auto
ReferenceAlias property Bat04 Auto
ReferenceAlias property Bat05 Auto
ReferenceAlias property Bat06 Auto
ReferenceAlias property Bat07 Auto
ReferenceAlias property Bat08 Auto
ReferenceAlias property Bat09 Auto
ReferenceAlias property Bat10 Auto
ReferenceAlias property SceneCenterMarker Auto
ReferenceAlias property SceneMarker1 Auto
ReferenceAlias property SceneMarker2 Auto
ReferenceAlias property SceneMarker3 Auto
ReferenceAlias property SceneMarker4 Auto

Event OnLoad()
	While (DLC01_WESC03.GetStage() == 0)
		if (SceneCenterMarker.GetReference().GetDistance(Game.GetPlayer()) > 2000)
			Utility.Wait(1)
		Else
			;Spawn the bats.
			Bat01.ForceRefTo(SceneCenterMarker.GetReference().PlaceAtMe(DLC01_WESC03BatFX))
			;Bat02.ForceRefTo(SceneMarker1.GetReference().PlaceAtMe(DLC01_WESC03BatFX))
			;Bat03.ForceRefTo(SceneMarker2.GetReference().PlaceAtMe(DLC01_WESC03BatFX))
			;Bat04.ForceRefTo(SceneMarker3.GetReference().PlaceAtMe(DLC01_WESC03BatFX))
			;Bat05.ForceRefTo(SceneMarker4.GetReference().PlaceAtMe(DLC01_WESC03BatFX))
			;Bat06.ForceRefTo(SceneCenterMarker.GetReference().PlaceAtMe(DLC01_WESC03BatFX))
			;Bat07.ForceRefTo(SceneMarker1.GetReference().PlaceAtMe(DLC01_WESC03BatFX))
			;Bat08.ForceRefTo(SceneMarker2.GetReference().PlaceAtMe(DLC01_WESC03BatFX))
			;Bat09.ForceRefTo(SceneMarker3.GetReference().PlaceAtMe(DLC01_WESC03BatFX))
			;Bat10.ForceRefTo(SceneMarker4.GetReference().PlaceAtMe(DLC01_WESC03BatFX))
			;Adjust the height of the bats.
			;Bat01.GetReference().MoveTo(Bat01.GetReference(), 0, 0, 0)
			;Bat02.GetReference().MoveTo(Bat02.GetReference(), 0, 0, 00)
			;Bat03.GetReference().MoveTo(Bat03.GetReference(), 0, 0, 100)
			;Bat04.GetReference().MoveTo(Bat04.GetReference(), 0, 0, 25)
			;Bat05.GetReference().MoveTo(Bat05.GetReference(), 0, 0, 75)
			;Bat06.GetReference().MoveTo(Bat06.GetReference(), 0, 0, 50)
			;Bat07.GetReference().MoveTo(Bat07.GetReference(), 0, 0, 00)
			;Bat08.GetReference().MoveTo(Bat08.GetReference(), 0, 0, 50)
			;Bat09.GetReference().MoveTo(Bat09.GetReference(), 0, 0, 00)
			;Bat10.GetReference().MoveTo(Bat10.GetReference(), 0, 0, 00)
			;Rotate and activate the bats.
			Bat01.GetReference().SetAngle(0, 0, Game.GetPlayer().GetAngleZ())
			Bat01.GetReference().Activate(Self)
			;Utility.Wait(0.1)
			;Bat02.GetReference().SetAngle(0, 0, Game.GetPlayer().GetAngleZ()+(Utility.RandomFloat(20) - 10))
			;Bat02.GetReference().Activate(Self)
			;Utility.Wait(0.3)
			;Bat03.GetReference().SetAngle(0, 0, Game.GetPlayer().GetAngleZ()+(Utility.RandomFloat(20) - 10))
			;Bat03.GetReference().Activate(Self)
			;Utility.Wait(0.2)
			;Bat04.GetReference().SetAngle(0, 0, Game.GetPlayer().GetAngleZ()+(Utility.RandomFloat(20) - 10))
			;Bat04.GetReference().Activate(Self)
			;Utility.Wait(0.2)
			;Bat05.GetReference().SetAngle(0, 0, Game.GetPlayer().GetAngleZ()+(Utility.RandomFloat(20) - 10))
			;Bat05.GetReference().Activate(Self)
			;Utility.Wait(0.3)
			;Bat06.GetReference().SetAngle(0, 0, Game.GetPlayer().GetAngleZ()+(Utility.RandomFloat(20) - 10))
			;Bat06.GetReference().Activate(Self)
			;Utility.Wait(0.1)
			;Bat07.GetReference().SetAngle(0, 0, Game.GetPlayer().GetAngleZ()+(Utility.RandomFloat(20) - 10))
			;Bat07.GetReference().Activate(Self)
			;Utility.Wait(0.2)
			;Bat08.GetReference().SetAngle(0, 0, Game.GetPlayer().GetAngleZ()+(Utility.RandomFloat(20) - 10))
			;Bat08.GetReference().Activate(Self)
			;Utility.Wait(0.1)
			;Bat09.GetReference().SetAngle(0, 0, Game.GetPlayer().GetAngleZ()+(Utility.RandomFloat(20) - 10))
			;Bat09.GetReference().Activate(Self)
			;Utility.Wait(0.2)
			;Bat10.GetReference().SetAngle(0, 0, Game.GetPlayer().GetAngleZ()+(Utility.RandomFloat(20) - 10))
			;Bat10.GetReference().Activate(Self)
			;Utility.Wait(0.3)
			;Done here, so set the stage.
			DLC01_WESC03.SetStage(10)
		EndIf
	EndWhile
EndEvent

Event OnUnload()
	DLC01_WESC03.Stop()
EndEvent

Event OnCellDetatch()
	DLC01_WESC03.Stop()
EndEvent