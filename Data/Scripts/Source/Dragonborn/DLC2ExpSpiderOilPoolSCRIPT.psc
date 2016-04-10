Scriptname DLC2ExpSpiderOilPoolSCRIPT extends ObjectReference Hidden 

Float Property fLifetime Auto

Projectile Property DecalToPlace Auto

ObjectReference Property DecalReference Auto Hidden

Event OnLoad()
	;DecalReference = self.PlaceAtMe(DecalToPlace, 1)
	;utility.Wait(1)
	;DecalReference.Moveto(self)
	utility.Wait(fLifetime)
; 	;debug.Trace("Killing Effect")
	PlayAnimationAndWait("StopEffect", "End")
; 	;debug.Trace("Disabling Cloud")
	self.DisableNoWait()
	self.Delete()
	;DecalReference.DisableNoWait()
	;DecalReference.Delete()
	;DecalReference = NONE
EndEvent

Event OnCellDetach()
	self.DisableNoWait()
	self.Delete()
	;DecalReference.DisableNoWait()
	;DecalReference.Delete()
	;DecalReference = NONE
EndEvent
