ScriptName DLC2MQBossTentacleController extends objectReference


ObjectReference property DLC2MQBossTentacleChainStart001 auto
ObjectReference property DLC2MQBossTentacleChainStart002 auto
ObjectReference property DLC2MQBossTentacleChainStart003 auto
ObjectReference property DLC2MQBossTentacleChainStart004 auto
ObjectReference property DLC2MQBossTentacleChainStart005 auto
ObjectReference property DLC2MQBossTentacleChainStart006 auto
ObjectReference property DLC2MQBossTentacleChainStartCenter auto
ObjectReference property DLC2MQBossTentacleChainEnd001 auto
ObjectReference property DLC2MQBossTentacleChainEnd002 auto
ObjectReference property DLC2MQBossTentacleChainEnd003 auto
ObjectReference property DLC2MQBossTentacleChainEnd004 auto
ObjectReference property DLC2MQBossTentacleChainEnd005 auto
ObjectReference property DLC2MQBossTentacleChainEnd006 auto
ObjectReference property DLC2MQBossTentacleChainEndCenter auto

bool property fullSweep auto hidden
int property targetArea = 0 auto hidden
bool property clockwise = false auto hidden
float property attackTimer = 0.5 auto hidden


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					State Block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This is the state where we are ready to go
auto State waiting
	event OnUpdate()
; 		debug.Trace(self + ": Has recieved OnUpdate")
		goToState("Busy")
		if fullSweep
; 			debug.Trace(self + ": Should Trigger Full Sweep")
			fullSweep = false
			AttackWithFullSweep()
		else;if targetArea != 0
; 			debug.Trace(self + ": Should Trigger Target Area")
			AttackTargetArea()
		endif
	endEvent
endState

;Override the functions so we do nothing else
state Busy
	event OnUpdate()
	endEvent
endState

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					Function Block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function AttackWithFullSweep()
; 	debug.Trace(self + ": Starting AttackWithFullSweep")
	objectReference currentLink
	if !clockwise
		DLC2MQBossTentacleChainStart001.Activate(DLC2MQBossTentacleChainStart001)
		utility.Wait(attackTimer)
		currentLink = DLC2MQBossTentacleChainStart001.getLinkedRef()
		while currentLink
			currentLink.Activate(currentLink)
			currentLink = currentLink.getLinkedRef()
			utility.Wait(attackTimer)
		endWhile
		DLC2MQBossTentacleChainStart002.Activate(DLC2MQBossTentacleChainStart002)
		utility.Wait(attackTimer)
		currentLink = DLC2MQBossTentacleChainStart002.getLinkedRef()
		while currentLink
			currentLink.Activate(currentLink)
			currentLink = currentLink.getLinkedRef()
			utility.Wait(attackTimer)
		endWhile
		DLC2MQBossTentacleChainStart003.Activate(DLC2MQBossTentacleChainStart003)
		utility.Wait(attackTimer)
		currentLink = DLC2MQBossTentacleChainStart003.getLinkedRef()
		while currentLink
			currentLink.Activate(currentLink)
			currentLink = currentLink.getLinkedRef()
			utility.Wait(attackTimer)
		endWhile
		DLC2MQBossTentacleChainStart004.Activate(DLC2MQBossTentacleChainStart004)
		utility.Wait(attackTimer)
		currentLink = DLC2MQBossTentacleChainStart004.getLinkedRef()
		while currentLink
			currentLink.Activate(currentLink)
			currentLink = currentLink.getLinkedRef()
			utility.Wait(attackTimer)
		endWhile
		DLC2MQBossTentacleChainStart005.Activate(DLC2MQBossTentacleChainStart005)
		utility.Wait(attackTimer)
		currentLink = DLC2MQBossTentacleChainStart005.getLinkedRef()
		while currentLink
			currentLink.Activate(currentLink)
			currentLink = currentLink.getLinkedRef()
			utility.Wait(attackTimer)
		endWhile
		DLC2MQBossTentacleChainStart006.Activate(DLC2MQBossTentacleChainStart006)
		utility.Wait(attackTimer)
		currentLink = DLC2MQBossTentacleChainStart006.getLinkedRef()
		while currentLink
			currentLink.Activate(currentLink)
			currentLink = currentLink.getLinkedRef()
			utility.Wait(attackTimer)
		endWhile
	else ;clockwise is true
		;;;;;;;;;;;;;;;;;;NEED to do other attack here
	endif
	goToState("Waiting")
endFunction



Function AttackTargetArea()
; 	debug.Trace(self + ": Starting AttackTargetArea")
	objectReference currentLink
	if !clockwise
		if targetArea == 0
			DLC2MQBossTentacleChainStartCenter.Activate(self)
			utility.Wait(attackTimer)
			currentLink = DLC2MQBossTentacleChainStartCenter.getLinkedRef()
			while currentLink
				currentLink.Activate(self)
				currentLink = currentLink.getLinkedRef()
				utility.Wait(attackTimer)
			endWhile
		elseif targetArea == 1
			DLC2MQBossTentacleChainStart001.Activate(self)
			utility.Wait(attackTimer)
			currentLink = DLC2MQBossTentacleChainStart001.getLinkedRef()
			while currentLink
				currentLink.Activate(self)
				currentLink = currentLink.getLinkedRef()
				utility.Wait(attackTimer)
			endWhile
		elseif targetArea == 2
			DLC2MQBossTentacleChainStart002.Activate(self)
			utility.Wait(attackTimer)
			currentLink = DLC2MQBossTentacleChainStart002.getLinkedRef()
			while currentLink
				currentLink.Activate(self)
				currentLink = currentLink.getLinkedRef()
				utility.Wait(attackTimer)
			endWhile
		elseif  targetArea == 3
			DLC2MQBossTentacleChainStart003.Activate(self)
			utility.Wait(attackTimer)
			currentLink = DLC2MQBossTentacleChainStart003.getLinkedRef()
			while currentLink
				currentLink.Activate(self)
				currentLink = currentLink.getLinkedRef()
				utility.Wait(attackTimer)
			endWhile
		elseif  targetArea == 4
			DLC2MQBossTentacleChainStart004.Activate(self)
			utility.Wait(attackTimer)
			currentLink = DLC2MQBossTentacleChainStart004.getLinkedRef()
			while currentLink
				currentLink.Activate(self)
				currentLink = currentLink.getLinkedRef()
				utility.Wait(attackTimer)
			endWhile
		elseif  targetArea == 5
			DLC2MQBossTentacleChainStart005.Activate(self)
			utility.Wait(attackTimer)
			currentLink = DLC2MQBossTentacleChainStart005.getLinkedRef()
			while currentLink
				currentLink.Activate(self)
				currentLink = currentLink.getLinkedRef()
				utility.Wait(attackTimer)
			endWhile
		elseif  targetArea == 6
			DLC2MQBossTentacleChainStart006.Activate(self)
			utility.Wait(attackTimer)
			currentLink = DLC2MQBossTentacleChainStart006.getLinkedRef()
			while currentLink
				currentLink.Activate(self)
				currentLink = currentLink.getLinkedRef()
				utility.Wait(attackTimer)
			endWhile
		else
; 			debug.Trace(self + ": attackTargetArea triggered with area 0")
		endif
	else ;clockwise is true
		;;;;;;;;;;;;;;;;;;NEED to do other attack here
	endif
	targetArea = 0
	goToState("Waiting")
endFunction



