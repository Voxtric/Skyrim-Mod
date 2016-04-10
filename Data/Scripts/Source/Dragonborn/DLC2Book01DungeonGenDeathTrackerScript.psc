scriptName DLC2Book01DungeonGenDeathTrackerScript extends actor

objectReference property controllerRef auto
DLC2Book01DungeonGenDeathTrackerParent property controllerScript auto hidden
bool property doOnce = false auto hidden

auto state waiting
	event onDeath(actor akKiller)
; 		debug.Trace(self + " has died, processing onDeath")
		if doOnce == false
			doOnce = True
			goToState("Done")
			ProcessDeath()
		endif
	endEvent
endState

state Done
endState

Function ProcessDeath()
; 	debug.Trace(self + " telling controller to incrementDeathTracker")
	controllerScript = (controllerRef as DLC2Book01DungeonGenDeathTrackerParent)
	if controllerScript
		controllerScript.IncrementDeathTracker()
	else
; 		debug.Trace(self + ": BADNESS! controllerScript = " + controllerScript)
	endif
endFunction