Scriptname DLC1VQ06ReadingTriggerScript extends ObjectReference  Conditional

Quest Property DLC1VQ06  Auto  
;stage 50 must be set
;stage 60 means player entered trigger (turns on objectives)
;stage 70 means player completed the sequence


VisualEffect Property DLC1ReadElderScrollEffect Auto 
VisualEffect Property DLC1ReadElderScrollPartAEffect Auto 
VisualEffect Property DLC1ReadElderScrollPartBEffect Auto 
VisualEffect Property DLC1ReadElderScrollPartCEffect Auto 
VisualEffect Property DLC1ReadElderScrollBlankEffect Auto 

VisualEffect Property FXReadElderScrollEffect Auto

Armor Property ElderScrollHandAttachArmor Auto
Idle Property idleReadElderScroll  Auto  
Sound Property OBJElderScrollBlindIn2D Auto

ImageSpaceModifier Property FXReadScrollsBlindImod Auto
Idle Property IdleStop  Auto

Sound Property OBJElderScrollBlindOut2D Auto
Sound Property QSTMQ206ElderScrollRead2DSound  Auto
Sound Property QSTDLC01ElderScrollRead2D  Auto
Sound Property QSTDLC01ElderScrollRead2DHeavy  Auto
Sound Property QSTDLC01ElderScrollRead2DLPM  Auto
Sound Property QSTDLC01ElderScrollReadB2D  Auto
Sound Property QSTDLC01ElderScrollFinalRead2DLPM Auto

ImageSpaceModifier Property FadeToWhiteHoldImod Auto

int soundInstance1
int soundInstance2
int soundInstance3
int soundInstance4
int soundInstance5
int readScrollStepper 

bool PlayerIn

float visionTime = 15.0
float FinalVisionTime = 25.0
float readStepTimer  = 3.0


VisualEffect Property DLC01_ScrollAttunementEffect Auto ;turns off moth glowy effect

;*** DEBUG SETTING
bool DebugReadSucceed = false 	;setting this to true will let you read the scrolls anywhere, not just in the triggerbox

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		
		playerIn = true

		if DLC1VQ06.GetStage() == 50
			DLC1VQ06.SetStage(60)
		endif

	endif

endEvent

Event OnTriggerLeave(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		playerIn = false
	endif

endEvent



Function ReadScroll(int whichScroll)
	Actor PlayerActor = Game.GetPlayer()

	if (playerIn && DLC1VQ06.GetStageDone(50) && DLC1VQ06.GetStageDone(70) == false && whichScroll == 1) || DebugReadSucceed
		DLC01_ScrollAttunementEffect.Stop(Game.GetPlayer())
		Game.DisablePlayerControls(abLooking = true) 
		PlayerReadsScroll(WhichScroll)

	else
		PlayerGoesBlind()

	endif

EndFunction



Function PlayerReadsScroll(int WhichScroll, bool OpenScroll = true)

	Debug.Trace(self + "PlayerReadsScroll() which scroll == " + whichScroll)

	Actor PlayerActor = Game.GetPlayer()

	float VisionTimer 
	
	;THIS IS NOW ALL A SINGLE BAKED IN ANIMATION, NOT 4 SEPERATE THINGS

	if whichScroll == 1
		PrepForReading(DisableControlsCompletely = true)
		readScrollStepper = 1 ;toggles the behavior in the play read animation function
		PlayReadAnimation() ;read 1st scroll
		Utility.Wait(readStepTimer)	
		PlayReadAnimation();read 2nd scroll
		Utility.Wait(readStepTimer)	
		PlayReadAnimation();read 3rd scroll
		Utility.Wait(readStepTimer)
		
		QSTDLC01ElderScrollRead2DHeavy.play(PlayerActor) 
		DLC1ReadElderScrollEffect.Play(PlayerActor, -1)
		VisionTimer = FinalVisionTime
		Utility.Wait(15)

		;Crossfade to White - Shake Controller and Play Sound
		Game.ShakeController(0.5, 0.5, 1.5)
		FadeToWhiteHoldImod.applyCrossFade(1.0)

		Utility.Wait(1)	
		
		DLC1ReadElderScrollPartAEffect.stop(PlayerActor)
		DLC1ReadElderScrollPartBEffect.stop(PlayerActor)
		DLC1ReadElderScrollPartCEffect.stop(PlayerActor)
		DLC1ReadElderScrollEffect.stop(PlayerActor)
		DLC1ReadElderScrollBlankEffect.stop(PlayerActor)
		FXReadElderScrollEffect.stop(PlayerActor)	
		
		sound.StopInstance(soundInstance4)
		sound.StopInstance(soundInstance5)

		;Crossfade from White 
		Utility.Wait(3)

		ImagespaceModifier.removeCrossFade(5.0)
		
		ReturnFromReading(playOutSound = false, shouldEnableControls = true)
		DLC1VQ06.SetStage(70)
	
	endif

EndFunction

Function PlayerGoesBlind()
	Actor PlayerActor = Game.GetPlayer()

	PrepForReading()
	PlayReadAnimation()
	utility.wait(0.5)

	;Play shake camera and player when going blind at point of full scroll extension
	game.ShakeCamera(afStrength = 0.5, afDuration = 1.5) 
	FXReadElderScrollEffect.Play(PlayerActor, 8.1)	
	FXReadScrollsBlindImod.Apply()
	utility.wait(4.9)

	ReturnFromReading()

	playSound(2)

EndFunction

Function PrepForReading(bool DisableControlsCompletely = false)
	Debug.Trace(self + "PrepForReading() DisableControlsCompletely ==" + DisableControlsCompletely)

	Actor PlayerActor = Game.GetPlayer()


	if DisableControlsCompletely  ;false by default
		Game.DisablePlayerControls(abLooking = true)

	else
		; close menu, disable player controls briefly, force first person
		Game.DisablePlayerControls(abMovement = false, abFighting = true, abCamSwitch = false, abLooking = false, abSneaking = false, abMenu = true, abActivate = true, abJournalTabs = false, aiDisablePOVType = 0)
		Game.EnablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = false, abLooking = false, abSneaking = false, abMenu = true, abActivate = false, abJournalTabs = false, aiDisablePOVType = 0)

	endif


	if PlayerActor.GetSitState() == 0
		Game.ForceFirstPerson()
	endif

	PlayerActor.DispelAllSpells()
	
EndFunction

Function PlayReadAnimation()

	Actor PlayerActor = Game.GetPlayer()
	
	; play read idle and scroll art animation
	float gapTimer = 2.0
	
	if PlayerActor.GetSitState() == 0
		PlayerActor.equipItem(ElderScrollHandAttachArmor, false, true)
	; play read idle and scroll art animation
		PlayerActor.PlayIdle(idleReadElderScroll)		
		utility.wait(1.05)
	endif
	

		
		if readScrollStepper == 0	;go blind version
			FXReadElderScrollEffect.Play(PlayerActor, 8.1)	
			;Play In sound
			PlaySound(1)			
		elseif readScrollStepper == 1
			soundInstance3 = QSTDLC01ElderScrollRead2D.play(PlayerActor) 
			soundInstance4 = QSTDLC01ElderScrollRead2DLPM.play(PlayerActor) 
			soundInstance5 = QSTDLC01ElderScrollFinalRead2DLPM.play(PlayerActor) 
			FXReadElderScrollEffect.Play(PlayerActor, 8.1)		
			DLC1ReadElderScrollBlankEffect.Play(PlayerActor, -1.0)	
			utility.wait(gapTimer)
			DLC1ReadElderScrollPartBEffect.Play(PlayerActor, -1.0)
			utility.wait(readStepTimer - gapTimer)
			PlayerActor.removeItem(ElderScrollHandAttachArmor, 1, true)
			readScrollStepper = 2
		elseif readScrollStepper == 2
			QSTDLC01ElderScrollReadB2D.play(PlayerActor) 
			utility.wait(1)
			DLC1ReadElderScrollPartCEffect.Play(PlayerActor, -1.0)
			utility.wait(readStepTimer - 1)
			PlayerActor.removeItem(ElderScrollHandAttachArmor, 1, true)
			readScrollStepper = 3
		elseif readScrollStepper == 3
			QSTDLC01ElderScrollReadB2D.play(PlayerActor)
			utility.wait(1)
			DLC1ReadElderScrollPartAEffect.Play(PlayerActor, -1.0)
			utility.wait(readStepTimer - 1)
			PlayerActor.removeItem(ElderScrollHandAttachArmor, 1, true);
			readScrollStepper = 0
		endif	

EndFunction

Function ReturnFromReading(bool playOutSound = true, bool shouldEnableControls = true)
	Actor PlayerActor = Game.GetPlayer()

	if PlayerActor.GetSitState() == 0
		PlayerActor.PlayIdle(IdleStop)
		PlayerActor.removeItem(ElderScrollHandAttachArmor, 1, true)
	endif

	;EnableControls
	if shouldEnableControls
		if DLC1VQ06.GetStageDone(60) && DLC1VQ06.GetStageDone(70) == false
			;don't enable controls, player still needs to read to correct scroll
		else
			Game.EnablePlayerControls()
		endif
	endif
	
EndFunction




Function playSound(int whichSound)
	Actor PlayerActor = Game.GetPlayer()

	if whichSound == 1
		soundInstance1 = OBJElderScrollBlindIn2D.play(PlayerActor) 
	elseif whichSound == 2
		soundInstance2 = OBJElderScrollBlindOut2D.play(PlayerActor)
	endif
EndFunction