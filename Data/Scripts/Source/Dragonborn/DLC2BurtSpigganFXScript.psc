Scriptname DLC2BurtSpigganFXScript extends Actor


VisualEffect Property DLC2BurntSprigganParticlesE Auto
float Property baseGlow = 0.25 Auto

auto  state alive
	Event onLoad()
		RegisterForAnimationEvent(self, "MLh_SpellFire_Event")
		if (self.GetSleepState() == 3);hide glow for ambush
		   self.SetSubGraphFloatVariable("ftoggleblend", 0.0)
		else ;no ambush
			DLC2BurntSprigganParticlesE.play(self, -1)
			self.SetSubGraphFloatVariable("ftoggleblend", baseGlow)
		endif
	Endevent
	 
	Event OnGetUp(ObjectReference akFurniture);ambush wake up
		DLC2BurntSprigganParticlesE.play(self, -1)
		self.SetSubGraphFloatVariable("ftoggleblend", baseGlow)
	EndEvent
		
	  
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
		self.SetSubGraphFloatVariable("fDampRate", 0.6)
		self.SetSubGraphFloatVariable("ftoggleblend", 1.0)
		utility.wait(0.25)
		self.SetSubGraphFloatVariable("fDampRate", 0.05)
		self.SetSubGraphFloatVariable("ftoggleblend", baseGlow)
	EndEvent
	  
	  

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if (akSource == self) && (asEventName == "MLh_SpellFire_Event")
			self.SetSubGraphFloatVariable("fDampRate", 0.6)
			self.SetSubGraphFloatVariable("ftoggleblend", 1.0)
			;DLC2BurntSprigganParticlesE.play(self, 0.25)
			utility.wait(0.4)
			self.SetSubGraphFloatVariable("fDampRate", 0.05)
			self.SetSubGraphFloatVariable("ftoggleblend", baseGlow)
			
		endIf
	EndEvent

	Event onDying(actor myKiller)
		DLC2BurntSprigganParticlesE.stop(self)
		goToState("dead")
	EndEvent
endState

state dead
;do nothing
endState
