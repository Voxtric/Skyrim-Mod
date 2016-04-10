Scriptname DLC1LD_BthalftDustDropScript extends ObjectReference
{Script on the Bthalft01 dust. Triggers a dust drop on activation.}

Sound property AmbDustDropDebris auto
Explosion property FallingDustExplosion01 auto

Event OnActivate(ObjectReference obj)
	PlaceAtMe(FallingDustExplosion01)
	AmbDustDropDebris.play(self)
	int anim = Utility.RandomInt(1, 3)
	if (anim == 1)
		Self.PlayAnimation("PlayAnim01")
	ElseIf (anim == 2)
		Self.PlayAnimation("PlayAnim02")
	Else
		Self.PlayAnimation("PlayAnim03")
	EndIf
EndEvent

