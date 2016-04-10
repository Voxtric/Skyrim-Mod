ScriptName DLC1LD_ForgeSteamValveScript extends ObjectReference
{Script for the steam valves in the Forgemaster Boss Battle area.}

Quest property DLC1LD_Bthalft Auto
ObjectReference property DLC1LD_FXSteamLeft Auto
ObjectReference property DLC1LD_FXSteamRight Auto
ObjectReference property DLC1LD_FXSteamCenter Auto
ObjectReference property DLC1LD_FXSteamForge Auto
Sound property OBJPipeValveWheelRotateMarker Auto
bool property isRightValve auto
bool isTrigger2
Message property DLC1LD_BthalftValveFailMessage Auto

Event OnCellAttach()
	Self.BlockActivation()
EndEvent

Function TurnValve()
	if (isTrigger2)
		OBJPipeValveWheelRotateMarker.Play(Self)
		playAnimationandWait("trigger02","Trans02")
		isTrigger2 = False
	Else
		OBJPipeValveWheelRotateMarker.Play(Self)
		playAnimationandWait("trigger01","Trans01")
		isTrigger2 = True
	EndIf
EndFunction


Auto State Ready
	Event OnActivate(ObjectReference obj)
		GoToState("Animating")
		TurnValve()
		if (isRightValve)
			if ((DLC1LD_FXSteamRight as DLC1LD_BthalftSteamManagerScript).IsSteamDisabled())
				(DLC1LD_FXSteamRight as DLC1LD_BthalftSteamManagerScript).EnableSteam()
				(DLC1LD_FXSteamCenter as DLC1LD_BthalftSteamManagerScript).EnableSteam()
			Else
				(DLC1LD_FXSteamRight as DLC1LD_BthalftSteamManagerScript).DisableSteam()
				if (DLC1LD_Bthalft.GetStage() == 45)
					DLC1LD_Bthalft.SetStage(46)
				EndIf
				if ((DLC1LD_FXSteamLeft as DLC1LD_BthalftSteamManagerScript).IsSteamDisabled())
					if (DLC1LD_Bthalft.GetStage() == 46)
						DLC1LD_Bthalft.SetStage(1)
					EndIf
					(DLC1LD_FXSteamCenter as DLC1LD_BthalftSteamManagerScript).DisableSteam()
					(DLC1LD_FXSteamForge as DLC1LD_BthalftSteamManagerScript).DisableSteam()
					if (DLC1LD_Bthalft.GetStage() == 46)
						DLC1LD_Bthalft.SetStage(47)
					EndIf
					if (DLC1LD_Bthalft.GetStageDone(58) == 1 && !DLC1LD_Bthalft.GetStageDone(59))
						DLC1LD_Bthalft.SetStage(59)
					EndIf
				EndIf
			EndIf
		Else
			if ((DLC1LD_FXSteamLeft as DLC1LD_BthalftSteamManagerScript).IsSteamDisabled())
				(DLC1LD_FXSteamLeft as DLC1LD_BthalftSteamManagerScript).EnableSteam()
				(DLC1LD_FXSteamCenter as DLC1LD_BthalftSteamManagerScript).EnableSteam()
			Else
				(DLC1LD_FXSteamLeft as DLC1LD_BthalftSteamManagerScript).DisableSteam()
				if (DLC1LD_Bthalft.GetStage() == 45)
					DLC1LD_Bthalft.SetStage(46)
				EndIf
				if ((DLC1LD_FXSteamRight as DLC1LD_BthalftSteamManagerScript).IsSteamDisabled())
					if (DLC1LD_Bthalft.GetStage() == 46)
						DLC1LD_Bthalft.SetStage(1)
					EndIf
					(DLC1LD_FXSteamCenter as DLC1LD_BthalftSteamManagerScript).DisableSteam()
					(DLC1LD_FXSteamForge as DLC1LD_BthalftSteamManagerScript).DisableSteam()
					if (DLC1LD_Bthalft.GetStage() == 46)
						DLC1LD_Bthalft.SetStage(47)
					EndIf
					if (DLC1LD_Bthalft.GetStageDone(58) == 1 && !DLC1LD_Bthalft.GetStageDone(59))
						DLC1LD_Bthalft.SetStage(59)
					EndIf
				EndIf
			EndIf
		EndIf
		GoToState("Ready")
	EndEvent
EndState

State Animating
	Event OnActivate(ObjectReference obj)
		;Do nothing.
	EndEvent
EndState