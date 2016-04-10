Scriptname DLC1BaseIntroAmbushTriggerScript extends ObjectReference  

Quest Property DLC1HunterBaseIntroAmbush  Auto  

Quest Property DLC1HunterBaseIntro  Auto  


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if DLC1HunterBaseIntro.GetStage() == 20
			DLC1HunterBaseIntroAmbush.Start()
			Self.Disable()
		endif
	endif


EndEvent