Scriptname DLC2ThirskAssaultTriggerScript extends ObjectReference  

Quest Property DLC2MHMisc auto
Quest Property DLC2MH01 auto
Quest Property DLC2MHRieklingHandler auto
Scene Property BujoldRallyScene auto


Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator != Game.GetPlayer())
		return
	endif
; 	Debug.Trace("DLC2MH01: Entering Thirsk trigger...")
	if (DLC2MHMisc.IsRunning())
		DLC2MHMisc.SetStage(100)
	endif
	if ((DLC2MH01.GetStage() == 20) || (BujoldRallyScene.IsPlaying()) )
; 		Debug.Trace("DLC2MH01: Staring riekling handler.")
		DLC2MHRieklingHandler.Start()
		Delete()
	else
; 		Debug.Trace("DLC2MH01: Stage is " + DLC2MH01.GetStage())
; 		Debug.Trace("DLC2MH01: Scene playing? " + BujoldRallyScene.IsPlaying())
	endif
EndEvent
