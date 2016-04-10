Scriptname DLC2BloodskalBonusDamageVsZahkriisos extends ActiveMagicEffect  

Actor Property DLC2RR03ApocryphaPriestRef auto
int bonusDamage

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == DLC2RR03ApocryphaPriestRef
		pickDamageBonus()
		akTarget.DamageAV("Health", bonusDamage)
	endif
endEvent

Function pickDamageBonus()
	int playerLevel = game.getPlayer().getLevel()
	if playerLevel  <50
		bonusDamage = 30
	elseif playerLevel  >= 30 && playerLevel  <50
		bonusDamage = 50
	elseif playerLevel  >= 50 && playerLevel  <70
		bonusDamage = 50
	else
		bonusDamage = 50
	endif
endFunction
