scriptName DLC1TrapInfectedBones extends TrapTriggerBase
;
;
;
;================================================================

weapon property triggerEffect auto
ammo property triggerEffectAmmo auto
explosion property havokNudge auto
import game
import utility

bool property canDisease auto
{this property says whether this can apply diseases on hit
	diseaseChance determines the odds if this is true
	default = false}
	
bool property canVamp auto
{this property says whether this can infect with vampirism
	this is dependant on canDisease
	default = false}

float property diseaseChance = 40.0 auto
{if canDisease is true, this determines the chance of a disease being applied
	default = 40.0%}
	
float property vampChance = 10.0 auto
{if canDisease & can Vamp are both true,
	this determines the chance of a vampirism being applied
	default = 10.0%}
	
spell property TrapDiseaseAtaxia auto
spell property TrapDiseaseBoneBreakFever auto
spell property TrapDiseaseBrainRot auto
spell property TrapDiseaseRattles auto
spell property TrapDiseaseRockjoint auto
spell property TrapDiseaseWitbane auto
spell property TrapDiseaseSanguinareVampiris auto


ObjectReference akTarget
float property afXVel = 0.0 auto hidden
float property afYVel = 0.0 auto hidden
float property afZVel = 0.0 auto hidden
float property afXPos auto hidden
float property afYPos auto hidden
float property afZPos auto hidden
float property trapPushBack = 0.0 auto
float property damage auto hidden
int property aeMaterial = 0 auto hidden
float property staggerAmount = 0.0 auto
int Property TrapLevel = 1 auto
{Used to determine the difficulty of the trap, currently only tied to damage
	0 = Easy
	1 = Medium (DEFAULT)
	2 = Hard
	3 = VeryHard}


State Active
	Event onBeginState()
		;goToState("DoNothing")
; 		;debug.Trace("Sound trap has fired")
		SetMotionType(1)
		objectReference selfRef = self
		;goToState( "DoNothing" )
		if triggerEffect
			triggerEffect.fire(selfRef, triggerEffectAmmo)
		endIf
		activate(self as objectReference)
		if triggerSound
			TriggerSound.play( self as ObjectReference)
		endIf
		if havokNudge
			self.placeAtMe(havokNudge)
		endIf
		
		actor myTarget
		if (lastTriggerRef as actor)
			myTarget = (lastTriggerRef as actor)
			afXPos = myTarget.getPositionX()
			afYPos = myTarget.getPositionX()
			afZPos = myTarget.getPositionX()
		endif
		
		myTarget.ProcessTrapHit(self, damage, trapPushBack, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, staggerAmount)
		
		ProcessInfection(myTarget)
		
		
		CreateDetectionEvent(lastTriggerRef as actor, soundLevel) ; creates a detection event, 3 = generic event
		ApplyHavokImpulse(0.0, 0.0, -1.0, 15.0)
		playAnimation( "trigger01" )
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )
		if acceptableTrigger(triggerRef)
; 			debug.Trace(self + " has been entered by " + triggerRef)
			objectsInTrigger = self.GetTriggerObjectCount()
		endif
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )      
		if acceptableTrigger(triggerRef)
; 			debug.Trace(self + " has been exited by " + triggerRef)
			objectsInTrigger = self.GetTriggerObjectCount()
			if objectsInTrigger == 0
				goToState ("Inactive")
			endif
		endif
	endEvent
endState

State DoNothing			;Dummy state, don't do anything if animating
	event OnTriggerEnter( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )	
	endEvent
	
	event onCellAttach()
	endEvent
EndState

Event OnCellAttach()
	SetMotionType(4)
	ResolveLeveledDamage()
EndEvent

Event OnCellDetach()
EndEvent

event onReset()
	self.reset()
	goToState("Inactive")
endEvent


Function ProcessInfection (actor myTarget)
	if canDisease && myTarget
		if randomFloat(0.0, 100.0) <= diseaseChance
			int diseasePick
			
			if canVamp
				diseasePick = randomInt(1,7)
			else
				diseasePick = randomInt(1,6)
			endif
			
			if diseasePick == 1
				myTarget.DoCombatSpellApply(TrapDiseaseAtaxia, myTarget)
			elseif diseasePick == 2
				myTarget.DoCombatSpellApply(TrapDiseaseBoneBreakFever, myTarget)
			elseif diseasePick == 3
				myTarget.DoCombatSpellApply(TrapDiseaseBrainRot, myTarget)
			elseif diseasePick == 4
				myTarget.DoCombatSpellApply(TrapDiseaseRattles, myTarget)
			elseif diseasePick == 5
				myTarget.DoCombatSpellApply(TrapDiseaseRockjoint, myTarget)
			elseif diseasePick == 6
				myTarget.DoCombatSpellApply(TrapDiseaseWitbane, myTarget)
			elseif diseasePick >= 7
				if randomFloat(0.0, 100.0) <= vampChance
					myTarget.DoCombatSpellApply(TrapDiseaseSanguinareVampiris, myTarget)
				endif
			endif
		endif
	endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int property LvlThreshold1 auto
int property LvlDamage1 auto
int property LvlThreshold2 auto
int property LvlDamage2 auto
int property LvlThreshold3 auto
int property LvlDamage3 auto
int property LvlThreshold4 auto
int property LvlDamage4 auto
int property LvlThreshold5 auto
int property LvlDamage5 auto
int property LvlDamage6 auto

;int Function ResolveLeveledDamage (int damage)
Function ResolveLeveledDamage()
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	damage = LvlDamage1
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		damage = LvlDamage2
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		damage = LvlDamage3
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		damage = LvlDamage4
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		damage = LvlDamage5
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		damage = LvlDamage6
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	;Trace("damage =")
	;Trace(damage)
	
EndFunction
