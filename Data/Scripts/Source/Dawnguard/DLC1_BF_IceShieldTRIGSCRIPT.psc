Scriptname DLC1_BF_IceShieldTRIGSCRIPT extends ObjectReference Hidden 
{Script for DLC1_BF_IceShieldTRIGGER that tells the ice shield to form when a projectile is fired at it.}

import debug
import utility

Float Property MaxBlend = 0.7 Auto
{The max blend to reach when the shield is told to fToggleBlend to it's max}
Float Property HitBlendRate = 0.3 Auto
{The speed with wich to reach the max blend}
Float Property CooldownBlendRate = 0.03 Auto
{The speed with which to reach the min blend}

Int Property CooldownCount = 0 Auto
{Current count of the cooldown after hit behind blending down}
Int Property CooldownCountMax = 2 Auto
{Max coundown before blending down after hit}

;fToggleBlend
; 0 is fully transparent, 1 is full opaque

;fDampRate
; Speed that fToggleBlend takes to reach it's setting.

Event OnUpdate()

	;Keep counting since i've been hit, and once finished set CountDownCount to 0 and blend shield down
	While(CoolDownCount < CoolDownCountMax)
		CoolDownCount += 1
		Wait(0.10)
		Trace("While Loop Count is " + CoolDownCount + " of " + CoolDownCountMax)
	EndWhile
	Trace("While Loop Finished!")
	CoolDownCount = 0
	GoToState("WaitingForHit")

	Self.SetAnimationVariableFloat("fDampRate", CoolDownBlendRate)
	Self.SetAnimationVariableFloat("fToggleBlend", 0.0)

EndEvent



auto STATE WaitingForHit
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

		; OnHit() Go to CurrentlyHit state and if CoolDownCount is 0 then ramp up the shield and RegisterForSingleUpdate()
		GoToState("CurrentlyHit")

			if CoolDownCount == 0
				Trace("Not Currently 'HIT', Registering for update.")
				Self.SetAnimationVariableFloat("fDampRate", HitBlendRate)
				Self.SetAnimationVariableFloat("fToggleBlend", MaxBlend)
				RegisterForSingleUpdate(0)

			endif

	EndEvent

EndSTATE



STATE CurrentlyHit

	; If OnHit() while in CurrentlyHit state then just set CoolDownCount to 0 so the While() in above OnUpdate() keeps running (and the shield stays up)
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		CoolDownCount = 0
	EndEvent
EndSTATE