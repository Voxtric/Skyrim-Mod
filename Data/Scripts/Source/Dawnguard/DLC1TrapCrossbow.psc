scriptName DLC1TrapCrossbow extends TrapBase
;
;Dart Trap extending TrapBase
;integrated with the TrapTriggerBase
;
;================================================================

import debug	
import utility
import custom

int property shotCount = 3 auto
{This property track the ammo that the ballista has, and starts with}
;int numShots = 20			;might want to make this a property
float fireRate = 0.1
float property initialDelay = 0.0 auto
bool property fireAllShots = True auto
{if this is true all three shots will be fired at once}

bool property isFiring auto hidden
bool property isLoaded auto hidden
bool property shotFired = false auto hidden
bool property weaponResolved = false auto hidden
message property DLC1TrapCrossbowNeededMessage auto
weapon property crossbow auto
{weapon to be looted/Placed}
ammo property bolt auto
{ammo to be looted/Placed}
int property messageReturn auto hidden
bool property startDisarmed = false auto
{If this is true, the trap will appear without a crossbow when the cell is loaded
	Default = false}
bool property hasLoadedOnce = false auto hidden
{This is used to tell if the object has loaded once, used in determining starting state"}

Function initialize()
	
endFunction


Function ResetLimiter()
	shotFired = false		;shotCount is scoped outside of the OnActivate blocks. This will reset scopecount to 0, extending the firing time.
EndFunction


Function fireTrap()
	if lastActivateRef == game.getPlayer()
		debug.Trace(self + "Has been activated by the Player directly")
		;trapDisarmed == false
		playerActivated()
		;goToState("disarmed")
		return
	endif
	if !TrapDisarmed
		isFiring = True
		objectReference TrapSelf = self as objectReference
		if !weaponResolved
			ResolveLeveledWeapon()
		endif
		while !weaponResolved		;Do not fire till weapon is resolved
		endWhile
		;TRACE("fireTrap called")
		WindupSound.play( self as ObjectReference)		;play windup sound
		wait( initialDelay )		;wait for windup
		; if (fireOnlyOnce == True)	;If this can be fired only once then disarm
			; trapDisarmed = True
		; endif
		
		while(shotcount > 0) && !shotfired && isLoaded
			playAnimation("Trigger")		;fire anim 01
			TrapCrossbowWeapon.fire( TrapSelf, TrapCrossbowAmmo )	;fire 01
			shotcount -= 1
			WaitForAnimationEvent("Trans02")
			;playAnimationAndWait("Reset","Trans01")			;reset anim 01
			
			shotFired = True	
			if (loop == TRUE)			;Reset Limiter
				resetLimiter()
			endif			
		endWhile
		
		if isLoaded 	
			isFiring = false
			;playAnimation("idle")
			goToState("Idle")
		endif
		
	endif
	
endFunction

State Reset

	Event OnBeginState()
		;TRACE("State Reset")
		;if shotcount <= 0
		shotCount = 1
		GoToState ( "Idle" )
		playAnimationAndWait("Reset","Trans01")
		;Else
		;	TrapDisarmed = True
		;	GoToState ("Disabled")
		;endif
		
	endEvent
	
	Event OnActivate( objectReference activateRef )
	;TRACE("Reset trigger")
	EndEvent
	
endState


;The following function deals with the player activating the trap directly to arm/disarm it
Function playerActivated()
	if shotCount <= 0							;activated while crossbow is placed but empty
			game.getPlayer().AddItem(Crossbow, 1)
			goToState("Disarmed")
	else											;activated while crossbow is placed and full
			game.getPlayer().AddItem(Crossbow, 1)
			game.getPlayer().AddItem(Bolt, 1)
			goToState("Disarmed")
	endif
endFunction


;disarmed state for when the mount has had the crossbow removed or when it starts empty
state Disarmed
	event OnBeginState()
		playAnimation("Disarmed")
		playAnimation("Take")
	endEvent
	
	;Activated by player while disarmed
	event onActivate(objectReference activateRef)
		;If the player has a bolt and a crossbow, let them rearm it
		if activateRef.getItemCount(Crossbow) >= 1 && activateRef.getItemCount(Bolt) >= 1
			game.getPlayer().RemoveItem(Crossbow, 1)
			game.getPlayer().RemoveItem(Bolt, 1)
			playAnimation("Replace")
			goToState("Reset")
		;Otherwise, pop a message
		else
			DLC1TrapCrossbowNeededMessage.show()
		endif
	endEvent
endState

event onCellAttach()
	isLoaded = TRUE
	if isFiring == True
		fireTrap()
	endif
	
	if hasLoadedOnce == false
		hasLoadedOnce = True
		if startDisarmed
			goToState("Disarmed")
		endif
	endif
EndEvent

event onCellDetach()
; 	debug.Trace(self + " has recieved onUnload event")
	isLoaded = FALSE
endEvent

;-----------------------------------------------

int property LvlThreshold1 auto
int property LvlThreshold2 auto
int property LvlThreshold3 auto
int property LvlThreshold4 auto
int property LvlThreshold5 auto
ammo property TrapCrossbowAmmo auto
weapon property TrapCrossbowWeapon auto hidden
weapon property DLC1TrapCrossbowWeapon01 auto
weapon property DLC1TrapCrossbowWeapon02 auto
weapon property DLC1TrapCrossbowWeapon03 auto
weapon property DLC1TrapCrossbowWeapon04 auto
weapon property DLC1TrapCrossbowWeapon05 auto
weapon property DLC1TrapCrossbowWeapon06 auto

Function ResolveLeveledWeapon ()
	;Trace("ResolveLeveledWeapon")
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	; weapon lvlWeaponM = LvlWeaponM1
	; weapon lvlWeaponL = LvlWeaponL1
	; weapon lvlWeaponR = LvlWeaponR1
	Weapon LvlWeapon = DLC1TrapCrossbowWeapon01
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		; lvlWeaponM = LvlWeaponM2
		; lvlWeaponL = LvlWeaponL2
		; lvlWeaponR = LvlWeaponR2
		LvlWeapon = DLC1TrapCrossbowWeapon02
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		;lvlWeaponM = LvlWeapon3
		LvlWeapon = DLC1TrapCrossbowWeapon03
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		;lvlWeaponM = LvlWeapon4
		LvlWeapon = DLC1TrapCrossbowWeapon04
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		;lvlWeaponM = LvlWeapon5
		LvlWeapon = DLC1TrapCrossbowWeapon05
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		;lvlWeaponM = LvlWeapon6
		LvlWeapon = DLC1TrapCrossbowWeapon06
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	; ballistaWeaponM = lvlWeaponM
	; ballistaWeaponL = lvlWeaponL
	; ballistaWeaponR = lvlWeaponR
	TrapCrossbowWeapon = LvlWeapon
	weaponResolved = True
EndFunction



