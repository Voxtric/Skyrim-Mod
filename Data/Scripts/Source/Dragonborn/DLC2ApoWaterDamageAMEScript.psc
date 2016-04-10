Scriptname DLC2ApoWaterDamageAMEScript extends ActiveMagicEffect  

Spell Property DLC2abApoWaterDamageActual auto
GlobalVariable property DLC2IsInApocryphaWater auto
Actor property PlayerRef auto hidden
DLC2BookDungeonControllerScript property DLC2BookDungeonController Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForUpdate(1.0)
	PlayerRef = Game.getPlayer()
; 	Debug.Trace(self + ": has started waterDamageActual effect")
	akTarget.addSpell(DLC2abApoWaterDamageActual, false)
endEvent


Event onUpdate()
; 	debug.Trace(self + ": is running onUpdate")
; 	debug.Trace(Self + ": DLC2IsInApocryphaWater = " + DLC2IsInApocryphaWater.getValue())
; 	debug.trace(self + ": DLC2BookDungeonController.bPlayerBleedingOut = " + DLC2BookDungeonController.bPlayerBleedingOut)
	if DLC2BookDungeonController.bPlayerBleedingOut
; 		debug.trace(self + ": bPlayerBleedingOut = true -- DO NOTHING")
		return
	endif
	if DLC2IsInApocryphaWater.getValue() == 1 ;&& !PlayerRef.hasSpell(DLC2abApoWaterDamageActual)
; 		debug.Trace(self + ": Adding Spell in onUpdate")
		PlayerRef.addSpell(DLC2abApoWaterDamageActual, false)
	elseif DLC2IsInApocryphaWater.getValue() != 1
; 		debug.Trace(self + ": Removing Spell in onUpdate")
		PlayerRef.removeSpell(DLC2abApoWaterDamageActual)
	endif
endEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForUpdate()
	PlayerRef.removeSpell(DLC2abApoWaterDamageActual)
; 	Debug.Trace(self + ": has stopped waterDamageActual effect")
endEvent


