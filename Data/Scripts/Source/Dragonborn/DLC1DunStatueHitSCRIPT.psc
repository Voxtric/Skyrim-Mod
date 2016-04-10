Scriptname DLC1DunStatueHitSCRIPT extends ObjectReference Hidden 

import debug
import utility

	; Contains links to each of the other statues, in order to check the states they are in
Keyword Property LinkCustom01 auto
Keyword Property LinkCustom02 auto

	; Contains link to the door that opens after all statues have been hit correctly
Keyword Property LinkCustom03 auto

	; Contains link to the this statues torch that enables when it's hit correctly
Keyword Property LinkCustom04 auto

	; Contains link to the torches that turn on when the whole puzzle is solved
Keyword Property LinkCustom05 auto

Keyword Property WeapTypeStaff auto

Int Property iStatueType auto
{0 = Melee, 1 = Archer, 2 = Mage}

Int Property iHitType Auto Hidden
{Type of hit just attempted by the player.  To handle animations.  0 = Melee, 1 = Archer, 2 = Mage}

Int Property iCurrentRotation = -1 Auto Hidden
{0 = Melee, 1 = Archer, 2 = Mage}

Bool Property bWasCorrectHit Auto Hidden
{Whether the current his was correct or not}


Quest Property MyQuest Auto
Int Property StageToSetOnFirstFail Auto
Int Property StageToSetOnFirstCorrectHit Auto
Int Property StageToSetOnComplete Auto

Bool Property bAlreadyHitIncorrectly Auto
Bool Property bAlreadyHitCorrectly Auto


Event OnCellAttach()
	RegisterForAnimationEvent(self, "done")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if (asEventName == "Done")
		GoToState("Busy")
    	Trace("Received DONE event!")
    	if iStatueType == iHittype
    		Trace("CORRECT!")
			self.PlayAnimation("Correct")
			utility.Wait(1)
			GoToState("BeenCorrectlyHit")
		else
			GoToState("WaitingForHit")
			Trace("INCORRECT!")
			if (bAlreadyHitIncorrectly == FALSE)
				Trace("Hit by incorrect attack.  Shouldn't see this message again")
				MyQuest.SetStage(StageToSetOnFirstFail)
				bAlreadyHitIncorrectly = TRUE
				(GetLinkedRef(LinkCustom01) as DLC1DunStatueHitSCRIPT).bAlreadyHitIncorrectly = TRUE
				(GetLinkedRef(LinkCustom02) as DLC1DunStatueHitSCRIPT).bAlreadyHitIncorrectly = TRUE
			endif
		endif
 	endIf
EndEvent

STATE DoNothing
	;BUSY
EndSTATE

auto STATE WaitingForHit
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		trace("akAggressor is " + akAggressor + ".  akSource is " + akSource + ".  akProjectile is " + akProjectile)
			; We only care if the player hits the statue in some way
		if akAggressor == Game.GetPlayer()

				; If it was hit by a weapon it's either an arrow or melee attack
			if (akSource as Weapon)

					; If it has this keyword then it's an arrow that hit us, if not then it's a melee attack
				if akProjectile
					Trace("ARROW'D by bow " + akSource + " with arrow " + akProjectile)
					iHitType = 1
					GoToState("RotatingPillar")
				else
					iHitType = 0
					GoToState("RotatingPillar")
					Trace("MELEE'D by weapon " + akSource)
				endif

				; If not a weapon then lets check if it's a spell
			elseif (akSource as Spell) || (akSource as Enchantment)
				iHitType = 2
				GoToState("RotatingPillar")
				Trace("SPELL'D by spell " + akSource)
			else
				Trace("Hit by nothing?")
			endif

		endif

	EndEvent
EndSTATE


STATE RotatingPillar

	Event OnBeginState()
		if (iHitType == 0); && (iHitType != iCurrentRotation)
			iCurrentRotation = iHitType
			Trace("Rotating to Melee Side")
			;self.PlayAnimationAndWait("Melee", "Done")
			self.PlayAnimation("Melee")
			;Trace("Rotating to Melee Side DONE")
		elseif (iHitType == 1); && (iHitType != iCurrentRotation)
			iCurrentRotation = iHitType
			Trace("Rotating to Marksman Side")
			;self.PlayAnimationAndWait("Marksman", "Done")
			self.PlayAnimation("Marksman")
			;Trace("Rotating to Marksman Side DONE")
		elseif (iHitType == 2); && (iHitType != iCurrentRotation)
			iCurrentRotation = iHitType
			Trace("Rotating to Magic Side")
			;self.PlayAnimationAndWait("Magic", "Done")
			self.PlayAnimation("Magic")
			;Trace("Rotating to Magic Side DONE")
		elseif (iHitType != iCurrentRotation)
			Trace("Already in that position!")
		endif

		GoToState("WaitingForHit")

		;if iStatueType == iHittype
		;	self.PlayAnimation("Correct")
		;	utility.Wait(1)
		;	GoToState("BeenCorrectlyHit")
		;	if (bAlreadyHitIncorrectly == FALSE)
		;		Trace("Hit by incorrect attack.  Shouldn't see this message again")
		;		MyQuest.SetStage(StageToSetOnFirstFail)
		;		bAlreadyHitIncorrectly = TRUE
		;		(GetLinkedRef(LinkCustom01) as DLC1DunStatueHitSCRIPT).bAlreadyHitIncorrectly = TRUE
		;		(GetLinkedRef(LinkCustom02) as DLC1DunStatueHitSCRIPT).bAlreadyHitIncorrectly = TRUE
		;	endif
		;else
		;	GoToState("WaitingForHit")
		;endif

	EndEvent

EndSTATE


STATE BeenCorrectlyHit

	Event OnBeginState()
		Trace("CORRECTLY HIT!")
		bWasCorrectHit = TRUE
		if ((GetLinkedRef(LinkCustom01) as DLC1DunStatueHitSCRIPT).GetState() == "BeenCorrectlyHit") && ((GetLinkedRef(LinkCustom02) as DLC1DunStatueHitSCRIPT).GetState() == "BeenCorrectlyHit")
			Trace ("We've all been solved, open door")
			MyQuest.SetStage(StageToSetOnComplete)
			GetLinkedRef(LinkCustom04).EnableNoWait()
			GetLinkedRef(LinkCustom05).EnableNoWait()
			Wait(1)
			GetLinkedRef(LinkCustom03).Activate(self)
		else

			if (bAlreadyHitCorrectly == FALSE)
				Trace ("This is the first correct hit, shouldn't see this on any of the other statues now")
				MyQuest.SetStage(StageToSetOnFirstCorrectHit)
				bAlreadyHitCorrectly = TRUE
				(GetLinkedRef(LinkCustom01) as DLC1DunStatueHitSCRIPT).bAlreadyHitCorrectly = TRUE
				(GetLinkedRef(LinkCustom02) as DLC1DunStatueHitSCRIPT).bAlreadyHitCorrectly = TRUE
			endif
			GetLinkedRef(LinkCustom04).EnableNoWait()
			Trace ("Not all are solved yet")
		endif
	EndEVENT

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		Trace("Stop hitting me!")
	EndEvent

EndSTATE