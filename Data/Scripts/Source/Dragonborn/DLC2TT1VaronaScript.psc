Scriptname DLC2TT1VaronaScript extends ReferenceAlias  

Event OnActivate(ObjectReference akWhoPokedMe)
	if akWhoPokedMe == Game.GetPlayer()
		if DLC2TT1.GetStageDone(90) == false
			; player talks to Varona (or picks her pocket) for the first time
			DLC2TT1.SetStage(90)
		elseif GetActorRef().IsDead() == true
			if DLC2TT1.GetStageDone(150)
				; player is sent to find the body by Neloth	
				DLC2TT1.SetStage(200)
			else
				; player discovers the body before Neloth asks for her
				DLC2TT1.SetStage(210)
			endif
		endif
	endif
EndEvent

Quest Property DLC2TT1  Auto  
