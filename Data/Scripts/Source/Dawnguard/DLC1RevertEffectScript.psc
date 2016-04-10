Scriptname DLC1RevertEffectScript extends ActiveMagicEffect  

GLOBALVARIABLE PROPERTY pDLC1nVampireNecklaceBats Auto
GLOBALVARIABLE PROPERTY pDLC1nVampireNecklaceGargoyle Auto
GLOBALVARIABLE PROPERTY pDLC1nVampireRingBeast Auto
GLOBALVARIABLE PROPERTY pDLC1nVampireRingErudite Auto

Event OnMagicEffectStart()
	Game.GetPlayer().RemoveSpell(DLC1RevertForm)
	
	;turn off all the vampire necklace/ring variables when we change back
    pDLC1nVampireNecklaceBats.setValue(0)
	pDLC1nVampireNecklaceGargoyle.setValue(0)
	pDLC1nVampireRingBeast.setValue(0)
	pDLC1nVampireRingErudite.setValue(0)

	If !Game.GetPlayer().IsInKillMove()
		DLC1PlayerVampireQuest.Revert()
	endif
EndEvent


SPELL Property DLC1RevertForm  Auto  

DLC1PlayerVampireChangeScript property DLC1PlayerVampireQuest Auto