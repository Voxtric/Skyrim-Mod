Scriptname DLC2dunKarstaagTriggerEjectScript extends ActiveMagicEffect

Quest property DLC2dunKarstaagQST Auto

Event OnEffectStart(Actor Target, Actor Caster)
; 	Debug.Trace("Hit!: " + Target + ", " + Caster)
	;(DLC2dunKarstaagQST as DLC2dunKarstaagScript).Eject(Target, Caster)
EndEvent