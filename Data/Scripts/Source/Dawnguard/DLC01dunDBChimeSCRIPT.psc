Scriptname DLC01dunDBChimeSCRIPT extends ObjectReference Hidden 

import debug
import utility

Keyword Property LinkCustom07 Auto
{Keyword that the master uses to link ref to the steam effect}

int property ChimeNumber = 0 auto
{The order in the solution this chime is, set per reference}

EffectShader Property GlowyEffect Auto
{Temp effect to play showing that this chime hasn't been hit}

ObjectReference Property ChimeMaster Auto Hidden
{Set my the ChimeMaster OnCellAttach()}

Bool Property AlreadyHit = FALSE Auto Hidden
{Whether this chime has already been hit, resets on failed order}

auto STATE WaitingForHit

		; Once hit let the Master know, and play the steam effect out of the statue head
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if (AlreadyHit == FALSE)
			GoToState("WaitingForReset")
			AlreadyHit = TRUE
			PlayAnimationAndWait("open", "done")
			;GlowyEffect.Stop(Self)
			ChimeMaster.GetLinkedRef(LinkCustom07).Enable()
			(ChimeMaster as DLC01dunDBChimeMasterSCRIPT).ChimeHit(ChimeNumber, self)
			Wait(1)
			ChimeMaster.GetLinkedRef(LinkCustom07).Disable()
		endif
	EndEvent

EndSTATE

STATE WaitingForReset
	;Do Nothing
EndSTATE

	; Called from Master script OnCellAttached() and ResetChimes()
Function StartGlow()
	;GlowyEffect.Play(Self)
EndFunction

	; Called from OnHit() and from Master script ResetChimes()
Function StopGlow()
	PlayAnimation("close")
	GetLinkedRef().DisableNoWait()
	GoToState("WaitingForHit")
	;GlowyEffect.Stop(Self)
EndFunction