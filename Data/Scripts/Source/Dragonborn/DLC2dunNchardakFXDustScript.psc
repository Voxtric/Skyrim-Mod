scriptName DLC2dunNchardakFXDustScript extends objectReference 

Explosion property FallingDustExplosion01 auto
Sound property AMBDustDropDebris auto

Event OnActivate(ObjectReference triggerRef)
	int r = Utility.RandomInt(0, 100)
	if (r < 25)
		self.PlayAnimation("PlayAnim01")
		AMBDustDropDebris.play(self)
		Utility.Wait(0.3)
		placeAtMe(FallingDustExplosion01)
		Utility.Wait(1.0)
		self.PlayAnimation("PlayAnim02")
		AMBDustDropDebris.play(self)
	ElseIf (r >= 25 && r < 50)
		self.PlayAnimation("PlayAnim02")
		AMBDustDropDebris.play(self)
	ElseIf (r >= 50 && r < 75)
		self.PlayAnimation("PlayAnim01")
		AMBDustDropDebris.play(self)
		Utility.Wait(0.5)
		self.PlayAnimation("PlayAnim03")
		AMBDustDropDebris.play(self)
	EndIf
EndEvent