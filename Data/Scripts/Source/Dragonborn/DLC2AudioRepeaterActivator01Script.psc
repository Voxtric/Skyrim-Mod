Scriptname DLC2AudioRepeaterActivator01Script extends ObjectReference  
{Repeats a given sound's playback}

Import Utility
Import Debug

Sound Property SoundDescriptor  Auto  
{Sound Descriptor that this script will play}

float property delayMin = 1.0 Auto
float property delayMax = 5.0 Auto
Bool bRunning = True

EVENT OnCellAttach()
; 	;debug.trace("Audio Debug: loaded successfully "+self)
	if(isEnabled())
		bRunning = True
	else
		bRunning = False
	endif

	 while (bRunning && is3DLoaded())
		SoundDescriptor.Play (self)
; 		;debug.trace("Audio Debug: while loop is playing successfully")
		wait (RandomFloat (DelayMin,DelayMax))
		if(isEnabled())
			bRunning = True
		else
			bRunning = False
		endif
	EndWhile
EndEvent

Event OnCellDetach()
	bRunning = False
; 	;debug.trace("Audio Debug: turning loop off "+self)
EndEvent
	