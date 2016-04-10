Scriptname dlc2DBConjureAncientsSCRIPT extends ActiveMagicEffect  

ACTORBASE PROPERTY ancientGuy AUTO
EXPLOSION PROPERTY ancientExplosion AUTO

OBJECTREFERENCE guy1
OBJECTREFERENCE guy2
OBJECTREFERENCE guy3
OBJECTREFERENCE guy4
OBJECTREFERENCE guy5

EVENT OnEffectStart(ACTOR target, ACTOR caster)
	
	RegisterForAnimationEvent(caster, "RitualSpellOut")

ENDEVENT

EVENT OnAnimationEvent(ObjectReference akSource, string asEventName)
  
	if(asEventName == "RitualSpellOut")
		
		guy1 = game.getPlayer().placeAtMe(ancientGuy)
		guy1.placeAtMe(ancientExplosion)

		utility.wait(0.1)

		; //if player has more than 5 souls summon another one
		if (game.getplayer().GetActorValue("DragonSouls") >= 5)
			guy2 = game.getPlayer().placeAtMe(ancientGuy)
			guy2.placeAtMe(ancientExplosion)
		endif	

		utility.wait(0.1)		

		; //if player has more than 10 souls summon another one
		if (game.getplayer().GetActorValue("DragonSouls") >= 10)
			guy3 = game.getPlayer().placeAtMe(ancientGuy)
			guy3.placeAtMe(ancientExplosion)
		endif

		utility.wait(0.1)		

		; //if player has more than 15 souls summon another one
		if (game.getplayer().GetActorValue("DragonSouls") >= 15)
			guy4 = game.getPlayer().placeAtMe(ancientGuy)
			guy4.placeAtMe(ancientExplosion)
		endif

		utility.wait(0.1)		

		; //if player has more than 20 souls summon another one
		if (game.getplayer().GetActorValue("DragonSouls") >= 20)
			guy5 = game.getPlayer().placeAtMe(ancientGuy)
			guy5.placeAtMe(ancientExplosion)
		endif		

	endIf

ENDEVENT