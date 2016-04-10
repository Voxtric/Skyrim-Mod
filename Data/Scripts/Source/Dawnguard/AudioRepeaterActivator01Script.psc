Scriptname AudioRepeaterActivator01Script extends ObjectReference  
{Repeats a given sound's playback}

Import Utility
Import Debug

Sound Property SoundDescriptor  Auto  
{Sound Descriptor that this script will play}

float property delayMin = 1.0 Auto
float property delayMax = 5.0 Auto
Bool bRunning = True

EVENT OnCellAttach()
	;debug.trace("Audio Debug: loaded successfully "+self)
	bRunning = True
	 while (bRunning && is3DLoaded())
		SoundDescriptor.Play (self)
		;debug.trace("Audio Debug: while loop is playing successfully")
		wait (RandomFloat (DelayMin,DelayMax))
	EndWhile
EndEvent

Event OnCellDetach()
	bRunning = False
	;debug.trace("Audio Debug: turning loop off "+self)
EndEvent
	