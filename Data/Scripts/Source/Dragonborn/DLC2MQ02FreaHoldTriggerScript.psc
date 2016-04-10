Scriptname DLC2MQ02FreaHoldTriggerScript extends ReferenceAlias  Conditional

Quest Property DLC2MQ02 Auto  Conditional

Scene Property FreaHoldScene  Auto  Conditional

int DoOnce

Event OnTriggerEnter (ObjectReference ActionRef)

DLC2MQ02QuestScript QuestScript = DLC2MQ02 as DLC2MQ02QuestScript


	if ActionRef == Game.GetPlayer()
		if DLC2MQ02.GetStage() == 30
			if DoOnce == 1
				QuestScript.FreaHold=1
				FreaHoldScene.Start()
			elseif DoOnce == 0
				DoOnce = 1
			endif
					

		endif
	endif

EndEvent