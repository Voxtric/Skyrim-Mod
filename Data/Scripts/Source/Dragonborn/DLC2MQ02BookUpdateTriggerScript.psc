Scriptname DLC2MQ02BookUpdateTriggerScript extends ReferenceAlias  Conditional


Event OnTriggerEnter(ObjectReference ActionRef)

	if DoOnce == 0
		if ActionRef == Game.GetPlayer()
; 			Debug.Trace("MQ02 - player entered book update trigger")

			DLC2MQ02FreaPreBookScene.Start()
; 			Debug.Trace("MQ02 - scene should be running")
			DoOnce=1		
		endif
	endif

;

	if DoOnce==1
		if ActionRef == Game.GetPlayer()
			if DLC2MQ02.GetStage() == 50
				Game.GetPlayer().PlayIdle(IdleStop_Loose)
				DLC2MQ02.SetStage(60)
				DoOnce=2
				GetReference().Disable()
			endif
		endif
	endif

EndEvent
Quest Property DLC2MQ02  Auto  

Scene Property DLC2MQ02FreaPreBookScene  Auto  

int DoOnce
Idle Property IdleStop_Loose  Auto  
