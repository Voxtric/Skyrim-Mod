Scriptname RedwaterDenDoorScript extends ObjectReference  

Quest Property DLC1VampireBaseIntro  Auto  



Event OnLoad()

	if DLC1VampireBaseIntro.GetStage() < 20
		Self.Lock(false)
	elseif DLC1VampireBaseIntro.GetStage() >= 50
		Self.Lock(false)
	endif

EndEvent		