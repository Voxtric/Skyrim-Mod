Scriptname dlc2DBDragonsBreathEffectSCRIPT extends ActiveMagicEffect  

ARMOR PROPERTY dragonArms AUTO
EFFECTSHADER PROPERTY dragonArmsFX AUTO
ACTORBASE PROPERTY specDragon AUTO
EXPLOSION PROPERTY dragonExplosion AUTO
BOOL PROPERTY bSPAWNDRAGONS AUTO

BOOL DRAGONSUMMON=false
BOOL FIRSTTIME=false

OBJECTREFERENCE dragonHolder0
OBJECTREFERENCE dragonHolder1
OBJECTREFERENCE dragonHolder2
OBJECTREFERENCE dragonHolder3
OBJECTREFERENCE dragonHolder4
OBJECTREFERENCE dragonHolder5
OBJECTREFERENCE dragonHolder6
OBJECTREFERENCE dragonHolder7

EVENT OnEffectStart(ACTOR target, ACTOR caster)
	
	RegisterForAnimationEvent(caster, "RitualSpellOut")
	RegisterForAnimationEvent(caster, "EnableBumper")
	RegisterForAnimationEvent(caster, "BeginCastLeft")

ENDEVENT

EVENT OnAnimationEvent(ObjectReference akSource, string asEventName)
  
	if(asEventName == "RitualSpellOut")
		game.getPlayer().unEquipItem(dragonArms, TRUE, TRUE)
		dragonArmsFX.Stop(game.getPlayer())
		DRAGONSUMMON = false
		deSpawnDragons()

	elseif(asEventName == "EnableBumper")
		game.getPlayer().unEquipItem(dragonArms, TRUE, TRUE)
		dragonArmsFX.Stop(game.getPlayer())
		DRAGONSUMMON = false
		deSpawnDragons()		

	elseif(asEventName == "BeginCastLeft")
		game.getPlayer().equipItem(dragonArms, false, TRUE)
		dragonArmsFX.Play(game.getPlayer())
		DRAGONSUMMON = true
		
		utility.wait(1)

		if(bSPAWNDRAGONS)
			spawnDragons()
		endif

	endIf

ENDEVENT

FUNCTION spawnDragons()

	dragonHolder0 = game.getPlayer().placeAtMe(specDragon)
	dragonHolder0.placeAtMe(dragonExplosion)

	utility.wait(0.1)

	dragonHolder1 = game.getPlayer().placeAtMe(specDragon)
	dragonHolder1.placeAtMe(dragonExplosion)

	utility.wait(0.1)

	; //if the player has more than 5, spawn another
	if (game.getplayer().GetActorValue("DragonSouls") >= 5)
		dragonHolder2 = game.getPlayer().placeAtMe(specDragon)
		dragonHolder2.placeAtMe(dragonExplosion)
	endif

	utility.wait(0.1)

	; //if the player has more than 10, spawn another
	if (game.getplayer().GetActorValue("DragonSouls") >= 10)
		dragonHolder3 = game.getPlayer().placeAtMe(specDragon)
		dragonHolder3.placeAtMe(dragonExplosion)
	endif

	utility.wait(0.1)

	; //if the player has more than 15, spawn another
	if (game.getplayer().GetActorValue("DragonSouls") >= 15)
		dragonHolder4 = game.getPlayer().placeAtMe(specDragon)
		dragonHolder4.placeAtMe(dragonExplosion)
	endif

	utility.wait(0.1)	

	; //if the player has more than 20, spawn another
	if (game.getplayer().GetActorValue("DragonSouls") >= 20)
		dragonHolder5 = game.getPlayer().placeAtMe(specDragon)
		dragonHolder5.placeAtMe(dragonExplosion)
	endif

	utility.wait(0.1)	

	; //if the player has more than 25, spawn another
	if (game.getplayer().GetActorValue("DragonSouls") >= 25)
		dragonHolder6 = game.getPlayer().placeAtMe(specDragon)
		dragonHolder6.placeAtMe(dragonExplosion)
	endif

	utility.wait(0.1)	

	; //if the player has more than 30, spawn another
	if (game.getplayer().GetActorValue("DragonSouls") >= 30)
		dragonHolder7 = game.getPlayer().placeAtMe(specDragon)
		dragonHolder7.placeAtMe(dragonExplosion)
	endif

ENDFUNCTION

FUNCTION deSpawnDragons()

	dragonHolder0.placeAtMe(dragonExplosion)
	utility.wait(0.05)
	dragonHolder0.disable()
	
	dragonHolder1.placeAtMe(dragonExplosion)
	utility.wait(0.05)
	dragonHolder1.disable()

	dragonHolder2.placeAtMe(dragonExplosion)
	utility.wait(0.05)
	dragonHolder2.disable()
	
	dragonHolder3.placeAtMe(dragonExplosion)
	utility.wait(0.05)
	dragonHolder3.disable()
	
	dragonHolder4.placeAtMe(dragonExplosion)
	utility.wait(0.05)
	dragonHolder4.disable()
	
	dragonHolder5.placeAtMe(dragonExplosion)
	utility.wait(0.05)
	dragonHolder5.disable()
	
	dragonHolder6.placeAtMe(dragonExplosion)
	utility.wait(0.05)
	dragonHolder6.disable()
	
	dragonHolder7.placeAtMe(dragonExplosion)
	utility.wait(0.05)
	dragonHolder7.disable()

ENDFUNCTION