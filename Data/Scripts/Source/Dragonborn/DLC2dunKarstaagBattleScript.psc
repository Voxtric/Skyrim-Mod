ScriptName DLC2dunKarstaagBattleScript extends ReferenceAlias
{Script on Karstaag that manages the boss battle.}


Spell property DLC2dunKarstaagFrostCloak auto
Spell property DLC2dunKarstaagBlizzard auto
Spell property DLC2dunKarstaagConjureIceWraith auto
Quest property DLC2dunKarstaagQST auto

Static property DLC2dunKarstaagIceWraithSummonPoint1 Auto
Static property DLC2dunKarstaagIceWraithSummonPoint2 Auto
Static property DLC2dunKarstaagIceWraithSummonPoint3 Auto

Scene property DLC2dunKarstaagQST_Blizzard auto
Scene property DLC2dunKarstaagQST_IceWraiths auto

Actor selfActor
Actor IceWraith01
Actor IceWraith02
Actor IceWraith03

int property countIceWraithThreshold = 0 auto Hidden Conditional	;0=Not Used, 1=80%, 2=40%, 3=15%.

float blizzardTimer = 0.0
bool blizzardNextUpdate = False
bool busyResetting = False
bool restartUponReset = False


;-----------------------------------
;General Functionality
;---------------------

Event StartBattle()
; 	;Debug.Trace("StartBattle has been called.")
	if (busyResetting)
		restartUponReset = True
	Else
		restartUponReset = False
		selfActor = Self.GetActorRef()
		selfActor.Enable(True)
		;Blizzard---
		blizzardNextUpdate = True
		RegisterForSingleUpdate(0.01)
		DLC2dunKarstaagQST_Blizzard.Start()
		;Frost Cloak---
		DLC2dunKarstaagFrostCloak.Cast(selfActor, selfActor)
		;Anim Events---
		Utility.Wait(3)
; 		;Debug.Trace("Registering for Anim Events NEW.")
		Self.RegisterForAnimationEvent(selfActor, "NPCGiantFootDistantR")
	EndIf
EndEvent

Event ResetBattle()
	if (!busyResetting)
; 		;Debug.Trace("ResetBattle called.")
		busyResetting = True
		Self.UnregisterForAnimationEvent(selfActor, "NPCGiantFootDistantR")
		selfActor.DispelAllSpells()
		selfActor.SetAV("Variable06", 0)
		selfActor.StopCombat()
		selfActor.DisableNoWait(True)
		selfActor.MoveToMyEditorLocation()
		selfActor.RestoreAV("Health", 10000)
		selfActor.RestoreAV("Stamina", 10000)
		if (IceWraith01 != None)
			IceWraith01.Disable(True)
			IceWraith01.Delete()
		EndIf
		if (IceWraith02 != None)
			IceWraith02.DisableNoWait(True)
			IceWraith02.Delete()
		EndIf
		if (IceWraith03 != None)
			IceWraith03.DisableNoWait(True)
			IceWraith03.Delete()
		EndIf
		countIceWraithThreshold = 0
		busyResetting = False
		if (restartUponReset)
			StartBattle()
		EndIf
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
	if (IceWraith01 != None)
		IceWraith01.Kill()
	EndIf
	if (IceWraith02 != None)
		IceWraith02.Kill()
	EndIf
	if (IceWraith03 != None)
		IceWraith03.Kill()
	EndIf
	DLC2dunKarstaagQST.SetStage(30)
EndEvent

Event OnUpdate()
	;Blizzard: Variable06 controls a knockback effect on Karstaag's frost cloak. Disable it whenever we update.
	if (blizzardNextUpdate)
		blizzardNextUpdate = False
		blizzardTimer = Utility.GetCurrentRealTime()
		DLC2dunKarstaagBlizzard.Cast(selfActor, selfActor)
		selfActor.SetAV("Variable06", 1)
		RegisterForSingleUpdate(1)
	ElseIf (selfActor.GetAV("Variable06") == 1)
		selfActor.SetAV("Variable06", 0)
	EndIf
EndEvent


;-----------------------------------
;Blizzard
;--------

Event OnAnimationEvent(ObjectReference source, String eventName)
; 	;Debug.Trace("AnimEvent: " + eventName + " received.")
	if (eventName == "NPCGiantFootDistantR")
; 		;Debug.Trace("Triggering blizzard by stomp.")
		blizzardTimer = Utility.GetCurrentRealTime()
		DLC2dunKarstaagBlizzard.Cast(selfActor, selfActor)
		DLC2dunKarstaagFrostCloak.Cast(selfActor, selfActor)
		selfActor.SetAV("Variable06", 1)
		UnregisterForUpdate()
		RegisterForSingleUpdate(1)
	EndIf
EndEvent


;-----------------------------------
;Ice Wraiths
;-----------

Auto State Normal
	Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		GoToState("Busy")
		ProcessHit(aggressor)
		GoToState("Normal")
	EndEvent
EndState

State Busy
	Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;Do nothing.
	EndEvent
EndState

Function ProcessHit(ObjectReference aggressor)
	if (aggressor == Game.GetPlayer() && !DLC2dunKarstaagQST_IceWraiths.IsPlaying() && !DLC2dunKarstaagQST_Blizzard.IsPlaying())
		;Summon Ice Wraiths at 80%, 40%, 15%. Up to 3 may be active at a time.
		if (countIceWraithThreshold == 0 && selfActor.GetAVPercentage("Health") < 0.80)
			countIceWraithThreshold = countIceWraithThreshold + 1
			DLC2dunKarstaagQST_IceWraiths.Start()
		ElseIf (countIceWraithThreshold == 1 && selfActor.GetAVPercentage("Health") < 0.40)
			countIceWraithThreshold = countIceWraithThreshold + 1
			DLC2dunKarstaagQST_IceWraiths.Start()
		ElseIf (countIceWraithThreshold == 2 && selfActor.GetAVPercentage("Health") < 0.15)
			countIceWraithThreshold = countIceWraithThreshold + 1
			DLC2dunKarstaagQST_IceWraiths.Start()
		EndIf
	EndIf
EndFunction

Function SummonIceWraiths()
; 	;Debug.Trace("Summon Ice Wraiths Function Called")
	if (IceWraith01 == None || IceWraith01.IsDisabled() || IceWraith01.IsDead())
		DLC2dunKarstaagConjureIceWraith.Cast(selfActor, Game.FindRandomReferenceOfTypeFromRef(DLC2dunKarstaagIceWraithSummonPoint1, selfActor, 3000))
	EndIf
	if (IceWraith02 == None || IceWraith02.IsDisabled() || IceWraith02.IsDead())
		DLC2dunKarstaagConjureIceWraith.Cast(selfActor, Game.FindRandomReferenceOfTypeFromRef(DLC2dunKarstaagIceWraithSummonPoint2, selfActor, 3000))
	EndIf
	if (IceWraith03 == None || IceWraith03.IsDisabled() || IceWraith03.IsDead())
		DLC2dunKarstaagConjureIceWraith.Cast(selfActor, Game.FindRandomReferenceOfTypeFromRef(DLC2dunKarstaagIceWraithSummonPoint3, selfActor, 3000))
	EndIf
EndFunction

Function RecordIceWraith(ObjectReference wraith)
	if (!selfActor.IsDead())
		if (IceWraith01 == None || IceWraith01.IsDead())
			IceWraith01 = wraith as Actor
		ElseIf (IceWraith02 == None || IceWraith02.IsDead())
			IceWraith02 = wraith as Actor
		ElseIf (IceWraith03 == None || IceWraith03.IsDead())
			IceWraith03 = wraith as Actor
		EndIf
	EndIf
EndFunction