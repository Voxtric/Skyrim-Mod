Scriptname DLC2LevitateScript extends ActiveMagicEffect  

Int Property force  Auto  
ReferenceAlias Property DLC2FlingQuest_FlingRune  Auto  

Event OnEffectStart(Actor Target, Actor Caster)
	ObjectReference FlingRef = DLC2FlingQuest_FlingRune.GetRef()
	if FlingRef != none
; 		Debug.Trace("FLING: Have alias")
		FlingRef.PushActorAway(Caster, Force)
	endif
EndEvent
