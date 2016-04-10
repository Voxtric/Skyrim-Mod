Scriptname DLC2MQ06FightFallingTriggerScript extends ObjectReference  

objectReference property DLC2MiraakMQ06 auto
objectReference property DLC2MQ06FightFallTeleportMarker auto
referenceAlias property Miraak auto
Quest property DLC2MQ06 auto
DLC2MQ06MiraakBossBattle property fightScript auto hidden

event onTriggerEnter(objectReference triggerRef)
	fightScript = Miraak as DLC2MQ06MiraakBossBattle
	if triggerRef == game.getPlayer() && !game.getPlayer().isOnMount() && DLC2MQ06.getStage() < 550
		;game.getPlayer().moveto(DLC2MQ06FightFallTeleportMarker)
		fightScript.TeleportPlayerFromOffCliff()
	elseif triggerRef == DLC2MiraakMQ06
		;DLC2MiraakMQ06.moveto(DLC2MQ06FightFallTeleportMarker)
		fightScript.TeleportMiraakFromOffCliff()
	endif
endEvent