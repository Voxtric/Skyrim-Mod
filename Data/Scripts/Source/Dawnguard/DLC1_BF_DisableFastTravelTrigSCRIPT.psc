Scriptname DLC1_BF_DisableFastTravelTrigSCRIPT extends ObjectReference Hidden


EVENT onTriggerEnter(objectReference triggerRef)

	Game.EnableFastTravel(false)

endEvent