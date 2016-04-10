Scriptname DLC1VampireBaseIntroSpringTriggerScrip extends ObjectReference  

Quest Property DLC1VampireBaseIntro  Auto  


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if DLC1VampireBaseIntro.GetStage() == 20
			DLC1VampireBaseIntro.SetStage(30)
		endif
	endif

EndEvent