Scriptname DLC2RieklingBarrelScript extends ObjectReference  
{This script lives on the barrel used by the riekling ambush and handles its effects.}

bool init = False
explosion property FallingDustExplosion01 auto	
float property rumbleAmount1 = 0.2 Auto
float property rumbleDuration = 0.7 Auto
float property cameraShakeAmount1 = 0.2 Auto
Keyword property myLink Auto


Event OnReset()
	Self.ClearDestruction()
	Self.SetDestroyed(False)
	Self.MoveToMyEditorLocation()
EndEvent

Event OnActivate(ObjectReference activateRef)
	if !self.isDisabled()
		TriggerExplosion(activateRef)
	endif
EndEvent

;/
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if !self.isDisabled()
		self.Activate(self)
		TriggerExplosion(akAggressor)
	endif
endEvent
/;

Function TriggerExplosion(objectReference explosionCauseRef)
	objectReference objSelf = self as ObjectReference
	Game.ShakeController(rumbleAmount1, rumbleAmount1, rumbleDuration)
	Game.ShakeCamera(none, cameraShakeAmount1, rumbleDuration)
	If (FallingDustExplosion01 != None)
		Self.placeAtMe(FallingDustExplosion01)
	Endif
	Self.DamageObject(5)
	if (Self.GetLinkedRef(myLink) != None)
		Self.GetLinkedRef(myLink).Activate(objSelf)
	EndIf
endFunction
