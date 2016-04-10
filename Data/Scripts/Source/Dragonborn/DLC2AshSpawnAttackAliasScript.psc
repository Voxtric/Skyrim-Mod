Scriptname DLC2AshSpawnAttackAliasScript extends ReferenceAlias  
{Script attached to Aliases in DLC2AshSpawnAttack quest}

Event OnDeath(Actor akKiller)
; 	debug.trace(self + "OnDeath()")
	(GetOwningQuest() as DLC2AshSpawnAttackScript).CheckIfOneSideIsDeadAndStopQuest()
EndEvent