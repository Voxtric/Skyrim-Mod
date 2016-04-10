Scriptname DLC01SoulCairnSkullPuzzleScript extends ObjectReference  

bool bRotating
int bDir = 1

float fmov = 5.0
float frot = 5.0

EVENT onLoad()
	blockActivation()
	setMotionType(Motion_Keyframed, TRUE)
	translateTo(self.x,self.y,self.z+1,self.getAngleX(),self.getAngleY(),self.getAngleZ()+180,fmov,frot)
	bRotating = TRUE
endEVENT

EVENT onHit(objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if bRotating
		stopTranslation()
		bRotating = FALSE
	else
		flipPolarity()
		translateTo(self.x,self.y,(self.z+(bDir*1)),self.getAngleX(),self.getAngleY(),self.getAngleZ()+180,fmov,0)
		bRotating= TRUE
	endif
endEVENT

EVENT onActivate(objectReference actronaut)
	if bRotating
		stopTranslation()
		bRotating = FALSE
	else
		flipPolarity()
		translateTo(self.x,self.y,(self.z+(bDir*1)),self.getAngleX(),self.getAngleY()+180,self.getAngleZ()+180,fmov,0)
		bRotating= TRUE
	endif	
endEVENT

EVENT OnTranslationComplete()
	if bRotating
		flipPolarity()
		translateTo(self.x,self.y,(self.z+(bDir*1)),self.getAngleX(),self.getAngleY()+180,self.getAngleZ()+180,fmov,frot)
	endif	
endEVENT

FUNCTION flipPolarity()
	if bDir == 1
		bDir = -1
	else
		bDir = 1
	endif
endFUNCTIon
