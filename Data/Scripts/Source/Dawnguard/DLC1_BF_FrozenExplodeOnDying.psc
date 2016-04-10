Scriptname DLC1_BF_FrozenExplodeOnDying extends Actor

Explosion Property ExplosionOnDying Auto
Explosion Property DLC1FrozenFalmerExplosion Auto

Float Property DelayBeforeExplode Auto
; Activator property FrozenFalmerHead auto
; Activator property FrozenFalmerLeftHand auto
; Activator property FrozenFalmerLeftLeg auto
; Activator property FrozenFalmerRightArm auto
; Activator property FrozenFalmerRightLeg auto
; Activator property FrozenFalmerTorso auto
; objectReference property meatHolder auto
; objectReference myREFhead
; objectReference myREFtorso
; objectReference myREFLarm
; objectReference myREFRarm
; objectReference myREFLleg
; objectReference myREFRleg
EffectShader Property DLC1BFIceFormFXS Auto

Event onLoad()
	utility.wait(5)	
	if DLC1BFIceFormFXS
		DLC1BFIceFormFXS.Play(self)
	endif
			;myREFhead = meatHolder.placeAtMe(FrozenFalmerHead)
			;myREFhead.SetMotionType(myREFhead.Motion_Keyframed)
			;myREFLarm = meatHolder.placeAtMe(FrozenFalmerLeftHand)
			;myREFLarm.SetMotionType(myREFLarm.Motion_Keyframed)			
			;myREFLleg = meatHolder.placeAtMe(FrozenFalmerLeftLeg)
			;myREFLleg.SetMotionType(myREFLleg.Motion_Keyframed)			
			;myREFRarm = meatHolder.placeAtMe(FrozenFalmerRightArm)
			;myREFRarm.SetMotionType(myREFRarm.Motion_Keyframed)			
			;myREFRleg = meatHolder.placeAtMe(FrozenFalmerRightLeg)		
			;myREFRleg.SetMotionType(myREFRleg.Motion_Keyframed)			
			;myREFtorso = meatHolder.placeAtMe(FrozenFalmerTorso)		
			;myREFtorso.SetMotionType(myREFtorso.Motion_Keyframed)			
ENDEVENT	

Event OnDying(Actor akKiller)
	if (DelayBeforeExplode > 0)
		utility.Wait(DelayBeforeExplode)
	endif
	;myREFhead.MoveToNode(Self, "NPC Head")
	;myREFhead.SetMotionType(myREFhead.Motion_Dynamic)
	;myREFRarm.MoveToNode(Self, "NPC R UpperArm")
	;myREFRarm.SetMotionType(myREFRarm.Motion_Dynamic)
	;myREFLarm.MoveToNode(Self, "NPC L Forearm")
	;myREFLarm.SetMotionType(myREFLarm.Motion_Dynamic)
	;myREFtorso.MoveToNode(Self, "NPC Spine1")	
	;myREFtorso.SetMotionType(myREFtorso.Motion_Dynamic)	
	;myREFLleg.MoveToNode(Self, "NPC L Thigh")
	;myREFLleg.SetMotionType(myREFLleg.Motion_Dynamic)	
	;myREFRleg.MoveToNode(Self, "NNPC R Calf")	
	;myREFRleg.SetMotionType(myREFRleg.Motion_Dynamic)
	;self.PlaceAtMe(ExplosionOnDying)
	self.PlaceAtMe(DLC1FrozenFalmerExplosion)
	utility.wait(0.001)		
	self.Disable()
	utility.wait(10)	
	; myREFhead.Disable(true)
	; myREFRarm.Disable(true)
	; myREFLarm.Disable(true)
	; myREFtorso.Disable(true)			
	; myREFLleg.Disable(true)		
	; myREFRleg.Disable(true)
EndEvent
