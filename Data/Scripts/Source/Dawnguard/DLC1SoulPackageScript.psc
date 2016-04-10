Scriptname DLC1SoulPackageScript extends Actor  
import Debug
import Utility


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	;Notification("Evaluate Package")
	self.evaluatePackage()
EndEvent

