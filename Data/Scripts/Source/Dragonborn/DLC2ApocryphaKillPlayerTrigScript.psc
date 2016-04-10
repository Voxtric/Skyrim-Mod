Scriptname DLC2ApocryphaKillPlayerTrigScript extends ObjectReference  

Explosion Property DLC2MQ06MiraakTeleportExplosion auto

event OnTriggerEnter(objectReference TriggerRef)
	if TriggerRef == game.GetPlayer() && !game.getPlayer().isOnMount()
		game.GetPlayer().PlaceatMe(DLC2MQ06MiraakTeleportExplosion)
		game.GetPlayer().Kill(game.GetPlayer())
	endif
endEvent