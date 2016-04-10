Scriptname DLC2SoulStealScript extends Quest conditional
{Script attached to DLC2SoulSteal quest}

ReferenceAlias Property Player auto
ReferenceAlias Property Miraak auto
ReferenceAlias Property Dragon auto

Scene Property DLC2SoulStealScene auto

Message Property DLC2SoulStealMsg auto

MQKillDragonScript Property MQKillDragon auto

quest property DLC2MQ02 auto
quest Property DLC2MQ06 auto

MQGreybeardAbsorbScript property MQ105 auto

bool Property TestMiraak auto ;if true, then ShouldMiraakAppear() always returns true
{If true, he always appears when player kills a dragon}

GlobalVariable Property DLC2SoulStealCount auto  ;if miraak steals soul this goes up one, goes back down if player takes it back

bool fightPlayer conditional ;while this is true he will fight the player before disappearing, when this is false, he will disappear when done straling soul

bool MiraakStoleSoul conditional ;scene got to the point where Miraak started to steal the soul

int secondsBeforeGivingUp = 120 ;houw many seconds until we give up if Miraak hasn't started absorbing the soul

bool apprearedOnce

WordOfPower Property DLC2BendToWillWord1 auto

bool MiraakMadeHisIntroduction
quest property DLC2MQ01 auto
quest Property MQ104 auto

Faction Property MQNoDragonAbsorb auto

; for Greybeard effect
VisualEffect Property FXGreybeardAbsorbEffect Auto
EffectShader Property GreybeardPowerAbsorbFXS Auto
EffectShader Property GreybeardPlayerPowerAbsorbFXS Auto
sound property NPCDragonDeathSequenceWind auto
sound property NPCDragonDeathSequenceExplosion auto



Event OnUpdate()
; 	Debug.Trace(self + "OnUpdate()")
	if MiraakStoleSoul == false
		DLC2SoulStealScene.Stop()
	endif
EndEvent

Function StartTimer()
; 	Debug.Trace(self + "StartTimer()")
	RegisterForSingleUpdate(secondsBeforeGivingUp)
EndFunction

Function EndTimer()
	unregisterForUpdate()
; 	Debug.Trace(self + "EndTimer()")
EndFunction

bool Function TryMiraakMakeHisIntroduction(Actor DragonRef)

	bool returnVar = false

; 	Debug.Trace(self + "TryMiraakMakeHisIntroduction() -- ALWAYS RETURNS FALSE NOW")

;	if MiraakMadeHisIntroduction == false && MQ104.GetStage() >=150 && Game.GetPlayer().IsInCombat() == false && DragonRef.isInFaction(MQNoDragonAbsorb) == false
;		MiraakMadeHisIntroduction = true
;		returnVar = true
;		Debug.Trace(self + "TryMiraakMakeHisIntroduction() Miraak is going to make his introductory appearance, calling setStage 0 on DLC2MQ01")
;		DLC2MQ01.SetStage(0)
;	endif	
;
;	Debug.Trace(self + "TryMiraakMakeHisIntroduction() returning: " + returnVar)

	RETURN returnVar

EndFunction

bool Function ShouldMiraakAppear(Actor DragonRef)
; 	Debug.Trace(self + "ShouldMiraakAppear() checking quest stages and other logic")

	bool returnVar = false
	int chanceToAppear = 25

	if DLC2MQ02.GetStage() >= 200 && DLC2MQ06.GetStage() < 500 && DragonRef.isInFaction(MQNoDragonAbsorb) == false
		if Game.IsWordUnlocked(DLC2BendToWillWord1) || Game.GetPlayer().GetActorValue("DragonSouls") > 0
			if Utility.RandomInt(1,100) <= chanceToAppear || apprearedOnce == false
				apprearedOnce = true
				returnVar = true
			endif
		endif
	endif

	if TestMiraak == true
; 		Debug.Trace(self + "ShouldMiraakAppear() -- TestMiraak == true, so forcing returnVar to true")
		returnVar = true
	endif

; 	Debug.Trace(self + "ShouldMiraakAppear() returning: " + returnVar)
	return returnVar
	
EndFunction

Function MiraakAppears(ObjectReference DragonRef)
; 	Debug.Trace(self + "MiraakAppears()" + DragonRef)
	Dragon.ForceRefTo(DragonRef)

	DLC2MiraakScript MiraakRef = Miraak.GetReference() as DLC2MiraakScript
	MiraakRef.AppearAtRef = DragonRef
	MiraakRef.Appear()
	MiraakRef.SetNoBleedoutRecovery(true) 

	;clear tracking variables from previous incarnations
	fightPlayer = false
	MiraakStoleSoul = false	

	;START THE "TIMER"
	StartTimer()

	DLC2SoulStealScene.start()

EndFunction

Function MiraakDisappears()
; 	Debug.Trace(self + "MiraakDisappears()")
	DLC2MiraakScript MiraakRef = Miraak.GetReference() as DLC2MiraakScript
	MiraakRef.Disappear()
	MiraakRef.SetNoBleedoutRecovery(false)
	MiraakRef.RestoreAV("Health", 999999999)
	
	;if Miraak disappears before he stole the soul, put the dragon back in the state that lets the player steal it's soul
	if MiraakStoleSoul == false
		(Dragon.GetActorReference() as DragonActorScript).gotoState("deadAndWaiting")
	endif

EndFunction

Function StealSoul()
	EndTimer()
; 	Debug.Trace(self + "StealSoul()")
	MiraakStoleSoul = true
	ModDLC2SoulStealCount(1)
	MQKillDragon.DeathSequence(Dragon.GetActorReference(), Miraak.GetActorReference())
EndFunction

Function FinishStealingSoul()
; 	Debug.Trace(self + "FinishStealingSoul()")
	DLC2SoulStealMsg.show()
EndFunction

Function PlayerAttackedMiraak()
	EndTimer()
; 	Debug.Trace(self + "PlayerAttackedMiraak()")
	fightPlayer = true
	
EndFunction

Function PlayerTakesSoulBack()
; 	Debug.Trace(self + "PlayerTakesSoulBack()")
	utility.wait(1)
	AbsorbSoulFromMiraak(Miraak.GetActorReference())
	Game.GetPlayer().modActorValue("dragonsouls", 1)
	ModDLC2SoulStealCount(-1)
EndFunction

Function ModDLC2SoulStealCount(int amountToMod)
; 	Debug.Trace(self + "ModDLC2SoulStealCount()")
	DLC2SoulStealCount.setValue(DLC2SoulStealCount.GetValue() + amountToMod)
EndFunction

Function MiraakDetached()
; 	Debug.Trace(self + "MiraakDetached()")
	if DLC2SoulStealScene.IsPlaying()
; 		Debug.Trace(self + "MiraakDetached() DLC2SoulStealScene is playing, calling stop()")
		DLC2SoulStealScene.Stop()
	endif
EndFunction


;CRIBBED FROM MQGreybeardAbsorbScript "AbsorbSoul()"
function AbsorbSoulFromMiraak(Actor target)
; 	Debug.Trace(self + "AbsorbSoulFromMiraak()")

	Actor PlayerRef = Game.GetPlayer()

    ;Play art and fx shaders on player and targeted grybeard
    FXGreybeardAbsorbEffect.Play(target, 7, PlayerRef)
    GreybeardPowerAbsorbFXS.Play(target)
	GreybeardPlayerPowerAbsorbFXS.Play(PlayerRef)

	; Sounds for when the wispy particles being to fly at the player.
	NPCDragonDeathSequenceWind.play(target) 
	NPCDragonDeathSequenceExplosion.play(target) 

	utility.wait(7)

	;remove magic shaders
	GreybeardPowerAbsorbFXS.Stop(target)
	GreybeardPlayerPowerAbsorbFXS.Stop(PlayerRef)

EndFunction

