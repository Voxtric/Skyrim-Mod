ScriptName DLC2genericHoldPositionRandomScript extends actor
{This Script will change Variable07 to a randomint assuming that the actor had an
override package stack that is using linkedRefs Custom1-6 to define the positions}

int property CombatState = 0 auto hidden
bool property ActorIsDead = false auto hidden
bool property Breakout = false auto hidden
float property changeHoldPosTime auto hidden
float property TimeBeforeNextPos = 20.0 auto
{Default = 20.0}

Keyword property LinkCustom01 auto
Keyword property LinkCustom02 auto
Keyword property LinkCustom03 auto
Keyword property LinkCustom04 auto
Keyword property LinkCustom05 auto
Keyword property LinkCustom06 auto

bool property hasLink01 = false auto hidden
bool property hasLink02 = false auto hidden
bool property hasLink03 = false auto hidden
bool property hasLink04 = false auto hidden
bool property hasLink05 = false auto hidden
bool property hasLink06 = false auto hidden
int property totalHoldMarkers = 0 auto hidden

bool Initialized

event OnCellAttach()
	Breakout = false
endEvent
event OnCellDetach()
	Breakout = true
endEvent

auto State Waiting
	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		CombatState = aeCombatState
		if CombatState > 0  && !ActorIsDead
			goToState("Combat")
			RegisterForSingleUpdate(1.0)
			RegisterHoldPositions()
			;changeHoldPosTime = utility.getCurrentRealTime() + TimeBeforeNextPos
		endIf
	endEvent
endState

State Combat
	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		CombatState = aeCombatState
		if CombatState == 0 && !ActorIsDead
			goToState("Waiting")
			UnRegisterForUpdate()
		endIf
	endEvent

	event OnUpdate()
		if Initialized
			float currentTime = utility.getCurrentRealTime()
			if ActorIsDead
				goToState("Dead")
			elseif CombatState == 0 || Breakout
				goToState("Waiting")
				UnRegisterForUpdate()
			elseif currentTime > changeHoldPosTime
				changeHoldPosTime = currentTime + TimeBeforeNextPos
				ChangeHoldPosition()
				evaluatePackage()
			endif
		endif
		if !CombatState == 0 && !ActorIsDead && !Breakout
			RegisterForSingleUpdate(2.0)
		endif
	endEvent
endState


State Dead
endState

event onDeath(Actor akKiller)
	goToState("Dead")
	ActorIsDead = true
endEvent


Function ChangeHoldPosition()
; 	debug.Trace(self + ": Running ChangeHoldPosition")
	int marker = utility.randomInt(1, totalHoldMarkers)
; 	debug.Trace(self + ": HoldPosition = " + marker)
	bool markerFound = False
	if !markerFound && marker == 1 && hasLink01
		self.setActorValue("Variable07", 1)
		markerFound = True
	else
		marker += 1
	endif
	if !markerFound && marker == 2 && hasLink02
		self.setActorValue("Variable07", 2)
		markerFound = True
	else
		marker += 1
	endif
	if !markerFound && marker == 3 && hasLink03
		self.setActorValue("Variable07", 3)
		markerFound = True
	else
		marker += 1
	endif
	if !markerFound && marker == 4 && hasLink04
		self.setActorValue("Variable07", 4)
		markerFound = True
	else
		marker += 1
	endif
	if !markerFound && marker == 5 && hasLink05
		self.setActorValue("Variable07", 5)
		markerFound = True
	else
		marker += 1
	endif
	if !markerFound && marker == 6 && hasLink06
		self.setActorValue("Variable07", 6)
		markerFound = True
	else
; 		debug.Trace(self + ": has no links!")
	endif
endFunction


Function RegisterHoldPositions()
	if !Initialized
		if LinkCustom01 && getLinkedRef(LinkCustom01)
			hasLink01 = true
			totalHoldMarkers += 1
		endif
		if LinkCustom02 && getLinkedRef(LinkCustom02)
			hasLink02 = true
			totalHoldMarkers += 1
		endif
		if LinkCustom03 && getLinkedRef(LinkCustom03)
			hasLink03 = true
			totalHoldMarkers += 1
		endif
		if LinkCustom04 && getLinkedRef(LinkCustom04)
			hasLink04 = true
			totalHoldMarkers += 1
		endif
		if LinkCustom05 && getLinkedRef(LinkCustom05)
			hasLink05 = true
			totalHoldMarkers += 1
		endif
		if LinkCustom06 && getLinkedRef(LinkCustom06)
			hasLink06 = true
			totalHoldMarkers += 1
		endif
		Initialized = true
	endif
endFunction