Scriptname DLC1HorseQuestGetSkullScript extends ObjectReference  

Quest Property DLC01SoulCairnHorseQuest2  Auto  

Int Property stage Auto  

ObjectReference Property DLCHorseQuestLightingSource01  Auto
ObjectReference Property DLCHorseQuestLightingSource02  Auto 
ObjectReference Property DLCHorseQuestLightingSource03  Auto 
ObjectReference Property DLCHorseQuestLightingSource04  Auto   

ObjectReference Property DLCHorseQuestLightingStrike01  Auto 
ObjectReference Property DLCHorseQuestLightingStrike02  Auto 
ObjectReference Property DLCHorseQuestLightingStrike03  Auto 
ObjectReference Property DLCHorseQuestLightingStrike04  Auto 

ObjectReference Property DLCHorseQuestMistman01 Auto
ObjectReference Property DLCHorseQuestMistman02 Auto
ObjectReference Property DLCHorseQuestMistman03 Auto
ObjectReference Property DLCHorseQuestMistman04 Auto

ObjectReference Property DLCHorseQuestNecro01 Auto
ObjectReference Property DLCHorseQuestNecro02 Auto
ObjectReference Property DLCHorseQuestNecro03 Auto
ObjectReference Property DLCHorseQuestNecro04 Auto

;ObjectReference Property DLC1HorseQuestNecroEn Auto

SPELL Property DLC01SC_SkyLightningBolt01  Auto

EVENT onTriggerEnter(objectReference triggerRef)
	actor actorRef = triggerRef as actor
	if actorRef == Game.GetPlayer()
		Disable()
		
		DLC01SoulCairnHorseQuest2.setStage(stage)
		DLC01SC_SkyLightningBolt01.cast(DLCHorseQuestLightingSource01, DLCHorseQuestLightingStrike01)
		DLCHorseQuestNecro01.Disable()
		DLCHorseQuestMistman01.Enable()
		utility.wait(0.0)

		DLC01SC_SkyLightningBolt01.cast(DLCHorseQuestLightingSource02, DLCHorseQuestLightingStrike02)
		DLCHorseQuestNecro02.Disable()
		DLCHorseQuestMistman02.Enable()
		utility.wait(0.0)

		DLC01SC_SkyLightningBolt01.cast(DLCHorseQuestLightingSource03, DLCHorseQuestLightingStrike03)
		DLCHorseQuestNecro03.Disable()
		DLCHorseQuestMistman03.Enable()
		utility.wait(0.0)

		DLC01SC_SkyLightningBolt01.cast(DLCHorseQuestLightingSource04, DLCHorseQuestLightingStrike04)
		DLCHorseQuestNecro04.Disable()
		DLCHorseQuestMistman04.Enable()
		utility.wait(0.0)


	endif
endEVENT

