scriptName DLC1TrapSpotLight Extends TrapBase
;
;
;
;=========================================

spell property magicWeapon auto hidden
;ammo property magicWeaponAmmo auto
float property initialDelay = 0.5 auto hidden
float property firingRate = 4.5 auto hidden
float property firingRateOverride = 0.0 auto
{Overrides the spedified firing rate if > 0.0
	only used for a few special uses}
float property firingSpinup = 0.5 auto hidden
float property firingTime = 4.5 auto
float property currentTime auto hidden
float property endTime auto hidden
int property castingAim = 0 auto
{use to determin how the aiming type of the magic cast
	0 = straight fire (default)
	1 = fire at linked Ref
	2 = fire at the object that activated my trigger}
objectReference property targetRef auto hidden
bool property forwardFiring = false auto
int property aaSpellToCast = 2 Auto
{The type of spell to cast, the leveled version is resolved internally
	0 = firebolt
	1 = fireball
	2 = flames
	3 = lightning bolt
	4 = chain lightning
	5 = sparks
	6 = ice spike
	7 = frostbite
	8 = ice storm
}
 
import utility
import game
import math

bool finishedFiring = false
bool weaponResolved = false
bool concentrationCastLoop = false

bool property isFiring auto hidden
bool property isLoaded auto hidden



event onLoad()
	if !weaponResolved
		ResolveLeveledWeapon ()
		weaponResolved = True
	endif
	isLoaded = TRUE
	if isFiring == True
		fireTrap()
	endif
EndEvent

event onUnload()
; 	debug.Trace(self + " has recieved onUnload event")
	isLoaded = FALSE
endEvent

Function fireTrap()
	isFiring = True
	int firingSlot
	if !weaponResolved
		ResolveLeveledWeapon()
		weaponResolved = True
	endif
	if trapDisarmed == false
		;playAnimation("alarm")
		;WindupSound.play( self as ObjectReference)		;play windup sound
		wait( initialDelay )		;wait for windup
		;wait(firingSpinup)
		;currentTime = getCurrentRealTime()
		;endTime = currentTime + firingTime
		;wait(firingSpinup)
		resetLimiter()
		playAnimation("On")
		while(finishedFiring == False) && isLoaded == TRUE
			;playAnimation("Trigger")
			
			
			if concentrationCastLoop == false
				magicWeapon.cast(self)		;does the actual casting
				concentrationCastLoop = True
			endif
			finishedFiring = True
			

			;WaitForAnimationEvent("Trans01")
			Wait(7.0)
			if (loop == TRUE)			;Reset Limiter
				resetLimiter()
			endif
			
		endWhile
		playAnimation("Off")
		concentrationCastLoop = false
		;if aaSpellToCast == 2 || aaSpellToCast == 5 || aaSpellToCast == 7
		interruptCast()
		;endif
		
		if isLoaded 	
			isFiring = false
			;playAnimation("idl e")
			goToState("Reset")
		endif
	endif

endFunction

State Reset

	Event OnBeginState()
		;TRACE("State Reset")
		
		GoToState ( "Idle" )
		;TrapHitBase hitBase = (self as objectReference) as TrapHitBase
		;hitBase.goToState("CanHit")
	endEvent
	
	Event OnActivate( objectReference activateRef )
	EndEvent
	
endState

function resetLimiter()
	finishedFiring = False
endFunction


float property horizontalSweepHalf = 90.0 auto
float property verticalSweepHalf = 90.0 auto

bool function refIsValidForwardTarget(objectReference testRef)
; 	debug.Trace(self + " is checking if refIsValidForwardTarget on " + testRef)
	float deltaX = testRef.X - self.X
	float deltaY = testRef.Y - self.Y
	float deltaZ = testRef.Z - self.Z
	
	float fAngleToRef = atan(deltaX/deltaY)
	if (deltaX < 0.0) && (deltaY < 0.0)
		fAngleToRef = fAngleToRef + 180
	endIf
	float deltaAngle = self.getAngleZ()-fAngletoRef
	if (deltaAngle < -180.0)
		deltaAngle = deltaAngle + 360.0
	endIf
	if (deltaAngle > 180.0)
		deltaAngle = deltaAngle - 360.0
	endIf
	
	if Abs(deltaAngle) < horizontalSweepHalf
; 		debug.Trace(self + " is firing at a valid angle at " + testRef)
		return true
	Else
; 		debug.Trace(self + " could not fire at a valid angle at " + testRef)
		return False
	endif
endFunction

;-----------------------------------------------

int property LvlThreshold1 auto
int property LvlThreshold2 auto
int property LvlThreshold3 auto
int property LvlThreshold4 auto
int property LvlThreshold5 auto
spell property DLC1TrapSpotlightSpell01 auto 
spell property DLC1TrapSpotlightSpell02 auto 
spell property DLC1TrapSpotlightSpell03 auto 
spell property DLC1TrapSpotlightSpell04 auto 
spell property DLC1TrapSpotlightSpell05 auto 
spell property DLC1TrapSpotlightSpell06 auto 

bool spellAndCastingTypeResolved = false
Function ResolveLeveledWeapon ()
; 	debug.Trace(self + " trying to ResolveLeveledWeapon")
	if spellAndCastingTypeResolved == false
		ResolveCastingDelay()
		spellAndCastingTypeResolved = True
	endif
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	spell lvlWeapon = DLC1TrapSpotlightSpell01
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		lvlWeapon = DLC1TrapSpotlightSpell02
		;Trace("damage threshold =")
		;Trace("2")
	elseif (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		lvlWeapon = DLC1TrapSpotlightSpell03
		;Trace("damage threshold =")
		;Trace("3")
	elseif (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		lvlWeapon = DLC1TrapSpotlightSpell04
		;Trace("damage threshold =")
		;Trace("4")
	elseif (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		lvlWeapon = DLC1TrapSpotlightSpell05
		;Trace("damage threshold =")
		;Trace("5")
	elseif (damageLevel > LvlThreshold5)
		lvlWeapon = DLC1TrapSpotlightSpell06
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	magicWeapon = lvlWeapon
EndFunction

function ResolveCastingDelay()
; 	debug.Trace(self + " trying to ResolveCastingDelay")
	
	if firingRateOverride > 0.0
		firingRate = firingRateOverride
	endif
endFunction












