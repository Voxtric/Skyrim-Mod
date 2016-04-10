ScriptName DLC2dunKarstaagSummonScript extends Actor
{Script that lives on and manages the summoned Karstaag.}

ReferenceAlias property ConjuredKarstaag Auto
Spell property DLC2dunKarstaagFrostCloak auto
Spell property DLC2dunKarstaagBlizzard auto
Spell property DLC2dunKarstaagConjureIceWraith auto
Scene property DLC2dunKarstaagQST_Blizzard auto
Scene property DLC2dunKarstaagQST_IceWraiths auto
Actor property IceWraith01 Auto
Actor property IceWraith02 Auto
bool blizzardNextUpdate

Event OnLoad()
; 	;Debug.Trace("Karstaag was summoned.")
	ConjuredKarstaag.ForceRefTo(Self)
	DLC2dunKarstaagQST_Blizzard.Start()
	;Blizzard---
	blizzardNextUpdate = True					;Trigger initial blizzard.
	Self.RegisterForAnimationEvent(Self, "SoundPlay.NPCGiantAttackStomp")	;Register for future giant stomp events so we can trigger a blizzard then, too.
	;Frost Cloak---
	DLC2dunKarstaagFrostCloak.Cast(Self, Self)	;Trigger initial frost cloak.
	;Ice Wraiths---
	Self.SetAV("Variable07", 1)	;Turn on the 'summon ice wraiths on next update' flag.
	RegisterForSingleUpdate(0.01)	;Register for an update.
EndEvent

Event OnUpdate()
; 	;Debug.Trace("Karstaag Update Event")
	;Blizzard: Variable06 controls a knockback effect on Karstaag's frost cloak. Disable it whenever we update.
	if (blizzardNextUpdate)
		blizzardNextUpdate = False
		DLC2dunKarstaagBlizzard.Cast(Self, Self)
		Self.SetAV("Variable06", 1)
		RegisterForSingleUpdate(1)
		Return
	ElseIf (Self.GetAV("Variable06") == 1)
		Self.SetAV("Variable06", 0)
	EndIf
	;Ice Wraiths: Variable07 records a request that we summon ice wraiths at the next opportunity. Do so if necessary.
	if ((IceWraith01 == None || IceWraith01.IsDead() || IceWraith01.IsDisabled()) && \
		(IceWraith02 == None || IceWraith02.IsDead() || IceWraith02.IsDisabled()) && \
		!DLC2dunKarstaagQST_IceWraiths.IsPlaying() && !DLC2dunKarstaagQST_Blizzard.IsPlaying())
		RequestIceWraithSummon()
	EndIf
	;Register for an update in a while. Other functions may force a re-registration sooner.
	RegisterForSingleUpdate(10)
EndEvent


;-----------------------------------
;Blizzard
;--------

;Cast Blizzard on each Giant Stomp.
Event OnAnimationEvent(ObjectReference source, String eventName)
; 	;Debug.Trace("AnimEvent: " + eventName + " received.")
	if (eventName == "SoundPlay.NPCGiantAttackStomp")
		DLC2dunKarstaagBlizzard.Cast(Self, Self)
		Self.SetAV("Variable06", 1)
		UnregisterForUpdate()
		RegisterForSingleUpdate(1)
	EndIf
EndEvent


;-----------------------------------
;Ice Wraiths
;-----------

;Trigger a scene in which Karstaag calls for his ice wraiths...
Function RequestIceWraithSummon()
; 	;Debug.Trace("Triggering scene")
	if ((IceWraith01 == None || IceWraith01.IsDead()) && (IceWraith02 == None || IceWraith02.IsDead()))
		DLC2dunKarstaagQST_IceWraiths.Start()
	EndIf
EndFunction

;...which, when finished, calls back here to summon them in.
Function SummonIceWraiths()
; 	;Debug.Trace("Summoning")
	if ((IceWraith01 == None || IceWraith01.IsDead()) && (IceWraith02 == None || IceWraith02.IsDead()))
		DLC2dunKarstaagConjureIceWraith.Cast(Self, Self)
		if (Utility.RandomInt(0, 1) > 0)
			DLC2dunKarstaagConjureIceWraith.Cast(Self, Self)
		EndIf
	EndIf
EndFunction

Function RecordIceWraith(Actor newIceWraith)
; 	;Debug.Trace("RecordIceWraith called")
	if (IceWraith01 == None || IceWraith01.IsDead())
		IceWraith01 = newIceWraith
	ElseIf (IceWraith02 == None || IceWraith02.IsDead())
		IceWraith02 = newIceWraith
	Else
; 		Debug.Trace("ERROR - Karstaag summoned more than two ice wraiths!")
	EndIf
EndFunction