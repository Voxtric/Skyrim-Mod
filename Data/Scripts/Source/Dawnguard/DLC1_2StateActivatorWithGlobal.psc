Scriptname DLC1_2StateActivatorWithGlobal extends ObjectReference Conditional
{for any activator with standard open/close states}

import debug
import utility

string property openAnim = "open" auto
{animation to play when opening}

string property closeAnim = "close" auto
{animation to play when closing}

string property openEvent = "opening" auto
{open event name - waits for this event before considering itself "open"}

string property closeEvent = "closing" auto
{close event name - waits for this event before considering itself "closed"}

string property startOpenAnim = "opened" auto
{OnLoad calls this if the object starts in the open state}

bool property bAllowInterrupt = FALSE auto
{Allow interrupts while animation? Default: FALSE}

bool property zInvertCollision = FALSE auto
{Typically this will be False (DEFAULT).  The References LinkRef'd Chained with the TwoStateCollisionKeyword will typically be 
Enabled onOpen, and Disabled on Close.  If you want that functionality inverted set this to TRUE}

bool property busy auto hidden

keyword property TwoStateCollisionKeyword auto

GlobalVariable property myGlobalVar auto


; true when static or animating
; 0 == open or opening
; 1 == closed or closing

bool currentOpenState
bool property isOpen
	function set(bool newOpenState)
		;Told to turn on and is currently off
		busy = True
		if newOpenState && myGlobalVar.getValue() == 0
			;return true
			if bAllowInterrupt == TRUE || !Is3DLoaded()
				playAnimation(openAnim) ; Animate Open
			else
				playAnimationandWait(openAnim, openEvent) ; Animate Open
			endif
			
			if (zInvertCollision == FALSE)
				trace(self + " Enabling Collision")
				DisableLinkChain(TwoStateCollisionKeyword)
			else
				trace(self + " Disabling Collision")
				EnableLinkChain(TwoStateCollisionKeyword)
			endif
			
		;Told to turn of and is currently on
		elseif !newOpenState && myGlobalVar.getValue() == 1
			;return false
			if bAllowInterrupt == TRUE || !Is3DLoaded()
				playAnimation(closeAnim)
			else
				playAnimationandWait(closeAnim, closeEvent) ; Animate Closed
			endif
			
			if (zInvertCollision == FALSE)
				trace(self + " Disabling Collision")
				EnableLinkChain(TwoStateCollisionKeyword)
			else
				trace(self + " Enabling Collision")
				DisableLinkChain(TwoStateCollisionKeyword)
			endif
		endif
		busy = False
		currentOpenState = newOpenState
		int newGlobalValue
		if newOpenState
			newGlobalValue = 1
		else
			newGlobalValue = 0
		endif
		myGlobalVar.setValue(newGlobalValue)
          ;TraceStack("Setting objectsInTrigger to " + value) 
     endFunction 
     bool function get() 
          return currentOpenState 
     endFunction 
endProperty

Event onLoad()
	Debug.Trace(self + ": has called onCellAttach")
	if myGlobalVar.getValue() == 1
		isOpen = True
		playAnimation(StartOpenAnim)
		if (zInvertCollision == FALSE)
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		endif
	else
		isOpen = False
		playAnimation(closeAnim)
		if (zInvertCollision == FALSE)
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		endif
	endif
endEvent	

Event onActivate(objectReference triggerRef)
	if !busy || bAllowInterrupt == TRUE
		; send the activation\
		If isOpen
			isOpen = False
		else
			isOpen = True
		endif
	else
		; block activation
		trace (self + " Busy")
	endif
endEvent

function SetOpen(bool abOpen = true)
	debug.Trace(Self + ": SetOpen called with abOpen = " + abOpen)
	isOpen = abOpen
	int newState
	if abOpen
		newState = 1
	else
		newState = 0
	endIf
	myGlobalVar.setValue(newState)
endFunction
