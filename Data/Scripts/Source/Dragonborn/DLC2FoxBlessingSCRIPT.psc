Scriptname DLC2FoxBlessingSCRIPT extends ActiveMagicEffect  

SPELL PROPERTY invisSpell AUTO
PACKAGE PROPERTY searchPackage AUTO

EVENT onEffectStart(ACTOR akTarget, ACTOR akCaster)
	
	; //make the player invisible for 30 seconds
	invisSpell.cast(game.getPlayer(), game.getPlayer())

	; //stop combat on the target
	akTarget.stopCombat()
	akTarget.stopCombatAlarm()

	utility.wait(0.5)

	if(!Game.getPlayer().IsSneaking())
		Game.GetPlayer().StartSneaking()
	endif

ENDEVENT