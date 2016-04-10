Scriptname DLC1RV10AliasScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as DLC1RV10Script).CheckDead()
EndEvent

Event OnDying(Actor akKiller)
	(GetOwningQuest() as DLC1RV10Script).CheckDead()
EndEvent