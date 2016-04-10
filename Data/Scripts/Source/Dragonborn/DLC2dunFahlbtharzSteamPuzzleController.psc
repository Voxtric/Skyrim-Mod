scriptName DLC2dunFahlbtharzSteamPuzzleController extends objectReference
;
bool Property isBusy = False auto hidden
int Property StartingSteamCharge = 0 auto hidden
int Property CurrentSteamCharge auto hidden
int Property SucessfulSteamCharge = 20 auto
ObjectReference Property SteamFail auto
ObjectReference Property SteamSuccess auto
ObjectReference Property LightChain auto
ObjectReference[] Property DLC2dunFahlbtharzResonatorArray auto
ObjectReference Property DLC2dunFahlbtharzPuzzleDoor auto
float Property LightChangeRate = 0.1 auto hidden
int Property FailureTotal = 0 auto hidden

float ControllerShakeL = 0.5
float ControllerShakeR = 0.5
float ControllerShakeDuration = 1.5
bool DoNotPunishFailure = False

ObjectReference Property DLC2dunFahlbtharzPuzzleFailLinker001 auto
ObjectReference Property DLC2dunFahlbtharzPuzzleFailLinker002 auto
ObjectReference Property DLC2dunFahlbtharzPuzzleFailLinker003 auto

Sound Property OBJFahlbtharzFail auto
Sound Property OBJFahlbtharzSuccess auto

event onReset()
	CurrentSteamCharge = StartingSteamCharge
endEvent

Function AddSteam(int SteamCharge, objectReference resonator)
	int endCharge = CurrentSteamCharge + SteamCharge
	ControlLights(endCharge)				;Control the lights
	(resonator as DLC2dunFahlbtharzResonatorScript).TurnOffSteam()
	if CurrentSteamCharge == SucessfulSteamCharge		;Success! Puzzle solved
		OpenDoor()											;Open the door
		Return												;Kick out so isBusy stays true
	elseIf CurrentSteamCharge > SucessfulSteamCharge ;\
			;|| CurrentSteamCharge < 0							;Failure! Reset Puzzle
		StartSteamVent()									;Vent Steam and Reset Display
		PunishFailure()										;Punish player for failing!
		ResetResonators()									;Reset Resonators
		EndSteamVent()										;End Venting Steam
	endif
	isBusy = False										;Allow Resonators to work
endFunction


Function ControlLights(int endCharge)
	objectReference currentLight

	int i = CurrentSteamCharge
	;;;;;;;;;;;;;;;;;;;;;;THIS EMPTIES THE METER;;;;;;;;;;;;;;;;;;;;;;;
	if CurrentSteamCharge >= endCharge
; 		debug.Trace(self + ": emptying the meter")
		while i > endCharge
; 			debug.Trace(self + ": i = " + i + " ; endCharge = " + endCharge)
			if i == 0
				currentLight = LightChain
			elseif i > 20
				currentLight = LightChain.GetNthLinkedRef(i - 21)
			else
				currentLight = LightChain.GetNthLinkedRef(i - 1)
			endif
			;Turn current Light on
			if currentLight
				(currentLight as DLC2DweSteamMeterScript).EmptyMeter()
			else
; 				debug.Trace(self + ": Error no current Light")
			endif
			i -= 1
			utility.wait(LightChangeRate)
		endWhile
	;;;;;;;;;;;;;;;;;;;;;;THIS FILLS THE METER;;;;;;;;;;;;;;;;;;;;;;;;
	else
; 		debug.Trace(self + ": filling the meter")
		while i < endCharge
; 			debug.Trace(self + ": i = " + i + " ; endCharge = " + endCharge)
			i += 1
			if i == 1
				currentLight = LightChain
			elseif i <= 20
				currentLight = LightChain.GetNthLinkedRef(i - 1)
			else
				;i == endCharge
				currentLight = LightChain.GetNthLinkedRef(i - 21)
				OBJFahlbtharzFail.play(LightChain)  ;Just use LightChain as a convenient place to play from
				game.ShakeCamera(afStrength = 1.0)
				game.ShakeController(ControllerShakeL, ControllerShakeR, ControllerShakeDuration)
			endif
			if currentLight
				(currentLight as DLC2DweSteamMeterScript).FillMeter()
			endif
			utility.wait(LightChangeRate)
		endWhile
	endif
	CurrentSteamCharge = endCharge
	if CurrentSteamCharge < 0
		CurrentSteamCharge = 0
	endif
endFunction

Function ResetResonators()
; 	debug.Trace(self + ":Resetting Resonators")
	int arrayCount = DLC2dunFahlbtharzResonatorArray.Length
	int i = 0
	while i < arrayCount
; 		debug.Trace(".........." + DLC2dunFahlbtharzResonatorArray[i])
		DLC2dunFahlbtharzResonatorArray[i].GoToState("Reset")
		i +=1
	endWhile
endFunction

Function StartSteamVent()
	SteamFail.Enable()
	SteamFail.EnableLinkChain()
	;utility.Wait(0.5)
	ControlLights(endcharge = 0)						;Reset lights and set Current Steam Charge to 0
endFunction
	
Function EndSteamVent()
	utility.wait(2.0)
	SteamFail.Disable()
	SteamFail.DisableLinkChain()
endFunction

Function OpenDoor()
	OBJFahlbtharzSuccess.play(LightChain) ;Just use LightChain as a convenient place to play from
	SteamSuccess.Enable()
	SteamSuccess.EnableLinkChain()
	utility.Wait(0.5)
	DLC2dunFahlbtharzPuzzleDoor.Activate(DLC2dunFahlbtharzPuzzleDoor)
endFunction

Function PunishFailure()
	if !DoNotPunishFailure
		FailureTotal +=1
		if FailureTotal == 1
			DLC2dunFahlbtharzPuzzleFailLinker001.activate(DLC2dunFahlbtharzPuzzleFailLinker001)
		elseIf FailureTotal == 2
			DLC2dunFahlbtharzPuzzleFailLinker002.activate(DLC2dunFahlbtharzPuzzleFailLinker002)
		else
			DLC2dunFahlbtharzPuzzleFailLinker003.activate(DLC2dunFahlbtharzPuzzleFailLinker003)
		endif
	endif
endFunction

bool Function GetIsBusy()
	return isBusy
endFunction

Function SetIsBusy(bool busyState = true)
	isbusy = busyState
endFunction