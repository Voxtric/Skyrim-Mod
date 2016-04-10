scriptName DLC2Book01DungeonGenDeathTrackerParent extends objectReference

int property totalDeathNeeded = 3 auto
int property currentDeaths = 0 auto hidden
objectReference property objectToActivate auto
bool property bEnableLinkedRefChain auto
bool property bDisableLinkedRefChain auto
bool property FadeInOrOut = True auto
float property waitBeforeEnableDisable = 2.0 auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       States block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

auto state Waiting
	Function IncrementDeathTracker()
; 		debug.Trace(self + "Incrementing death tracker")
		currentDeaths += 1
		CheckDeathsNeeded()
	endFunction
endState

state Done 
	Function IncrementDeathTracker()
	endFunction

	Function CheckDeathsNeeded()
	endFunction
endState

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       Functions block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function TriggerEndEvent()
	if objectToActivate
		objectToActivate.activate(objectToActivate)
	endif
	utility.wait(waitBeforeEnableDisable)
	if bEnableLinkedRefChain
		if GetLinkedRef()
			objectReference currentLink = GetLinkedRef()
			while currentLink
				currentLink.Enable(FadeInOrOut)
				currentLink = currentLink.GetLinkedRef()
			endWhile
		endif
	elseif bDisableLinkedRefChain
		if GetLinkedRef()
			objectReference currentLink = GetLinkedRef()
			while currentLink
				currentLink.Disable(FadeInOrOut)
				currentLink = currentLink.GetLinkedRef()
			endWhile
		endif
	endif
EndFunction


Function IncrementDeathTracker()
; 	debug.Trace(self + "Incrementing death tracker")
	currentDeaths += 1
	CheckDeathsNeeded()
endFunction

Function ChangeTotalDeathsNeeded(int newTotalDeaths)
; 	debug.Trace(self + "changing total deaths needed to " + newTotalDeaths)
	totalDeathNeeded = newTotalDeaths
	CheckDeathsNeeded()
endFunction

Function CheckDeathsNeeded()
; 	debug.Trace(self + "Checking deaths needed")
; 	debug.Trace(self + "CurrentDeaths == " + currentDeaths)
; 	debug.Trace(self + "totalDeathsNeededDeaths == " + totalDeathNeeded)
	if currentDeaths >= totalDeathNeeded
		goToState("Done")
		TriggerEndEvent()
	endIf
endFunction