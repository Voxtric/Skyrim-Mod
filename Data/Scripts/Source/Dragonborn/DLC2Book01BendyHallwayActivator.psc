Scriptname DLC2Book01BendyHallwayActivator extends ObjectReference
{toggle left, right, middle, or always bend for the bending bridge
;0 = Middle
;1 = bend right
;2 = bend left
;3 = revert to starting position
}

int property triggerType = 0 auto
{0 = onTriggerEnter (Default)
 1 = onActivate
 }

int property BendType auto
{	;0 = Middle
	;1 = bend right
	;2 = bend left
	;3 = revert to starting position
	;4 = revert to previous position
}
bool property doOnlyOnce = true auto
{Default = true}
bool property RevertBendOnSecondActivate = False auto
{Default = false}
bool property secondBend = false auto hidden
int property activationsNeeded = 1 auto
{Use if this must be triggered more than once before telling hall to move
	default = 1}
int property currentActivations = 0 auto hidden
bool property PlayerOnly = false auto hidden
{Default = false}
bool property triggering = false auto hidden

;******************************************************
Function myBend()
	currentActivations += 1
; 	debug.Trace(self + ": Calling myBend > currentActivations = " + currentActivations)
	if currentActivations >= activationsNeeded
		triggering = true
		goToState("done")
		DLC2Book01BendyHallwayController myLinkedRef = getLinkedRef() as DLC2Book01BendyHallwayController
		if RevertBendOnSecondActivate
			if !secondBend
				myLinkedRef.Bend(BendType)
				secondBend = true
			else
				myLinkedRef.Bend(3)
				secondBend = false
			endif
		else
			myLinkedRef.Bend(BendType)
		endif
		currentActivations = 0
	endif
	if triggering && !doOnlyOnce
		goToState("Waiting")
	endif
	triggering = false
endFunction
;******************************************************
auto State Waiting

	Event onTriggerEnter(objectReference triggerRef)
		if !PlayerOnly || triggerRef == game.getPlayer()
			if(triggerType == 0)
				self.myBend()
			endif
		endif
	endEvent

	Event OnActivate(ObjectReference ActivateRef)
		if(triggerType == 1)
			self.myBend()
		endif
	endEvent
	
endState

;******************************************************

State done
	;do nothing
endState

;******************************************************