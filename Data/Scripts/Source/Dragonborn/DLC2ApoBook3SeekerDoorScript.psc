Scriptname DLC2ApoBook3SeekerDoorScript extends ObjectReference  
import Debug
import Utility

Int SeekerCount = 0
Int DeadCount = 0

function GetSeekerNumber()
	SeekerCount += 1
	;Notification ("Seeker Plus One")
endFunction

function CheckDead()
	DeadCount += 1
	;Notification("Dead Counted")
	if (DeadCount == SeekerCount)
		;Notification("Acticate")
		Self.Activate(Self)
	endif
endFunction