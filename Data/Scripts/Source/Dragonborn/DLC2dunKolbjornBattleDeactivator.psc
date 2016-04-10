Scriptname DLC2dunKolbjornBattleDeactivator extends ObjectReference
{Script to disable the boss battle's progressive combat on activation.}

Event OnActivate(ObjectReference akActivator)
; 	Debug.Trace("Progressive combat isActive was =" + (Self.GetLinkedRef() as dunProgressiveCombatScript).isActive + ", now deactivating.")
	(Self.GetLinkedRef() as dunProgressiveCombatScript).isActive = False
EndEvent