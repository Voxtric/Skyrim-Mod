Scriptname DLC01VampireThrallActivatorScript extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		Say(ThrallHellos, ThrallSpeaker)
	endif
endEvent


Topic Property ThrallHellos  Auto  
Actor Property ThrallSpeaker Auto
