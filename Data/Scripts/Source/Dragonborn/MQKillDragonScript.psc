Scriptname MQKillDragonScript extends Quest  Conditional
{holds property and dragon death function, until we have base actor scripts}

import game
import debug
import utility
import sound


;************************************************
; this is what actually does the death sequence
; change timing and art here
;************************************************

;------------------------ADDED FOR DLC2---------------------
bool Function TryMiraakMakeHisIntroduction(Actor DragonRef)

	RETURN DLC2SoulSteal.TryMiraakMakeHisIntroduction(DragonRef)

EndFunction


bool Function ShouldMiraakAppear(Actor DragonRef)
	
	RETURN DLC2SoulSteal.ShouldMiraakAppear(DragonRef)
	
EndFunction
;----------------------------------------------------------------


function DeathSequence(Actor dragonRef, Actor AbsorbActor = None, bool MiraakAppears = False)
;ADDED "Actor AbsorbActor = none, bool MiraakAppears = false" FOR DLC2

	;ADDED FOR DLC2----------------------------------
	if game.getPlayer().isInLocation(DLC2ApocryphaLocation) || game.getPlayer().getWorldSpace() == DLC2ApocryphaWorld
		if AbsorbActor == none
; 			Debug.Trace(self + "Miraak Soul Stealing in Apocrypha Boss Fight")
			;Start an alternate version of the death sequence that gets to the soul absorb faster
			MQ06DeathSequence(dragonRef, DLC2MiraakMQ06Ref, false)
			return
		endif
	else
		if AbsorbActor == none
			AbsorbActor = Game.GetPlayer()	

		endif

		if MiraakAppears
; 			Debug.Trace(self + "Calling DLC2SoulSteal.MiraakAppears()")
			DLC2SoulSteal.MiraakAppears(dragonRef)
			return
		endif
	endif
	;------------------------------------------------


	if dragonRef.IsInFaction(NoDragonAbsorb)
		return
	endif

	; Add Skeleton to dragon's inventory.
	dragonRef.AddItem(DragonUnderskin)	

	; Dragon wings particles bits

	FXDragonDeathLHandBits.Play(dragonRef, 12)
	FXDragonDeathRHandBits.Play(dragonRef, 12)
	
	
	wait(0.2)
	
	;Equip skeleton under skin
	dragonRef.EquipItem(DragonUnderskin)
	wait(0.5)	
	dragonRef.PlaySubGraphAnimation("UnderSkinFadeOut")	
	
	;*** WORLD INTERACTION FUNCTION -- jduvall
	WI.PlayerIsCurrentlyAbsorbingPower(dragonRef)
	bIsAbsorbing = true
		
	; Start effect shader decorating holes in the base skin
	DragonHolesFXS.Play(dragonRef)
	; Play disintegrating skin.
	dragonRef.PlaySubGraphAnimation( "SkinFadeOut" )
;;;
	; Play imagespace modifier which is timed to match sequence.
	DragonPowerAbsorbISM.Apply()

	; Sound of dragon carcass first bursts into flames until the flames die off. Must be turned off
	int soundInstanceFireID = NPCDragonDeathSequenceFireLPM.play(dragonRef) 
	
	wait(1)
	
	;Small bits rising from dragon fx shader.
	DragonHolesBitsLiteFXS.Play(dragonRef)
	
	wait(1)
	;Bigger bits rising from dragon fx shader.
	DragonHolesBitsFXS.Play(dragonRef)
	
	wait(2)
	

	
	wait(1.75)
	;Play blood fade out if it is there
	dragonRef.PlaySubGraphAnimation("BloodFade")
	
	; Magic particles on wings
	FXDragonDeathRHandFire.Play(dragonRef, 12)
	FXDragonDeathLHandFire.Play(dragonRef, 12)
	
	wait(1.0)
	; magic fire fx shader
	DragonHolesMagicFXS.Play(dragonRef)
	DragonHolesMagicFXS.Stop(dragonRef);;;;;;;;;;;;;;;;;;;;;;;;

	wait(0.25)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	;StopDragon bits fxs
	DragonHolesBitsFXS.Stop(dragonRef)
	DragonHolesBitsLiteFXS.Stop(dragonRef)		
	;Stop holes fx shader now that main dragon skin is un-worn
	DragonHolesFXS.Stop(dragonRef)
	
	; Play light emitting magic shader on dragon
;;	DragonHolesLightFXS.Play(dragonRef)

	wait(1.8)
	;unequipp invisible art
	if dragonRef.IsEquipped(DragonBloodHeadFXArmor) == true
		dragonRef.unEquipItem(DragonBloodHeadFXArmor)
	endif
	if dragonRef.IsEquipped(DragonBloodTailFXArmor) == true
		dragonRef.unEquipItem(DragonBloodTailFXArmor)
	endif
	if dragonRef.IsEquipped(DragonBloodWingLFXArmor) == true
		dragonRef.unEquipItem(DragonBloodWingLFXArmor)
	endif
	if dragonRef.IsEquipped(DragonBloodWingRFXArmor) == true
		dragonRef.unEquipItem(DragonBloodWingRFXArmor)
	endif
	
	;display dragon absorb effect art. One part on dragon one part on player.
	DragonAbsorbEffect.Play(dragonRef, 8, AbsorbActor) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor
;;	dragonRef.placeAtME(MAGDragonPowerAbsorbExplosion)
	DragonAbsorbManEffect.Play(AbsorbActor, 8, dragonRef) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor
	
	; Sounds for when the wispy particles being to fly at the player.
	NPCDragonDeathSequenceWind.play(dragonRef) 
	NPCDragonDeathSequenceExplosion.play(dragonRef) 
	
	wait(0.1)
		
	; On man power absorb effect shader.
	DragonPowerAbsorbFXS.Play(AbsorbActor) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor


	if AbsorbActor == Game.GetPlayer() ;***DLC2	
		wait(1)
		; turn off remaining effect bits and magic leak fxshaders

		wait(1)

	Endif

	; ghost the dragon so you can't hit him
	dragonRef.SetGhost(true)
		
	;clear any arrows that may have been stuck in dragon	
	dragonRef.clearExtraArrows()
	

;;

	if AbsorbActor == Game.GetPlayer() ;***DLC2
		wait(4)
	else
		wait(3)
	endif

	;Stop fx shader on player showing power absorb.	
	DragonPowerAbsorbFXS.Stop(AbsorbActor) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor
	
	; End sound of dragon carcass bursting into flames.
	StopInstance(soundInstanceFireID)
	
	; add lingering smoke and glow to dragon carcass.
	DragonHolesSmokeFXS.Play(dragonRef)	
	
	; Start sound for smoldering dragon
	int soundInstanceSmolderID = NPCDragonDeathSequenceSmolderLPM.play(dragonRef) 


	if AbsorbActor == Game.GetPlayer() ;***DLC2
		wait(4)
	endif

	;*** CHANGED FOR DLC2--------------------------------------------------------

	if AbsorbActor == GetPlayer()
		; increment dragon count
		DragonsAbsorbed.value = DragonsAbsorbed.value + 1

		; add dragonsoul point to player
		AbsorbActor.modActorValue("dragonsouls", VoicePointsReward) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor

		; do this right now for MQ104 dragon:
		if !MQ104.GetStageDone(90) && MQ104.IsRunning()
; 	; 		debug.trace(self + " setting MQ104 stage 90")
			MQ104.SetStage(90)
		endif
	
	elseif game.getPlayer().isInLocation(DLC2ApocryphaLocation)
		DLC2BossBattleScript = DLC2MQ06MiraakAlias as DLC2MQ06MiraakBossBattle
		DLC2BossBattleScript.MiraakStealsSoul()
	else
		;MIRAAK STOLE THE SOUL!!!
		DLC2SoulSteal.FinishStealingSoul()

	endif

	TryMiraakMakeHisIntroduction(DragonRef)

	;-------------------------------------------------------------------------------

	; turn off effect shaders for smoldering carcass
	DragonHolesSmokeFXS.Stop(dragonRef)
	
	; Get rid of art attached to dragon and player showing streaming magic.
	DragonAbsorbEffect.Stop(dragonRef)
	DragonAbsorbManEffect.Stop(AbsorbActor) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor

	if AbsorbActor == Game.GetPlayer() ;***DLC2
		wait(4)
	endif

	;Stop smoldering sound
	StopInstance(soundInstanceSmolderID)

	; put dragon in faction so other quests know player has absorbed power
	dragonRef.addtoFaction(MQKillDragonFaction)
	
	;Stop light emitting magic shader on dragon
	DragonHolesLightFXS.Stop(dragonRef)
	
	;*** WORLD INTERACTION FUNCTION -- jduvall
	WI.PlayerIsDoneAbsorbingPower(dragonRef)
	
	dragonRef.EquipItem(SkinDragonHider, true)
	
	bIsAbsorbing = false
	
endFunction

WIFunctionsScript Property WI Auto
{Pointer to WIFunctionsScript on WI quest. Used to call functions so that the dialogue in the scene in WIDragonKill quest is aware of when the player is aborbing and done absorbing the dragon's power.}

GlobalVariable Property DragonsAbsorbed  Auto  

Armor Property DragonUnderskin  Auto   

Faction Property MQKillDragonFaction  Auto  

int Property VoicePointsReward = 1 Auto  
{how many soul points to give player}



VisualEffect Property DragonAbsorbEffect Auto
VisualEffect Property DragonAbsorbManEffect Auto
VisualEffect Property FXDragonDeathLHandBits Auto
VisualEffect Property FXDragonDeathLHandFire Auto
VisualEffect Property FXDragonDeathRHandBits Auto
VisualEffect Property FXDragonDeathRHandFire Auto
;VisualEffect Property DragonDeadswapHide  Auto
;VisualEffect Property DragonDeadswap Auto

EffectShader Property DragonHolesFXS Auto
EffectShader Property DragonHolesBitsFXS Auto
EffectShader Property DragonHolesBitsLiteFXS Auto
EffectShader Property DragonPowerAbsorbFXS Auto
EffectShader Property DragonHolesSmokeFXS Auto
EffectShader Property DragonHolesMagicFXS Auto
EffectShader Property DragonHolesLightFXS Auto

ImageSpaceModifier Property DragonPowerAbsorbISM Auto

sound property NPCDragonDeathSequenceFireLPM auto
sound property NPCDragonDeathSequenceWind auto
sound property NPCDragonDeathSequenceExplosion auto
sound property NPCDragonDeathSequenceSmolderLPM auto

Armor Property DragonBloodHeadFXArmor  Auto  
Armor Property DragonBloodTailFXArmor  Auto  
Armor Property DragonBloodWingLFXArmor  Auto  
Armor Property DragonBloodWingRFXArmor  Auto  
Armor Property SkinDragonHider Auto

Explosion Property MAGDragonPowerAbsorbExplosion Auto

Faction Property NoDragonAbsorb  Auto  
{no death sequence if in this faction}

bool Property bIsAbsorbing  Auto  Conditional
{true while the absorb sequence is running}

Quest Property MQ104  Auto  




;Added for DLC-------------------------------------------
;Everything below this is a rework for Miraak's soul steal in
;the apocrypha boss fight
DLC2SoulStealScript Property DLC2SoulSteal  Auto  
Actor Property DLC2MiraakMQ06Ref Auto
Location Property DLC2ApocryphaLocation Auto
Worldspace Property DLC2ApocryphaWorld Auto
ReferenceAlias Property DLC2MQ06MiraakAlias Auto
DLC2MQ06MiraakBossBattle Property DLC2BossBattleScript Auto hidden
   

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  ALTERNATE VERSION OF THE DEATH SEQUENCE FOR MQ06
;		This absorbes the soul much faster
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


function MQ06DeathSequence(Actor dragonRef, Actor AbsorbActor = None, bool MiraakAppears = False)
;ADDED "Actor AbsorbActor = none, bool MiraakAppears = false" FOR DLC2

	if dragonRef.IsInFaction(NoDragonAbsorb)
		return
	endif

	; Add Skeleton to dragon's inventory.
	dragonRef.AddItem(DragonUnderskin)	

	; Dragon wings particles bits

	FXDragonDeathLHandBits.Play(dragonRef, 12)
	FXDragonDeathRHandBits.Play(dragonRef, 12)
	
	
	;wait(0.2)
	
	;Equip skeleton under skin
	dragonRef.EquipItem(DragonUnderskin)
	;wait(0.5)	
	dragonRef.PlaySubGraphAnimation("UnderSkinFadeOut")	

;**************************************************************************
;		This is the bit that plays the absorb stuff, needed to move it up for Miraak
	;display dragon absorb effect art. One part on dragon one part on player.
	DragonAbsorbEffect.Play(dragonRef, 8, AbsorbActor) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor
;;	dragonRef.placeAtME(MAGDragonPowerAbsorbExplosion)
	DragonAbsorbManEffect.Play(AbsorbActor, 8, dragonRef) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor
	
	; Sounds for when the wispy particles being to fly at the player.
	NPCDragonDeathSequenceWind.play(dragonRef) 
	NPCDragonDeathSequenceExplosion.play(dragonRef) 

	DLC2BossBattleScript = DLC2MQ06MiraakAlias as DLC2MQ06MiraakBossBattle
	DLC2BossBattleScript.MiraakStealsSoul()
	DLC2SoulSteal.ModDLC2SoulStealCount(1)
	;wait(0.1)
		
	; On man power absorb effect shader.
	DragonPowerAbsorbFXS.Play(AbsorbActor) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor
	
	;wait(1)
	; turn off remaining effect bits and magic leak fxshaders

	
	;wait(1)
	; ghost the dragon so you can't hit him
	dragonRef.SetGhost(true)
		
	;clear any arrows that may have been stuck in dragon	
	dragonRef.clearExtraArrows()
	

;;

	;wait(4)

	;Stop fx shader on player showing power absorb.	
	DragonPowerAbsorbFXS.Stop(AbsorbActor) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor
	
	
;**************************************************************************
	;*** CHANGED FOR DLC2--------------------------------------------------------


	


	;TryMiraakMakeHisIntroduction(DragonRef)

	;-------------------------------------------------------------------------------

	;*** WORLD INTERACTION FUNCTION -- jduvall
	;WI.PlayerIsCurrentlyAbsorbingPower(dragonRef)
	bIsAbsorbing = true
		
	; Start effect shader decorating holes in the base skin
	DragonHolesFXS.Play(dragonRef)
	; Play disintegrating skin.
	dragonRef.PlaySubGraphAnimation( "SkinFadeOut" )
;;;
	; Play imagespace modifier which is timed to match sequence.
	DragonPowerAbsorbISM.Apply()

	; Sound of dragon carcass first bursts into flames until the flames die off. Must be turned off
	int soundInstanceFireID = NPCDragonDeathSequenceFireLPM.play(dragonRef) 
	
	wait(1)
	
	;Small bits rising from dragon fx shader.
	DragonHolesBitsLiteFXS.Play(dragonRef)
	
	wait(1)
	;Bigger bits rising from dragon fx shader.
	DragonHolesBitsFXS.Play(dragonRef)
	
	wait(2)
	

	
	wait(1.75)
	;Play blood fade out if it is there
	dragonRef.PlaySubGraphAnimation("BloodFade")
	
	; Magic particles on wings
	FXDragonDeathRHandFire.Play(dragonRef, 12)
	FXDragonDeathLHandFire.Play(dragonRef, 12)
	
	wait(1.0)
	; magic fire fx shader
	DragonHolesMagicFXS.Play(dragonRef)
	DragonHolesMagicFXS.Stop(dragonRef);;;;;;;;;;;;;;;;;;;;;;;;

	wait(0.25)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	;StopDragon bits fxs
	DragonHolesBitsFXS.Stop(dragonRef)
	DragonHolesBitsLiteFXS.Stop(dragonRef)		
	;Stop holes fx shader now that main dragon skin is un-worn
	DragonHolesFXS.Stop(dragonRef)
	
	; Play light emitting magic shader on dragon
;;	DragonHolesLightFXS.Play(dragonRef)

	wait(1.8)
	;unequipp invisible art
	if dragonRef.IsEquipped(DragonBloodHeadFXArmor) == true
		dragonRef.unEquipItem(DragonBloodHeadFXArmor)
	endif
	if dragonRef.IsEquipped(DragonBloodTailFXArmor) == true
		dragonRef.unEquipItem(DragonBloodTailFXArmor)
	endif
	if dragonRef.IsEquipped(DragonBloodWingLFXArmor) == true
		dragonRef.unEquipItem(DragonBloodWingLFXArmor)
	endif
	if dragonRef.IsEquipped(DragonBloodWingRFXArmor) == true
		dragonRef.unEquipItem(DragonBloodWingRFXArmor)
	endif

	; End sound of dragon carcass bursting into flames.
	StopInstance(soundInstanceFireID)
;***********************************************************************

	; add lingering smoke and glow to dragon carcass.
	DragonHolesSmokeFXS.Play(dragonRef)	
	
	; Start sound for smoldering dragon
	int soundInstanceSmolderID = NPCDragonDeathSequenceSmolderLPM.play(dragonRef) 

	wait(4)

;*** --------------------------------------------------------------------------


	; turn off effect shaders for smoldering carcass
	DragonHolesSmokeFXS.Stop(dragonRef)
	
	; Get rid of art attached to dragon and player showing streaming magic.
	DragonAbsorbEffect.Stop(dragonRef)
	DragonAbsorbManEffect.Stop(AbsorbActor) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor

	wait(4)
	
	;Stop smoldering sound
	StopInstance(soundInstanceSmolderID)

	; put dragon in faction so other quests know player has absorbed power
	dragonRef.addtoFaction(MQKillDragonFaction)
	
	;Stop light emitting magic shader on dragon
	DragonHolesLightFXS.Stop(dragonRef)
	
	;*** WORLD INTERACTION FUNCTION -- jduvall
	WI.PlayerIsDoneAbsorbingPower(dragonRef)
	
	dragonRef.EquipItem(SkinDragonHider, true)
	
	bIsAbsorbing = false
	
endFunction

;---------------------------------------------------------