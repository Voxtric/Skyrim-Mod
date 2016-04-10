Scriptname DLC2MiraakFXTestSCRIPT extends Actor

bool looper = true

float fadeSpeedDefault = 0.03 ; this is the default value of fDampRate fades over about 2 seconds
float fadeSpeedFast = 0.08 ; about 1 second fade time

VisualEffect Property DLC2MiraakStreakE Auto ;streak art...autofills

Armor Property DLC2MiraakSkeleton Auto ; miraaks skeleton for death fx

VisualEffect Property DLC2MiraakAbsorbManE Auto ;..autofills
VisualEffect Property DLC2MiraakAbsorbE Auto ;...autofills


EffectShader Property DLC2MiraakBitsFXS Auto
EffectShader Property DLC2MiraakBitsLite2FXS Auto
EffectShader Property DLC2MiraakSmokeFXS Auto
EffectShader Property DLC2MiraakMagicFXS Auto

EVENT onLoad()

	;adds miraak trail art
	DLC2MiraakStreakE.Play(self, -1)	
	
	;sets mirakk fade speed
	self.SetSubGraphFloatVariable("fDampRate", fadeSpeedFast) ;sets how fast miraak fades in and out

		self.addItem(DLC2MiraakSkeleton)
		self.equipItem(DLC2MiraakSkeleton)
	;while looper == true
	
		
		utility.wait(6)
		;self.playSubgraphAnimation("startStreak")
		;mirak fades down
		DLC2MiraakBitsLite2FXS.Play(self)
		utility.wait(1)
		self.playSubgraphAnimation("SkinFadeOutLong")
						DLC2MiraakBitsFXS.Play(self)		
		utility.wait(0.1)				
		self.playSubgraphAnimation("stage2")


		utility.wait(3)
		DLC2MiraakMagicFXS.Play(self)	
		DLC2MiraakMagicFXS.Stop(self)	
		utility.wait(3)
		DLC2MiraakBitsLite2FXS.Stop(self)
		DLC2MiraakBitsFXS.Stop(self)				
		utility.wait(10)	
		DLC2MiraakSmokeFXS.Play(self)	
		utility.wait(3)	
		DLC2MiraakSmokeFXS.Stop(self)		
		utility.wait(2)	
		self.playSubgraphAnimation("stage3")
		; DLC2MiraakAbsorbE.Play(self, 8, game.getPlayer())
		; DLC2MiraakAbsorbManE.Play(game.getPlayer(), 8, self) 		
		;mirak trail fades on 
		; self.SetSubGraphFloatVariable("fDampRateAlt", 0.08) ;sets how fast miraaks trail fades in 
		; self.SetSubGraphFloatVariable("fToggleBlendAlt", 1.5) ;value is clamped at 1 in graph but setting it above and below makes it hit the limit a little harder
		

		;self.playSubgraphAnimation("stopStreak")
		;mirak fades up
		; self.SetSubGraphFloatVariable("fDampRate", fadeSpeedFast) 
		; self.SetSubGraphFloatVariable("fToggleBlend", -0.5)
		; self.unequipItem(DLC2MiraakSkeleton)
		;mirak trail fades on 
		; self.SetSubGraphFloatVariable("fDampRateAlt", 0.05) ;sets how fast miraak's trail fades out
		; self.SetSubGraphFloatVariable("fToggleBlendAlt", -0.5)
		
	;endWhile
ENDEVENT


