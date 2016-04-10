Scriptname DLC2WE09ActorScript extends ReferenceAlias  
{Script on DLC2WE09 actor aliases (cultists)}

Quest Property DLC2MQ01  Auto  

function setSearchObjective()
	if DLC2MQ01.GetStage() < 10
		GetOwningQuest().setStage(10) ;turns on the "Search the Cultist" objective
	endif
endfunction

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if akAggressor == Game.GetPlayer()
		setSearchObjective()
	endif
EndEvent

Event OnDeath(Actor akKiller)
	if GetReference().GetDistance(Game.GetPlayer()) < 1000
		setSearchObjective()
	endif
EndEvent