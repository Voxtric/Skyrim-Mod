Scriptname DLC1RadiantDisguisedVampireLordScript extends Actor  

dlc1vampireturnscript Property DLC1VampireTurn  Auto  

bool Changed
float distanceToCheck = 300.0

bool registered

int updateTick = 1

int CountTicksWithPlayerNear
int ticksToCountBeforeChange = 3

Topic Property DLC1RadiantDisguisedVampireLordSpawnerTauntTopic auto

Event OnUpdate()
;	Debug.Trace(self + "OnUpdate()")
	if GetDistance(Game.GetPlayer()) <= distanceToCheck
		
		CountTicksWithPlayerNear += 1
		if CountTicksWithPlayerNear >= ticksToCountBeforeChange
			Change()
		endif

		Register()

	else
		CountTicksWithPlayerNear = 0
		Register()
	endif
EndEvent

Event OnLoad()
;	debug.trace(self + "OnLoad()")
	Register()
EndEvent

Event OnCellLoad()
;	debug.trace(self + "OnCellLoad()")
	Register()
EndEvent

Event OnCellAttach()
;	debug.trace(self + "OnCellAttach()")
	Register()
EndEvent

Event OnAttachedToCell()
;	debug.trace(self + "OnAttachedToCell()")
	Register()
EndEvent

Event OnUnload()
;	debug.trace(self + "OnUnload()")
	Register(False)
EndEvent


Event OnCellDetach()
;	debug.trace(self + "OnCellDetach()")
	Register(False)
EndEvent

Event OnDetachedFromCell()
;	debug.trace(self + "OnDetachedFromCell()")
	Register(False)
EndEvent

Event OnDeath(Actor akKiller)
;	debug.trace(self + "OnDeath()")
	Register(False)
EndEvent


Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	Change()
endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Change()
endEvent

Function Register(bool DoRegister = true)
	if DoRegister && registered == false
		Registered = true
	elseif DoRegister == false
		Registered = false
		CountTicksWithPlayerNear = 0
		UnregisterForUpdate()
	endif

	if Registered
		RegisterForSingleUpdate(updateTick)
	endif

;	debug.trace(self + "Register() Regisered: " + registered)
EndFunction

Function Change()
	if Changed == false
;		DLC1VampireTurn.NPCTransformIntoVampireLord(self)
		say(DLC1RadiantDisguisedVampireLordSpawnerTauntTopic)
		setActorValue("aggression", 2)
;		DLC1VampireTurn.NameVampireLord(self)

	endif

	Register(false)
EndFunction

