Scriptname DLC2BloodskalHitTriggerScript extends ObjectReference  


ObjectReference property DLC2BloodskalDoorControllerRef auto
DLC2BloodskalDoorControllerScript property myController auto hidden

bool property triggerOnVertProjectile = false auto

form property DLC2BloodskalAreaProjectileHoriz auto
form property DLC2BloodskalAreaProjectileVert auto


auto state waiting
	event onTriggerEnter(ObjectReference triggerRef)
; 		debug.Trace(self + "has recieved onTriggerEnter event from " + triggerRef)
		if  !triggerOnVertProjectile && (triggerRef.getBaseObject() as form) == DLC2BloodskalAreaProjectileHoriz
			goToState("Done")
; 			debug.Trace(self + "has recieved successful hit from " + triggerRef)
			SendHitToController()
			self.disable()
		elseif triggerOnVertProjectile && (triggerRef.getBaseObject() as form)  == DLC2BloodskalAreaProjectileVert
			goToState("Done")
; 			debug.Trace(self + "has recieved successful hit from " + triggerRef)
			SendHitToController()
			self.disable()
		else 
			if triggerOnVertProjectile
; 				debug.Trace(self + "triggerRef = " + triggerRef.getBaseObject() + "!= " + DLC2BloodskalAreaProjectileVert)
			else
; 				debug.Trace(self + "triggerRef = " + triggerRef.getBaseObject() + "!= " + DLC2BloodskalAreaProjectileHoriz)
			endif
		endif
	endEvent
endState

state Done
endState

Function SendHitToController()
; 	debug.Trace(self + " is sending hit to controller ")
	ObjectReference selfRef = self as ObjectReference
	myController = DLC2BloodskalDoorControllerRef as DLC2BloodskalDoorControllerScript
	if myController
		myController.ProcessHitEvent(selfRef)
	else 
; 		debug.Trace(self + " Oh No! myController = " + myController)
	endif
endFunction