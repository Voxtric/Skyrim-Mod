Scriptname DLC2DragonbornAspectArtSCRIPT extends ActiveMagicEffect  
{Adds the art for the dragonborn shout}

Armor Property DLC2DragonbornAspectArmor01 Auto
actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		selfRef.EquipItem(DLC2DragonbornAspectArmor01, false, true)
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		selfRef.unEquipItem(DLC2DragonbornAspectArmor01, false, true)
	endEvent
	
	