Scriptname DLC2BloodskalDoorControllerScript extends ObjectReference  

ObjectReference Property DLC2BloodskalDoorRightRef auto
ObjectReference Property DLC2BloodskalDoorLeftRef auto

ObjectReference property DLC2BloodskalDoorHitTriggerR001 auto
ObjectReference property DLC2BloodskalDoorHitTriggerR002 auto
ObjectReference property DLC2BloodskalDoorHitTriggerR003 auto
ObjectReference property DLC2BloodskalDoorHitTriggerL001 auto
ObjectReference property DLC2BloodskalDoorHitTriggerL002 auto
ObjectReference property DLC2BloodskalDoorHitTriggerL003 auto
ObjectReference property DLC2BloodskalDoorHitTriggerFinal auto

int property rightSideState auto hidden
int property leftSideState auto hidden

float ControllerShakeL = 1.0
float ControllerShakeR = 1.0
float ControllerShakeDuration = 4.5
Sound property QSTGreybeardRumble auto

auto State Waiting
endState

state Done
	Function ProcessHitEvent(ObjectReference hitRef)
	endfunction
endState

Function ProcessHitEvent(ObjectReference hitRef)
; 	debug.Trace(self + ": ProcessHitEvent from >> " + hitRef)
	if hitRef == DLC2BloodskalDoorHitTriggerR001
; 		debug.Trace(self + ": TriggerEvent R01")
		DLC2BloodskalDoorRightRef.playAnimation("Play01")
		waitAndShake()
		DLC2BloodskalDoorHitTriggerR002.enable()
		rightSideState = 1
	elseif hitRef == DLC2BloodskalDoorHitTriggerR002
; 		debug.Trace(self + ": TriggerEvent R02")
		DLC2BloodskalDoorRightRef.playAnimation("Play02")
		waitAndShake()
		DLC2BloodskalDoorHitTriggerR003.enable()
		rightSideState = 2
	elseif hitRef == DLC2BloodskalDoorHitTriggerR003
; 		debug.Trace(self + ": TriggerEvent R03")
		DLC2BloodskalDoorRightRef.playAnimation("Play03")
		waitAndShake()
		rightSideState = 3
		if rightSideState == 3 && leftSideState == 3
			DLC2BloodskalDoorRightRef.playAnimation("Play04")
			DLC2BloodskalDoorHitTriggerFinal.enable()
		endif
	elseif hitRef == DLC2BloodskalDoorHitTriggerL001
; 		debug.Trace(self + ": TriggerEvent L01")
		DLC2BloodskalDoorLeftRef.playAnimation("Play01")
		waitAndShake()
		DLC2BloodskalDoorHitTriggerL002.enable()
		leftSideState = 1
	elseif hitRef == DLC2BloodskalDoorHitTriggerL002
; 		debug.Trace(self + ": TriggerEvent L02")
		DLC2BloodskalDoorLeftRef.playAnimation("Play02")
		waitAndShake()
		DLC2BloodskalDoorHitTriggerL003.enable()
		leftSideState = 2
	elseif hitRef == DLC2BloodskalDoorHitTriggerL003
; 		debug.Trace(self + ": TriggerEvent L03")
		DLC2BloodskalDoorLeftRef.playAnimation("Play03")
		waitAndShake()
		leftSideState = 3
		if rightSideState == 3 && leftSideState == 3
			DLC2BloodskalDoorRightRef.playAnimation("Play04")
			DLC2BloodskalDoorHitTriggerFinal.enable()
		endif
	elseif hitRef == DLC2BloodskalDoorHitTriggerFinal
; 		debug.Trace(self + ": TriggerEvent FINAL")
		goToState("Done")
		QSTGreybeardRumble .Play(DLC2BloodskalDoorRightRef)
		game.ShakeCamera(afStrength = 1.0)
		game.ShakeController(ControllerShakeL, ControllerShakeR, ControllerShakeDuration)
		utility.wait(1.2)
		game.ShakeCamera(afStrength = 1.0)
		DLC2BloodskalDoorRightRef.playAnimation("Play05")
		utility.wait(1.2)
		game.ShakeCamera(afStrength = 1.0)
	endif
EndFunction

function waitAndShake()
	game.ShakeCamera(afStrength = 0.5)
	game.ShakeController(0.4, 0.4, 2.0)
	utility.wait(2.0)
endFunction
