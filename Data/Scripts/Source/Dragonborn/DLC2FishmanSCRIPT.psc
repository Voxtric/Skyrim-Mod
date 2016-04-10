Scriptname DLC2FishmanSCRIPT extends Actor  
{Special stuff for the fishman}




Explosion Property DLC2LurkerStompArtExplosion Auto

VisualEffect Property DLC2BenthicLurkerTenticleMouthE Auto
VisualEffect Property DLC2BenthicTenticleHandLeftE Auto
VisualEffect Property DLC2BenthicTenticleHandRightE Auto
VisualEffect Property DLC2BenthicLurkerWhipDustE Auto
VisualEffect Property DLC2BenthicLurkerWhipDustSnowE Auto
VisualEffect Property DLC2BenthicTenticleStompE Auto
Bool Property isInSnow = false Auto
EffectShader Property DLC2LurkerEmerge Auto


	Event onLoad()
		DLC2BenthicLurkerTenticleMouthE.Play(self, -1)	
		DLC2BenthicTenticleHandLeftE.Play(self, -1)	
		DLC2BenthicTenticleHandRightE.Play(self, -1)	
		DLC2BenthicTenticleStompE.Play(self, -1)	
		
		if (self.GetSleepState() == 3)
			DLC2LurkerEmerge.Play(self)
		endIf	
		
		if isInSnow == false
			DLC2BenthicLurkerWhipDustE.Play(self, -1)	
		elseif isInSnow == true
			DLC2BenthicLurkerWhipDustSnowE.Play(self, -1)	
		endIf
		
		RegisterForAnimationEvent(self, "RFootStomp")
	endEvent
	
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if (akSource == self) && (asEventName == "RFootStomp")
			PlaceAtMe(DLC2LurkerStompArtExplosion, 1)
			self.playSubgraphAnimation("StompGo")
		endIf
	endEvent
	
	Event OnGetUp(ObjectReference akFurniture)
		utility.wait(1.0)
		DLC2LurkerEmerge.Stop(self)
	endEvent

	EVENT onDying(actor myKiller)
		;self.playSubgraphAnimation("MouthWhipBarf")	
		;utility.wait(3)
		DLC2BenthicLurkerTenticleMouthE.Stop(self)	
		
		DLC2BenthicTenticleHandLeftE.Stop(self)	
		DLC2BenthicTenticleHandRightE.Stop(self)	
		DLC2BenthicTenticleStompE.Stop(self)	
		
		if isInSnow == false
			DLC2BenthicLurkerWhipDustE.Stop(self)	
		elseif isInSnow == true
			DLC2BenthicLurkerWhipDustSnowE.Stop(self)	
		endIf
		
	ENDEVENT
	
	







