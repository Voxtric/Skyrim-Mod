Scriptname DLC1VCMoondialScript extends ObjectReference Conditional
{Script to open the Moondial in the Vampire Castle Courtyard}

import game
import debug
import utility

bool property isOpen = false	auto Conditional
{set to true to start open}

bool property tile1Placed = false auto Hidden
{set to true if player has placed tile 1}

bool property tile2Placed = false auto Hidden
{set to true if player has placed tile 2}

bool property tile3Placed = false auto Hidden
{set to true if player has placed tile 3}

bool property isAnimating = false auto Hidden
{is the activator currently animating from one state to another?}

string property openAnim = "Down" auto Hidden
{animation to play when opening}

string property openEvent = "TransDown" auto Hidden
{open event name - waits for this event before considering itself "open"}

int myState = 1
; true when static or animating
; 0 == open or opening
; 1 == closed or closing

Quest property DLC1VQ04 auto
{Stage will be set on this quest when passage is open}

int property minStage = -1 auto
{Minimum stage the quest can be on to set the new stage,
	max is the "Stage" property}

int property Stage = 0 auto
{Stage to set when passage is open}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Loose Event Block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

EVENT OnLoad()
	if (isOpen )
		myState = 0
	endif
endEVENT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  State Block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


auto STATE waiting
	; waiting to be activated
endState

STATE busy
	; Busy animating, go away
endSTATE

STATE done
	; This is the end state, player should not be able to reactivate
endSTATE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Function Block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; This function sets the Moondial to open
function SetOpen(bool abOpen = true)
	; if busy, wait to finish
	while getState() == "busy"
		wait(1)
	endWhile
	; open
	isAnimating = true
		if  !isOpen
			gotoState ("busy")
			trace(self + " Opening")
			playAnimationandWait("Open", "Done") ; Animate Open
		endif
		trace(self + " Opened")
		isOpen = true
		gotoState("done")
	isAnimating = false
endFunction

; This function is called from the Tile activators after their tile is placed
function SetTilePlaced(int TileToPlace)
	if TileToPlace == 1
		tile1Placed = True
	elseif TileToPlace == 2
		tile2Placed = True
	elseif TileToPlace == 3
		tile3Placed = True
	else
		Trace(self + " has tried to SetTilePlaced with bad value of " + TileToPlace)
	endif
	
	;When all three tiles have been placed, open passage
	if tile1Placed && tile2Placed && tile3Placed
		SetOpen(True)
		if DLC1VQ04.getStage() >= MinStage && DLC1VQ04.getStage() < Stage
			DLC1VQ04.setStage(Stage)
		endif
	endif
endFunction




