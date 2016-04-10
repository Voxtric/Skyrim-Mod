Scriptname DLC2VoiceFireBreathScript extends ActiveMagicEffect  

GlobalVariable Property DLC2BlackBookReward3  Auto  
ActorBase Property Wyrm  Auto  

bool AllGood
actor SpellTarget

Event OnEffectStart(actor akTarget, actor akCaster)
	if DLC2BlackBookReward3.GetValue() == 2 && akCaster == game.GetPlayer()
		SpellTarget = akTarget
		AllGood = true
; 		debug.Trace("FIRE BREATH: Set flag")
	endif
EndEvent

Event OnDying(actor akKiller)
; 	debug.Trace("FIRE BREATH: dying...")
	if AllGood
		SpellTarget.PlaceActorAtMe(Wyrm)
; 		debug.Trace("FIRE BREATH: attempted to place wyrm")
	endif
endEvent

