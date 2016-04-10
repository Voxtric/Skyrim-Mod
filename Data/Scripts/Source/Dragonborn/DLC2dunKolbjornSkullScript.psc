ScriptName DLC2dunKolbjornSkullScript extends ObjectReference

Quest property DLC2dunKolbjornQST Auto
ObjectReference property Pedestal Auto

Event OnHit(ObjectReference var1, Form var2, Projectile var3, bool var4, bool var5, bool var6, bool var7)
; 	;Debug.Trace("Hit event registered.")
	RegisterForSingleUpdate(1)
EndEvent

Event OnUpdate()
	if (!DLC2dunKolbjornQST.GetStageDone(140))
; 		;Debug.Trace("Ping")
		(Pedestal as PressureReleasePlate).OnCellAttach()
		RegisterForSingleUpdate(1)
	EndIf
EndEvent