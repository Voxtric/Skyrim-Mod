Scriptname DLC2HrothmundsBarrowWaterSCRIPT extends ObjectReference Hidden 

import utility

Sound Property QSTUstengravRumble2DLPM auto

ObjectReference Property WaterUpper Auto
ObjectReference Property WaterLower Auto
ObjectReference Property WaterDynamic Auto

ObjectReference Property LightMarker01 Auto
ObjectReference Property LightMarker02 Auto
ObjectReference Property LightMarker03 Auto
ObjectReference Property LightMarker04 Auto

ObjectReference Property WaterfallRing01 Auto
ObjectReference Property WaterfallRing02 Auto
ObjectReference Property WaterfallRing03 Auto
ObjectReference Property WaterfallRing04 Auto

ObjectReference Property WaterfallRingStart01 Auto
ObjectReference Property WaterfallRingStart02 Auto
ObjectReference Property WaterfallRingStart03 Auto
ObjectReference Property WaterfallRingStart04 Auto

ObjectReference Property WaterfallRingEnd01 Auto
ObjectReference Property WaterfallRingEnd02 Auto
ObjectReference Property WaterfallRingEnd03 Auto
ObjectReference Property WaterfallRingEnd04 Auto

ObjectReference Property WaterfallMarker01 Auto

Bool Property bMoveWaterDown = TRUE Auto

Bool Property bCurrentlyMoving = FALSE Auto Hidden
Bool Property bCurrentlyUp = TRUE Auto Hidden
Bool Property bStopMovingWaterUp = FALSE Auto

Event OnActivate(ObjectReference akActionRef)
	MoveWater()
EndEvent

Function MoveWater()
; 	debug.Trace("Running MoveWater()")
	if (bMoveWaterDown == TRUE) && (bCurrentlyUp == TRUE) && (bCurrentlyMoving == FALSE)
; 		debug.Trace("Moving the water down since it's currently up and not running")
		bCurrentlyMoving = TRUE
		int rumbleID = QSTUstengravRumble2DLPM.play(self)
		self.RampRumble(1, 10, 1600)
		Game.ShakeCamera(self, 0.3, 2)
		Wait(1)
		WaterDynamic.TranslateTo(WaterLower.GetPositionX(), WaterLower.GetPositionY(), WaterLower.GetPositionZ(), WaterLower.GetAngleX(), WaterLower.GetAngleY(), WaterLower.GetAngleZ(), 40)
		wait(2)
		Game.ShakeCamera(self, 0.4, 2)
		wait(1)
		LightMarker01.EnableNoWait()
		Wait(1)
		Game.ShakeCamera(self, 0.4, 2)
		wait(1)
		LightMarker02.EnableNoWait()
		Wait(1)
		Game.ShakeCamera(self, 0.4, 2)
		wait(1)
		LightMarker03.EnableNoWait()
		Wait(1)
		Game.ShakeCamera(self, 0.3, 2)
		wait(1)
		LightMarker04.EnableNoWait()
		Wait(1)
		Sound.StopInstance(rumbleID) 
		Game.ShakeCamera(self, 0.2, 2)
		bCurrentlyMoving = FALSE
		bCurrentlyUp = FALSE

		if bMoveWaterDown == FALSE
			self.Activate(self)
		endif
	endif

	if (bMoveWaterDown == FALSE) && (bCurrentlyUp == FALSE) && (bCurrentlyMoving == FALSE)
		if bStopMovingWaterUp
			;Do Nothing
		else
; 			debug.Trace("Moving the water up since it's currently down and not running")
			bCurrentlyMoving = TRUE

			WaterfallRing01.MoveTo(WaterfallRingStart01)
			WaterfallRing02.MoveTo(WaterfallRingStart02)
			WaterfallRing03.MoveTo(WaterfallRingStart03)
			WaterfallRing04.MoveTo(WaterfallRingStart04)

			WaterfallRing01.EnableNoWait()
			WaterfallRing02.EnableNoWait()
			WaterfallRing03.EnableNoWait()
			WaterfallRing04.EnableNoWait()

			LightMarker04.DisableNoWait()
			Wait(1)
			WaterfallMarker01.EnableNoWait()
			LightMarker03.DisableNoWait()
			Wait(1)
			LightMarker02.DisableNoWait()
			Wait(1)
			LightMarker01.DisableNoWait()
			int rumbleID = QSTUstengravRumble2DLPM.play(self)
			self.RampRumble(1, 10, 1600)
			Game.ShakeCamera(self, 0.3, 2)
			Wait(1)
			WaterfallRing01.TranslateTo(WaterfallRingEnd01.GetPositionX(), WaterfallRingEnd01.GetPositionY(), WaterfallRingEnd01.GetPositionZ(), WaterfallRingEnd01.GetAngleX(), WaterfallRingEnd01.GetAngleY(), WaterfallRingEnd01.GetAngleZ(), 40)
			WaterfallRing02.TranslateTo(WaterfallRingEnd02.GetPositionX(), WaterfallRingEnd02.GetPositionY(), WaterfallRingEnd02.GetPositionZ(), WaterfallRingEnd02.GetAngleX(), WaterfallRingEnd02.GetAngleY(), WaterfallRingEnd02.GetAngleZ(), 40)
			WaterfallRing03.TranslateTo(WaterfallRingEnd03.GetPositionX(), WaterfallRingEnd03.GetPositionY(), WaterfallRingEnd03.GetPositionZ(), WaterfallRingEnd03.GetAngleX(), WaterfallRingEnd03.GetAngleY(), WaterfallRingEnd03.GetAngleZ(), 40)
			WaterfallRing04.TranslateTo(WaterfallRingEnd04.GetPositionX(), WaterfallRingEnd04.GetPositionY(), WaterfallRingEnd04.GetPositionZ(), WaterfallRingEnd04.GetAngleX(), WaterfallRingEnd04.GetAngleY(), WaterfallRingEnd04.GetAngleZ(), 40)
			WaterDynamic.TranslateTo(WaterUpper.GetPositionX(), WaterUpper.GetPositionY(), WaterUpper.GetPositionZ(), WaterUpper.GetAngleX(), WaterUpper.GetAngleY(), WaterUpper.GetAngleZ(), 40)
			wait(2)
			Game.ShakeCamera(self, 0.4, 2)
			wait(2)
			Game.ShakeCamera(self, 0.4, 2)
			wait(2)
			Game.ShakeCamera(self, 0.4, 2)
			wait(2)
			Game.ShakeCamera(self, 0.3, 2)
			wait(2)
			WaterfallMarker01.DisableNoWait(FALSE)
			WaterfallRing01.DisableNoWait(FALSE)
			WaterfallRing02.DisableNoWait(FALSE)
			WaterfallRing03.DisableNoWait(FALSE)
			WaterfallRing04.DisableNoWait(FALSE)
			Sound.StopInstance(rumbleID) 
			Game.ShakeCamera(self, 0.2, 2)
			Wait(1)
			bCurrentlyMoving = FALSE
			bCurrentlyUp = TRUE

			if bMoveWaterDown == TRUE
				self.Activate(self)
			endif
		endif
	endif

EndFunction