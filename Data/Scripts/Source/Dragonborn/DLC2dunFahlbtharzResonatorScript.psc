Scriptname DLC2dunFahlbtharzResonatorScript extends ObjectReference

int property SteamCharge = 0 Auto
	{This tells the controller how much steam charge to add/subtract
		Default = 0}
float Property SteamReleaseTime = 0.5 auto hidden
	{This is how long to leave the steam on before moving to the next link}
ObjectReference Property DLC2dunFahlbtharzSteamPuzzleControllerREf auto
	{This is the steamControllerRef}
DLC2dunFahlbtharzSteamPuzzleController Property SteamController auto hidden
	{steamController cast as the script}

bool property wasReset = false auto hidden

Event onLoad()
SteamController = DLC2dunFahlbtharzSteamPuzzleControllerREf as DLC2dunFahlbtharzSteamPuzzleController

endEvent

Auto State Inactive
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if !SteamController.GetIsBusy()
			OnActivate(akAggressor)
		endif
	EndEvent
	
	Event OnActivate(ObjectReference akActivator)
		if !SteamController.GetIsBusy()
			SteamController.SetIsBusy(True)
			wasReset = false
			GoToState("Busy")
			PlayAnimationAndWait("Open", "Trans01")
			ActivateSteamChain(SteamCharge)
			if !wasReset
				GoToState("Active")
			endif
		endif
	EndEvent
EndState

State Active
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;Do Nothing
		if !SteamController.GetIsBusy()
			OnActivate(akAggressor)
		endif
	EndEvent
	
	Event OnActivate(ObjectReference akActivator)
		if !SteamController.GetIsBusy()
			SteamController.SetIsBusy(True)
			GoToState("Busy")
			PlayAnimationAndWait("Close", "Trans02")
			ActivateSteamChain(0 - SteamCharge)
			GoToState("Inactive")
		endif
		;GoToState("Busy")
		;PlayAnimationAndWait("Close", "Done")
	EndEvent
EndState


State Busy
EndState

State Reset
	Event onBeginState()
		GoToState("Busy")
		wasReset = true
		PlayAnimationAndWait("Close", "Trans02")
		GoToState("Inactive")
	endEvent
EndState

Function ActivateSteamChain(int SteamChargeChange)
	self.EnableLinkChain()
	utility.wait(1.0)	
	if SteamController
		SteamController.AddSteam(SteamChargeChange, self)
	else
; 		debug.Trace(self + ": ERROR no steamController")
	endif
endFunction

Function TurnOffSteam()
	self.DisableLinkChain()
endFunction