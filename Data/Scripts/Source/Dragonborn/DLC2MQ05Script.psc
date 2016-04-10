Scriptname DLC2MQ05Script extends Quest  Conditional

Location Property DLC2NchardakLocation  Auto  

Location Property DLC2Book02DungeonLocation  Auto  

ObjectReference Property HermaeusMoraTA auto
ObjectReference Property HermaeusMoraActivator auto
DLC2HermaeusMoraFaceFXSCRIPT Property DLC2MQ05HermaeusMoraFXRef  Auto  

ObjectReference Property StornHermaeusMoraTA auto
DLC2MQ05HermaeusMoraFXScript Property DLC2MQ05HermaeusMoraStornFXRef Auto  


Function EnableHM(bool enabling)
	if (enabling)
		DLC2MQ05HermaeusMoraFXRef.ChangeState()
		utility.wait(1.0)
		HermaeusMoraActivator.Enable()
		HermaeusMoraTA.Enable()
	else
		DLC2MQ05HermaeusMoraFXRef.ChangeState(false)
		HermaeusMoraActivator.Disable()
		HermaeusMoraTA.Disable()
	endif
EndFunction

Function EnableHMStorn(bool enabling, int iNewState = -1)
	if (enabling)
		DLC2MQ05HermaeusMoraStornFXRef.ChangeState(true, iNewState)
		StornHermaeusMoraTA.Enable()
	else
		StornHermaeusMoraTA.Disable()
		DLC2MQ05HermaeusMoraStornFXRef.ChangeState(false)
	endif
EndFunction

