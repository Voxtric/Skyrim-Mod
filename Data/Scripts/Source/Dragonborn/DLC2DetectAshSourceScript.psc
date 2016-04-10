Scriptname DLC2DetectAshSourceScript extends ActiveMagicEffect  

SPELL Property DLC2DetectAshSourceSpell  Auto  
Quest Property DLC2TT2  Auto  
WorldSpace Property DLC2SolstheimWorld  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
; 	Debug.Trace("DETECT ASH SOURCE: effect started")
	RegisterForSingleUpdate(5)
EndEvent

Event OnUpdate()
; 	Debug.Trace("DETECT ASH SOURCE: Update")
	if Game.GetPlayer().GetWorldSpace() == DLC2SolstheimWorld
; 		Debug.Trace("DETECT ASH SOURCE: spell cast")
		DLC2DetectAshSourceSpell.Cast(Game.GetPlayer(), none)
;		Utility.Wait(1)
	endIf
	if DLC2TT2.GetStage() < 200
; 		Debug.Trace("DETECT ASH SOURCE: Register for new update")
		RegisterForSingleUpdate(5)	
	endIf
EndEvent
