ScriptName DLC2dunKolbjornPuzzlePillarScript extends ObjectReference

int property pillarState auto hidden	;1 for Solution 1 (Main), 2 for Solution 2 (Alt), 3 for neither.

int property initialState auto
{
This is the position the pillar starts out in.
1 = Position 1 (eagle)
2 = Position 2 (snake)
3 = Position 3 (whale)
Position 1,2,3 refer to the havok animations
}

int property solution1 auto
{
This is the position the pillar needs to be in to be considered solved.
1 = Position 1 (eagle)
2 = Position 2 (snake)
3 = Position 3 (whale)
Position 1,2,3 refer to the havok animations
}

int property solution2 auto
{
This is the position the pillar needs to be in to be considered solved.
1 = Position 1 (eagle)
2 = Position 2 (snake)
3 = Position 3 (whale)
Position 1,2,3 refer to the havok animations
}

Event OnCellLoad()	
	;account for case where initialState and solveState are equal in the beginning
	if (initialState == solution1)
		pillarState = 1
	ElseIf (initialState == solution2)
		pillarState = 2
	Else
		pillarState = 3
	EndIf
	
	;now move the pillar into initialState
	if (initialState == 1)
		;no animation
		gotoState("position01")
	elseif (initialState == 2)
		playAnimation("StartState02")
		gotoState("position02")
	elseif (initialState == 3)
		playAnimation("StartState03")
		gotoState("position03")
	endif
endEvent

; Makes the pillar rotate to the next state and checks whether it is 'solved' as a result	
FUNCTION RotatePillarToState(int stateNumber, int animEventNumber)
		gotoState ("busy")
		if (stateNumber == solution1)
			pillarState = 1
		ElseIf (stateNumber == solution2)
			pillarState = 2
		Else
			pillarState = 3
		endif
		playAnimationandWait("Trigger0" + animEventNumber, "Turned0" + animEventNumber)
endFUNCTION

	
STATE position01
	EVENT onActivate (objectReference triggerRef)
		RotatePillarToState(2, 1)
		gotoState("position02")
	endEVENT
endState

STATE position02
	EVENT onActivate (objectReference triggerRef)
		RotatePillarToState(3, 2)
		gotoState("position03")
	endEVENT
endState

STATE position03
	EVENT onActivate (objectReference triggerRef)
		RotatePillarToState(1, 3)
		gotoState("position01")
	endEVENT
endState

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;do nothing
		endEVENT
endSTATE