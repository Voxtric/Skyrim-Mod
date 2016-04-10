Scriptname DLC2RRESKickoffScript extends ObjectReference  

Quest Property pDLC2RREstablishingScene  Auto
Quest Property pDLC2RR01 Auto
Quest Property pDLC2RR03 Auto
Quest Property pDLC2RRArrivalScene Auto

Int Property pTriggered  Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()

		if pDLC2RREstablishingScene.GetStageDone(10) == 0
			pDLC2RREstablishingScene.SetStage(10)
		endif

		if pDLC2RRArrivalScene.GetStageDone(10) == 0
			pDLC2RRArrivalScene.SetStage(10)
		endif

		if pDLC2RR01.GetStageDone(10) == 0
			pDLC2RR01.SetStage(10)
			pDLC2RR01.SetStage(20)
		endif
		
		if pDLC2RR03.GetStageDone(10) == 0
			pDLC2RR03.SetStage(10)
		endif

	endif

endEvent