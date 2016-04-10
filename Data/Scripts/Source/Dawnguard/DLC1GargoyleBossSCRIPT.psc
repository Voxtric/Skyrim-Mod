Scriptname DLC1GargoyleBossSCRIPT extends Actor  
{Makes the stone skin gameplay}
EffectShader Property DLC1GargoyleStoneChipsFXS Auto
int crackStage = 0

Auto State Waiting
	EVENT OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		GoToState("GetStoned")
	ENDEVENT
endState

State GetStoned
	EVENT OnBeginState()
		self.SetSubGraphFloatVariable("fdampRate", 0.08)
		self.SetSubGraphFloatVariable("ftoggleBlend", 1.0)
		;self.setGhost()
		;utility.wait(5.0)
		;self.SetSubGraphFloatVariable("ftoggleBlend", 0.0)
		;self.setGhost(false)
		GoToState("Stoned")
	ENDEVENT	
endState

State Stoned
	EVENT OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;debug.trace("you can hit me while ghosted")
		if crackStage == 0
				crackStage = 1
		endif
		GoToState("GetCracked")
	endevent
endState

State GetCracked
	EVENT OnBeginState()
	if crackStage ==1
			DLC1GargoyleStoneChipsFXS.play(self, 0.1)
			self.SetSubGraphFloatVariable("fdampRate", 0.065)
			self.SetSubGraphFloatVariable("ftoggleBlend", 0.7)
			crackStage = 2
			GoToState("Stoned")			
		elseif 	crackStage == 2	
			DLC1GargoyleStoneChipsFXS.play(self, 0.1)
			self.SetSubGraphFloatVariable("ftoggleBlend", 0.55)
			crackStage = 3
			GoToState("Stoned")	
		elseif 	crackStage == 3	
			DLC1GargoyleStoneChipsFXS.play(self, 0.1)
			self.SetSubGraphFloatVariable("ftoggleBlend", 0.45)
			crackStage = 4
			GoToState("Stoned")
		elseif 	crackStage == 4
			DLC1GargoyleStoneChipsFXS.play(self, 0.4)
			self.SetSubGraphFloatVariable("fdampRate", 0.05)
			self.SetSubGraphFloatVariable("ftoggleBlend", 0.0)
			crackStage = 0
			GoToState("Damageable")
		endif
	ENDEVENT	
endState

State Damageable
	EVENT OnBeginState()
		utility.wait(5.0)
		GoToState("ReadyToGetStoned")
	ENDEVENT
endState

State ReadyToGetStoned
	EVENT OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		GoToState("GetStoned")
	ENDEVENT
endState

