Scriptname DLC2BurntSprigganBleedoutScript extends Actor  

SPELL Property DLC2SprigganBurntFireDeath  Auto

Event OnEnterBleedout()
; 	debug.trace("BURNT SPRIGGAN: entered bleedout")
	DLC2SprigganBurntFireDeath.Cast(Self)
EndEvent