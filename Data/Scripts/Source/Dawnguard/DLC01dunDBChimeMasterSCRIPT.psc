Scriptname DLC01dunDBChimeMasterSCRIPT extends ObjectReference Hidden 

import debug
import utility

; Keywords for all the linked ref chimes
Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto
Keyword Property LinkCustom04 Auto
Keyword Property LinkCustom05 Auto

; Keyword for the door in front of the boss centurion
Keyword Property LinkCustom06 Auto

; Keyword for the steam effect
Keyword Property LinkCustom07 Auto

; Keywords for the two doors on the sides (so I can block activation on them OnCellAttach())
Keyword Property LinkCustom08 Auto
Keyword Property LinkCustom09 Auto

; Set of spiders that ambush at some point when you hit the incorrect chime
ObjectReference Property Spider01 Auto
ObjectReference Property Spider02 Auto
ObjectReference Property Spider03 Auto
ObjectReference Property Spider04 Auto

; Set of Spheres that ambush at some point when you  hit the incorrect chime
ObjectReference Property Sphere01 Auto
ObjectReference Property Sphere02 Auto

; Enable markers for whether you hit the correct chime or not
ObjectReference Property EvilEyes Auto
ObjectReference Property WinEyes Auto

; Two Ballista that fire on one of the failed puzzle attemps
ObjectReference Property Ballista01 Auto
ObjectReference Property Ballista02 Auto

; The fail and success sounds
Sound Property QSTArkngthamzPuzzleFail Auto
Sound Property QSTArkngthamzPuzzleSuccessA Auto
Sound Property QSTArkngthamzPuzzleSuccessB Auto
Sound Property QSTArkngthamzPuzzleSuccessC Auto
Sound Property QSTArkngthamzPuzzleSuccessD Auto
Sound Property QSTArkngthamzPuzzleSuccessE Auto

; Keeps count of how many times you've failed the puzzle
Int Property ChimeFailCount = 0 Auto Hidden

Bool Property DoOnce Auto Hidden
{Bool for setting up linked refs only once}

Int Property ChimeCount = 1 Auto Hidden
{Starting point for setting up chimes in SetupChimes()}

Int Property NextCorrectChime = 1 Auto Hidden
{Stores the next correct chime, always starts with 1, and resets to one on failed chime}

Quest Property DLC1LD_Arkngthamz Auto
{Quest that we set the stage on once the puzzle is solved}

Scene Property DLC1LD_13e_KatriaSuccess1 Auto
{Scene to trigger after the player solves 2/5.}

Scene Property DLC1LD_13f_KatriaSuccess2 Auto
{Scene to trigger after the player solves 3/5 or 4/5.}

Scene Property DLC1LD_13g_KatriaFail Auto
{Scene to trigger after a failure.}

GlobalVariable Property DLC1ArkgnthamzRumbleGlobal Auto
{Variable to set to 0 when the puzzle is solved}


ObjectReference Property PuzzleHintTrigger Auto
{Trigger that determines when hints are given to the player.}

; Set once the puzzle gets solved
Bool  AlreadySolved = FALSE



Event OnCellAttach()
	

	; Set up all the chimes so that they know who the master is, using SetupChimes()
	; ...also tell the centurion to be ghosted
	if DoOnce == FALSE
		SetupChimes(GetLinkedRef(LinkCustom01))
		SetupChimes(GetLinkedRef(LinkCustom02))
		SetupChimes(GetLinkedRef(LinkCustom03))
		SetupChimes(GetLinkedRef(LinkCustom04))
		SetupChimes(GetLinkedRef(LinkCustom05))

		(GetLinkedRef() as Actor).SetGhost()

		GetLinkedRef(LinkCustom06).BlockActivation()
		GetLinkedRef(LinkCustom08).BlockActivation()
		GetLinkedRef(LinkCustom09).BlockActivation()

		DoOnce = TRUE
	endif

EndEvent



	; Gets called whenever a chime is hit, and checks if it was a correct hit
Function ChimeHit(int akChimeNumber, objectreference ChimeRef)
      ;Temporarly delay hints if the player is working on the puzzle.
      (PuzzleHintTrigger as DLC1LD_PuzzleHintTriggerScript).DelayHint()

	if (akChimeNumber == NextCorrectChime)
		ChimeRef.GetLinkedRef().EnableNoWait()

			; If akChimeNumber is less than five then go ahead and increment NextCorrectChime by one
		if (akChimeNumber < 5)
			NextCorrectChime = NextCorrectChime + 1

				; Play correct chime sound
			if (NextCorrectChime == 2)
				QSTArkngthamzPuzzleSuccessA.Play(GetLinkedRef(LinkCustom06))
				;debug.Notification("Playing success 1")
			elseif (NextCorrectChime == 3)
				QSTArkngthamzPuzzleSuccessB.Play(GetLinkedRef(LinkCustom06))
				;debug.Notification("Playing success 2")
			elseif (NextCorrectChime == 4)
				QSTArkngthamzPuzzleSuccessC.Play(GetLinkedRef(LinkCustom06))
				;debug.Notification("Playing success 3")
			elseif (NextCorrectChime == 5)
				QSTArkngthamzPuzzleSuccessD.Play(GetLinkedRef(LinkCustom06))
				;debug.Notification("Playing success 4")				
			endif

			;If the player has solved 2/5, trigger a scene line.
			if (NextCorrectChime == 3)
				DLC1LD_13e_KatriaSuccess1.Start()
			ElseIf (NextCorrectChime == 4)
				DLC1LD_13f_KatriaSuccess2.Start()
			ElseIf (NextCorrectChime == 5)
				DLC1LD_13f_KatriaSuccess2.Start()
			EndIf
			
		elseif (AlreadySolved == FALSE)
				; If akChimeNumber equals 5 then youve solved the puzzle!
			QSTArkngthamzPuzzleSuccessE.Play(GetLinkedRef(LinkCustom06))
			;debug.Notification("Playing success 5")

				; Stop the ambient rumble effects
			DLC1ArkgnthamzRumbleGlobal.SetValue(0)
			
			GetLinkedRef(LinkCustom08).BlockActivation(FALSE)
			GetLinkedRef(LinkCustom08).Lock(FALSE)
			GetLinkedRef(LinkCustom08).Activate(GetLinkedRef(LinkCustom06))

			GetLinkedRef(LinkCustom09).BlockActivation(FALSE)
			GetLinkedRef(LinkCustom09).Lock(FALSE)
			GetLinkedRef(LinkCustom09).Activate(GetLinkedRef(LinkCustom06))
				;	Notify the quest that the puzzle has been solved.
			DLC1LD_Arkngthamz.SetStage(90)
			AlreadySolved = TRUE
		elseif (AlreadySolved == TRUE)
				; so that the player can continue to trigger the traps if he wants to
			ChimeFailCount = ChimeFailCount + 1
			NextCorrectChime = 1
			ResetChimes(GetLinkedRef(LinkCustom01))
			ResetChimes(GetLinkedRef(LinkCustom02))
			ResetChimes(GetLinkedRef(LinkCustom03))
			ResetChimes(GetLinkedRef(LinkCustom04))
			ResetChimes(GetLinkedRef(LinkCustom05))
			EvilEyes.DisableNoWait()
		endif

		Game.ShakeCamera(afStrength = 0.1)

	else
		; It was a failed hit, do failed stuff

		QSTArkngthamzPuzzleFail.Play(GetLinkedRef(LinkCustom06))
		;debug.Notification("Playing fail")
		;Trigger Katria's response scene.
		DLC1LD_13g_KatriaFail.Start()

		if (ChimeFailCount == 0)
			; Spawn Spiders on first fail
			EvilEyes.EnableNoWait()
			Game.ShakeCamera(afStrength = 0.4)
			Wait(2)
			Spider01.Activate(Spider01)
			Spider02.Activate(Spider02)
			Spider03.Activate(Spider03)
			Spider04.Activate(Spider04)

		elseif (ChimeFailCount == 1)
			; Spawn Spheres on second fail
			EvilEyes.EnableNoWait()
			Game.ShakeCamera(afStrength = 0.4)
			Wait(2)
			Sphere01.Activate(Sphere01)
			Sphere02.Activate(Sphere02)

		elseif (ChimeFailCount == 2) || (ChimeFailCount > 3)
				; Fire Ballista on third fail, and all fails beyond the fourth
			EvilEyes.EnableNoWait()
			;(Ballista01 as TrapDweBallista).ShotCount = 3
			Game.ShakeCamera(afStrength = 0.4)
			Wait(1)
				; Enable lights behind ballista
			Ballista01.GetLinkedref(LinkCustom04).EnableNoWait()
			Wait(0.25)
			Ballista02.GetLinkedref(LinkCustom04).EnableNoWait()
			Wait(1)
			Ballista01.TranslateToRef(Ballista01.GetLinkedRef(LinkCustom01), 1.0, 10)
			Ballista02.TranslateToRef(Ballista02.GetLinkedRef(LinkCustom01), 1.0, 10)			
			Wait(2)
			Ballista01.Activate(self)
			Wait(0.25)
			Ballista02.Activate(self)	

			Ballista01.TranslateToRef(Ballista01.GetLinkedRef(LinkCustom02), 1.0, 10)
			Ballista02.TranslateToRef(Ballista02.GetLinkedRef(LinkCustom02), 1.0, 10)
			Wait(2)
			Ballista01.Activate(self)
			Wait(0.25)
			Ballista02.Activate(self)		

			Ballista01.TranslateToRef(Ballista01.GetLinkedRef(LinkCustom03), 1.0, 10)
			Ballista02.TranslateToRef(Ballista02.GetLinkedRef(LinkCustom03), 1.0, 10)
			Wait(2)
			Ballista01.Activate(self)
			Wait(0.5)
			Ballista02.Activate(self)

			Wait(1)

				; Disable lights behind Ballista
			Ballista01.GetLinkedref(LinkCustom04).DisableNoWait()
			Wait(0.25)
			Ballista02.GetLinkedref(LinkCustom04).DisableNoWait()

		elseif (ChimeFailCount == 3)
			; Spawn centurion on third fail
			EvilEyes.EnableNoWait()
			Game.ShakeCamera(afStrength = 0.4)
			Wait(2)
			(GetLinkedRef() as Actor).SetGhost(FALSE)
			GetLinkedRef(LinkCustom06).BlockActivation(FALSE)
			GetLinkedRef(LinkCustom06).Lock(FALSE)
			GetLinkedRef(LinkCustom06).Activate(GetLinkedRef(LinkCustom06))
			GetLinkedRef().Activate(GetLinkedRef())
		endif

			; Reset all chimes when done failing
		ChimeFailCount = ChimeFailCount + 1
		NextCorrectChime = 1
		ResetChimes(GetLinkedRef(LinkCustom01))
		ResetChimes(GetLinkedRef(LinkCustom02))
		ResetChimes(GetLinkedRef(LinkCustom03))
		ResetChimes(GetLinkedRef(LinkCustom04))
		ResetChimes(GetLinkedRef(LinkCustom05))
		EvilEyes.DisableNoWait()
	endif
		
EndFunction



	; Sets up the chime then increments for the next one
Function ResetChimes(ObjectReference akLink)

	(akLink as DLC01dunDBChimeSCRIPT).StopGlow()
	(akLink as DLC01dunDBChimeSCRIPT).AlreadyHit = FALSE

EndFunction



	; Sets up the chime then increments for the next one
Function SetupChimes(ObjectReference akLink)
	PlayAnimationAndWait("open", "done")
	Wait(RandomFloat(0.0, 1.0))
	PlayAnimation("close")
	(akLink as DLC01dunDBChimeSCRIPT).ChimeMaster = Self

EndFunction