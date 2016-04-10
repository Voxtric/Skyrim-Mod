scriptName DLC2OmenOfDangerScript extends objectReference
;
;
;===========================================

effectShader Property DLC2OmenOfDangerFXS auto
GlobalVariable property DLC2OmenOfDanger auto

event onCellAttach()
; 	;debug.Trace(self + " is loading 3d")
; 	;debug.Trace(self + " has found that HasTrapSight == " + hasTrapSight.value)


	registerForAnimationEvent((game.GetPlayer() as objectReference), "OmenOfDanger")

	if DLC2OmenOfDanger.GetValue() == 1
; 		;debug.Trace(self + " trapsight is set")
		game.GetPlayer().PlaySubGraphAnimation("OmenOfDanger")
		;debug.sendAnimationEvent(game.getPlayer(), "OmenOfDanger")
	endif
endEvent

event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 	debug.Trace(self + "has recieved AnimationEvent >> " + asEventName)
	if akSource == game.GetPlayer() && asEventName == "OmenOfDanger"
		if DLC2OmenOfDanger.getValue() == 1
			DLC2OmenOfDangerFXS.play(self as objectReference, -1.0)
		else
			DLC2OmenOfDangerFXS.stop(self as objectReference)
		endif
	endif
endEvent

event onCellDetach()
	DLC2OmenOfDangerFXS.stop(self as objectReference)
	unregisterForAnimationEvent((game.GetPlayer() as objectReference), "OmenOfDanger")
endEvent