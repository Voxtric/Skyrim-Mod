scriptName DLC1GargoyleAmbushScript extends Actor
{This script lives on the ambush gargoyle base object and supplements the functionality of masterAmbushScript.}

Explosion Property DLC1SGargoyleHavokExplosion Auto
Faction Property dunPrisonerFaction auto


;;;;;;;;;;;;;;;;

import game
import debug

string property sActorVariable = "Variable01"  auto hidden
{By default, this property is set to Variable01.}

float property fActorVariable = 1.0 auto hidden
{By default this property is set to 1.} 

float property fActorVariableOnReset = 0.0 auto hidden

float property fAggression = 2.0 auto hidden
{
By default this property is set to 2 (very aggressive).
0 - Unaggressive - will not initiate combat
1 - Aggressive - will attack enemies on sight
2 - Very Aggressive - Will attack enemies and neutrals on sight
3 - Frenzied - Will attack anyone else
}

float property fAggressionOnReset = 0.0 auto hidden

keyword property linkKeyword auto
{if this has a linkedRef with this keyword, we will activate it once when hit, activated, or on combat begin}

;**********************************************

Event onReset()
	;messagebox ("in reset")
	self.AddToFaction(dunPrisonerFaction)
	self.setAV(sActorVariable, fACtorVariableonReset)
	self.setAv("Aggression", fAggressionOnReset)
	self.evaluatePackage()
	SetNoFavorAllowed(true)
	SetGhost(True)
	SetSubGraphFloatVariable("fdampRate", 0.1)
	SetSubGraphFloatVariable("ftoggleBlend", 1.0)
endEvent

;**********************************************

auto State waiting
	;The actor can exit the furniture in multiple ways.  We need to listen for all of these
	;events and if any are called, then go to All Done state, since we don't need to listen
	;for any other events because any of the events will get the actor out of the furniture.
	
	;set visibility, add to prisoner faction, block favor activation, ghost actor
	Event OnCellAttach()
		self.AddToFaction(dunPrisonerFaction)
		self.setAV(sActorVariable, fACtorVariableonReset)
		self.setAv("Aggression", fAggressionOnReset)
		self.evaluatePackage()
		SetNoFavorAllowed(true)
		SetGhost(True)
		SetSubGraphFloatVariable("fdampRate", 0.1)
		SetSubGraphFloatVariable("ftoggleBlend", 1.0)		
	EndEvent
	
	;Handle Activation
	Event onActivate(ObjectReference triggerRef)
		trace(self + ": has been activated by " + triggerRef)
		if !(triggerRef as Actor)
			;player has activated draugr, so leave state
			gotoState("allDone")
		endif
	endEvent
	
	;Handle onHit
;	Event onHit(objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;trace("in onhit")
;		gotoState("allDone")
;	endEvent
	
	;Handle other cases that cause them to come out of furniture
	
	;Using onGetUp as a safety net
	Event onGetUp(ObjectReference myFurniture)
		Cell parentCell = GetParentCell()
		;trace("in getup")
		if (parentCell && parentCell.IsAttached() && (is3DLoaded()))
			gotoState("allDone")
		endif
	endEvent
	
	Event OnCombatStateChanged(Actor actorRef,int aeCombatState)
		;trace("in combatstatechanged")
		if (aeCombatState != 0) ; 0 = not in combat, so non-0 means we entered combat
			gotoState("allDone")
		endIf
	endEvent
	
	;if any of the events above are caught, we leave this state, but first we need to take care
	;of setting up everything we need when we get out of our furniture.
	Event onEndState()
		;trace("in end state")
		;Unghost, ramp visibility on graph, place explosion, remove from prisonerfaction, allow favor
		self.placeAtMe(DLC1SGargoyleHavokExplosion)
		if (Self.IsDead())
			Self.Disable()
		Else
			SetSubGraphFloatVariable("fdampRate", 0.1)
			SetSubGraphFloatVariable("ftoggleBlend", 0.0)
		EndIf
		SetGhost(False)
		self.RemoveFromFaction(dunPrisonerFaction)
		SetNoFavorAllowed(False)
		
		;set actor variables
		self.setAV(sActorVariable, fACtorVariable)
		self.setAV("Aggression", fAggression)
		self.evaluatePackage()
		
		;handle things like sarcophagus lids that are the linkedRef of the furniture
		if(getLinkedRef())
			getLinkedRef().activate(self)
		endif
		
		if(getNthLinkedRef(1))
			getNthLinkedRef(1).activate(self)
		endif
		
		if(getNthLinkedRef(2))
			getNthLinkedRef(2).activate(self)
		endif	
		
		;check to see if actor has a linkedRef with this keyword, if so, then activate it
		if (GetLinkedRef(linkKeyword) as objectReference)
			(getLinkedRef(linkKeyword) as objectReference).activate(self)
		endif
	endEvent
endState

;**********************************************

State allDone
	;do nothing
endState
	
;**********************************************