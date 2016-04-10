ScriptName DLC2Book01BendyHallwayReset extends ObjectReference

objectReference property DLC2Book01AHall001 auto
objectReference property DLC2Book01AHall001Trigger auto
objectReference property DLC2Book01AHall002 auto
objectReference property DLC2Book01AHall002Cap auto
objectReference property DLC2Book01AHall002Trigger auto
objectReference property DLC2Book01AHall003 auto
objectReference property DLC2Book01AHall003Trigger auto
objectReference property DLC2MQ06HallStaticEnableParent auto

DLC2Book01BendyHallwayController property BendyHall auto hidden
DLC2ApoExtendingHallScript property ExtendingHall001 auto hidden
DLC2ApoExtendingHallScript property ExtendingHall002 auto hidden

globalVariable property DLC2Book01ResetHalls auto
globalVariable property DLC2Book01TakenBookInPartA auto

event onCellAttach()
; 	debug.Trace(self + "This has been updated!!")
	utility.wait(0.25)
	if DLC2Book01ResetHalls.getValue() == 1
; 		debug.Trace(Self + ": Has Attached with ResetHalls true")
		BendyHall = DLC2Book01AHall001 as DLC2Book01BendyHallwayController
		ExtendingHall001 = DLC2Book01AHall002 as DLC2ApoExtendingHallScript
		ExtendingHall002 = DLC2Book01AHall003 as DLC2ApoExtendingHallScript
		if DLC2Book01TakenBookInPartA.getValue() == 1
; 			debug.Trace(self + ": Player has taken book, reseting hallways to BYPASS State")
			BendyHall.GoToStartingPosition()
			;ExtendingHall001.SetOpen(true)
			;ExtendingHall001.IsOpen = true
			;ExtendingHall001.SetDefaultState()
			;ExtendingHall002.SetOpen(true)
			DLC2Book01AHall002.disable()
			DLC2Book01AHall002Cap.disable()
			DLC2MQ06HallStaticEnableParent.enable()
			DLC2Book01ResetHalls.setValue(0)
		Else
; 			debug.Trace(self + ": Player has not taken book, reseting hallways to DEFAULT state")
			BendyHall.GoToStartingPosition()
			ExtendingHall001.IsOpen = true
			ExtendingHall001.SetDefaultState()
			ExtendingHall002.IsOpen = true
			ExtendingHall002.SetDefaultState()
			;DLC2Book01AHall001Trigger.Enable()
			;(DLC2Book01AHall001Trigger as DLC2Book01BendyHallwayActivator).currentActivations = 0
			(DLC2Book01AHall001Trigger as DLC2Book01BendyHallwayActivator).GoToState("Waiting")
			DLC2Book01AHall002Trigger.Enable()
			(DLC2Book01AHall002Trigger as defaultActivateSelf).goToState("Waiting")
			DLC2Book01AHall003Trigger.Enable()
			(DLC2Book01AHall003Trigger as defaultActivateSelf).goToState("Waiting")
			DLC2Book01ResetHalls.setValue(0)
		endif
	Else
		ExtendingHall001 = DLC2Book01AHall002 as DLC2ApoExtendingHallScript
		ExtendingHall002 = DLC2Book01AHall003 as DLC2ApoExtendingHallScript
		ExtendingHall001.SetDefaultState()
		ExtendingHall002.SetDefaultState()
	endif
endEvent
