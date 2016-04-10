Scriptname DLC1_BF_FallingDebrisTrigSCRIPT extends ObjectReference Hidden 
{
	Child Script under the DLC1_BF_FallingDebrisTrigSCRIPT

	When activated it checks if the player is in the trigger, and if he is it collapse the ceiling/pillar on him.
}

import utility
import debug
import weather

Keyword Property LinkCustom01 Auto
{Link to the Prince who casts when the piece is about to fall}
Keyword Property LinkCustom02 Auto
{Link to the Piece we need to animate}
keyword Property LinkCustom03 Auto
{Optional link to the piece we need to animate then fade out}
keyword Property LinkCustom04 Auto
{Optional link to the first light beam that enables when this ceiling piece drops}
keyword Property LinkCustom05 Auto
{Optional link to the second light beam that enables when this ceiling piece drops}
keyword Property LinkCustom06 Auto
{Link for columns where second explosion occurs when the chunks hit the floor}
keyword Property LinkCustom07 Auto
{Link to the weather trigger to tell it when to delete}

Spell Property VoiceUnrelentingForce3 Auto
{Spell the prince should cast at the xMarker (Default LinkedRef())}
Explosion Property DLC1SnowElfColumnHavokExplosion Auto
{Explosion that should be called when the impact of a pillar happenes}
Explosion Property DLC1SnowElfFlatHavokExplosion Auto
{Explosion that should be called when the impact of a ceiling piece happenes}

VisualEffect Property DLC01_SunAuraCloakEffect  Auto  
{Aura effect that should play when the prince is casting to bring down the ceiling/columns}

Sound Property FXRumbleFalmerBoss2D Auto
{Sound that plays when the camera shakes}

Sound Property QSTFalmerBossColumnDestruction2D Auto
{Sound that plays when a column breaks.}

Quest Property myQuest Auto
{Quest to check before doing anything}
Int Property stageToCheck Auto
{Stage to check before doing anything}


Bool Property DebrisWasTriggered = FALSE Auto Hidden
{Whether the debris has been triggered or not}

Bool Property CheckForPlayer = FALSE Auto Hidden
{Whether we should be looking for the player or not}

ObjectReference Property DebrisController Auto Hidden
{Link to DebrisController so we can tell it when we've found the player}

Bool Property ForceCollapse = FALSE Auto Hidden
{If true then this rubble will be forced to collapse on activate}

ObjectReference Property Prince Auto
{Link to the prince so we can make him animate}

Idle Property PrinceCast Auto
{Idle animation of the prince casting a spell from his throne}

Idle Property PrinceBigCast Auto
{Idle animation of the prince casting a big spell from this throne}

Idle Property PrinceBigCastEnd Auto
{Idle animation of the prince ending the big spell cast from this throne}

Weather Property DLC1FalmerValley_bf Auto
{Weather to switch to after a ceiling piece has fallen}

Int Property PillarPosition Auto
{One of the 4 pillars positions.  They are positioned clockwise around the room (Facing the Pillar) from 1 to 4.  DEFAULT = 0}


Event OnActivate(ObjectReference akActionRef)
	Trace(self + " Running OnActivate()")
	if (ForceCollapse == FALSE)
		CheckForPlayer()
	else
		ForceCollapse()
	endif

EndEvent


; Called by DebrisController which tells the trigger to look for the player, then drop debris
Function CheckForPlayer()
	Trace(self + " Running CheckForPlayer()")


	if (MyQuest.IsStagedone(StageToCheck))
		;do nothing
	else
			; Check to see if the collapse has already occured
		if DebrisWasTriggered == FALSE
			CheckForPlayer = TRUE
		endif

		While (DebrisWasTriggered == FALSE) && (CheckForPlayer == TRUE)
			if (MyQuest.IsStagedone(StageToCheck))
				;do nothing
			else
					; If there is anything in the trigger, it must be the player since that's all this triggers is filtered for on the base (PlayerKeyword)
				if GetTriggerObjectCount() > 0
						; Tell the DebrisController script that we've found the player
					DebrisController.Activate(self)

						; Commence with the collapse
					DebrisWasTriggered = TRUE

					if (GetLinkedRef(LinkCustom03))
							; Must be a column, do column long casting anim
						(Prince as Actor).SetSubGraphFloatVariable("ftoggleBlend", 1.0)
						DLC01_SunAuraCloakEffect.Play(Prince as Actor)
						(Prince as Actor).PlayIdle(PrinceBigCast)
					else
							; Not a column, do ceiling quick casting anim
						(Prince as Actor).SetSubGraphFloatVariable("ftoggleBlend", 1.0)
						DLC01_SunAuraCloakEffect.Play(Prince as Actor)
						(Prince as Actor).PlayIdle(PrinceCast)
					endif

						; Cast spell from Prince to xMarker
					;VoiceUnrelentingForce3.Cast(GetLinkedRef(LinkCustom01), GetLinkedRef())

						; Shake camera when the prince casts, from this triggers origin
					Game.ShakeCamera(self, 0.3, 1)


						; If there's a LinkCustom03, it should also play the collapse anim and the rest of the fall is based on this collapse being a pillar
					if (GetLinkedRef(LinkCustom03))
						registerForAnimationEvent(GetLinkedRef(LinkCustom03), "impactFloor")
						if (PillarPosition == 1)
							QSTFalmerBossColumnDestruction2D.Play(self)
							GetLinkedRef(LinkCustom03).PlayAnimation("anim1")
							GetLinkedRef(LinkCustom02).PlayAnimationAndWait("anim1", "impact")
						elseif (PillarPosition == 2)
							QSTFalmerBossColumnDestruction2D.Play(self)
							GetLinkedRef(LinkCustom03).PlayAnimation("anim2")
							GetLinkedRef(LinkCustom02).PlayAnimationAndWait("anim2", "impact")
						elseif (PillarPosition == 3)
							QSTFalmerBossColumnDestruction2D.Play(self)
							GetLinkedRef(LinkCustom03).PlayAnimation("anim3")
							GetLinkedRef(LinkCustom02).PlayAnimationAndWait("anim3", "impact")
						elseif (PillarPosition == 4)
							QSTFalmerBossColumnDestruction2D.Play(self)
							GetLinkedRef(LinkCustom03).PlayAnimation("anim4")
							GetLinkedRef(LinkCustom02).PlayAnimationAndWait("anim4", "impact")
						endif
						(Prince as Actor).PlayIdle(PrinceBigCastEnd)
						GetLinkedref().PlaceAtMe(DLC1SnowElfColumnHavokExplosion)
						FXRumbleFalmerBoss2D.play(self)
						Game.ShakeCamera(self, 0.5, 1)
						Game.ShakeController(0.5, 0.5, 1)
						GetLinkedRef().KnockAreaEffect(1,1024)
						DLC01_SunAuraCloakEffect.Stop(Prince as Actor)
						(Prince as Actor).SetSubGraphFloatVariable("ftoggleBlend", 0.0)
						Wait(5)
							; Clean up debris pieces
						GetLinkedRef(LinkCustom03).Disable(1)
					else
							; Enable the two possible light beams, if they are there
						if GetLinkedRef(LinkCustom04)
							GetLinkedRef(LinkCustom04).Enable()
						endif
						if GetLinkedRef(LinkCustom05)
							GetLinkedRef(LinkCustom05).Enable()
						endif

							; Collapse must be a ceiling piece, so do the following instead
						registerForAnimationEvent(GetLinkedRef(LinkCustom02), "stage1State_to_stage2State")
						GetLinkedRef(LinkCustom02).PlayAnimation("Stage2")
						Wait(0.5)
						DLC01_SunAuraCloakEffect.Stop(Prince as Actor)
						(Prince as Actor).SetSubGraphFloatVariable("ftoggleBlend", 0.0)
					endif
				else
					Wait(0.2)
				endif
			endif
		EndWhile

	endif

EndFunction



Function AssignDebrisController(Objectreference akWaveController)
	; Assign the Debris Controller so we don't have to LinkedRef all the triggers to it

	DebrisController = (akWaveController)

EndFunction


	; Called by the quest when the battle is finished so that all the collapses that haven't happened yet will
Function ForceCollapse()

	if DebrisWasTriggered == FALSE
		DebrisWasTriggered = TRUE
		Wait(RandomFloat(0.5, 8))
			; Shake camera when the prince casts, from this triggers origin
		;Game.ShakeCamera(self, 0.3, 1)

			; Tell LinkCustom02 to play the collapse animation
		if (GetLinkedRef(LinkCustom02))
			GetLinkedRef(LinkCustom02).PlayAnimationandWait("Stage2", "impactFloor")

		endif
	endif
EndFunction

	; function called when battle is finished so that the light beams for each hole are disabled
Function TryToDisableLightBeams()

	if GetLinkedRef(LinkCustom04)
		GetLinkedRef(LinkCustom04).DisableNoWait()
	endif
	if GetLinkedRef(LinkCustom05)
		GetLinkedRef(LinkCustom05).DisableNoWait()
	endif	

EndFunction


Event OnAnimationEvent(ObjectReference akSource, string EventName)
	
	if (eventName == "impactFloor")
		GetLinkedref(LinkCustom06).PlaceAtMe(DLC1SnowElfFlatHavokExplosion)
		unregisterForAnimationEvent(GetLinkedref(LinkCustom01), "impactFloor")
		FXRumbleFalmerBoss2D.play(self)
	endif

	if (eventName == "stage1State_to_stage2State")
		if ((DebrisController as DLC1_BF_FallingDebrisControllerSCRIPT).AlreadyChangedWeather == FALSE)
			GetLinkedref(LinkCustom07).Disable()
			DLC1FalmerValley_bf.ForceActive(TRUE)
			(DebrisController as DLC1_BF_FallingDebrisControllerSCRIPT).AlreadyChangedWeather = TRUE
		endif

		GetLinkedref().PlaceAtMe(DLC1SnowElfFlatHavokExplosion)
		FXRumbleFalmerBoss2D.play(self)
		Game.ShakeCamera(self, 0.2, 1)
		Game.ShakeController(0.3, 0.3, 1)
		GetLinkedRef().KnockAreaEffect(1,512)
		unregisterForAnimationEvent(GetLinkedRef(LinkCustom02), "stage1State_to_stage2State")
	endif

EndEvent