Scriptname DLC2BlackBookFireCloakScript extends ActiveMagicEffect  

SPELL Property DLC2BlackBookFireStorm  Auto
actor CloakWearer

Event OnEffectStart(actor akTarget, actor akCaster)
	RegisterForUpdate(1)
	CloakWearer = akTarget
;	debug.trace("BB FIRESTORM: Register set, CloakWearer = " + CloakWearer)
	DLC2BlackBookFireStorm.Cast(game.GetPlayer(), CloakWearer)
EndEvent

Event OnUpdate()
;	debug.trace("BB FIRESTORM: casting spell on " + CloakWearer)
	DLC2BlackBookFireStorm.Cast(game.GetPlayer(), CloakWearer)
EndEvent
