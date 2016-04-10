ScriptName DLC2dunKarstaagBattleTriggerScript extends ObjectReference
{Script to control the music for Karstaag's battle and reset him when necessary.}

MusicType property DLC2MUSCombatKarstaag Auto
ReferenceAlias property Karstaag Auto
bool busy
bool battleOn

Function StartBattle()
; 	;Debug.Trace("StartBattle Called")
	Self.Enable()
	;Self.OnTriggerEnter(Game.GetPlayer())
EndFunction

Function KarstaagKilled()
; 	;Debug.Trace("KarstaagKilled Called")
	GoToState("Ending")
	;Remove Karstaag combat music.
	DLC2MUSCombatKarstaag.Remove()
	;Re-enable fast travel.
	Game.EnableFastTravel(True)
	Self.Disable()
EndFunction

Function ResetBattle()
	;In the empty state, do nothing.
EndFunction

Auto State Normal
	Event OnTriggerEnter(ObjectReference triggerRef)
; 		Debug.Trace("TriggerEnter: " + triggerRef + ", " + battleOn)
		if (triggerRef == Game.GetPlayer())
			if (battleOn)
; 				Debug.Trace("Ignoring a quick entry/exit by the player.")
				UnregisterForUpdate()
			Else
				battleOn = True
			
				;Add Karstaag combat music.
				DLC2MUSCombatKarstaag.Add()
				
				;Block fast travel.
				Game.EnableFastTravel(False)
			
				;Start Karstaag battle.
				(Karstaag as DLC2dunKarstaagBattleScript).StartBattle()
			EndIf
		EndIf
	EndEvent
	
	Event OnTriggerLeave(ObjectReference triggerRef)
; 		;Debug.Trace("TriggerLeave: " + triggerRef + ", " + battleOn)
		if (triggerRef == Game.GetPlayer() && battleOn)
			;Wait for 30s, since the knockback effect counts as leaving the trigger.
			RegisterForSingleUpdate(20)
		EndIf	
	EndEvent
	
	Event OnUpdate()
; 		Debug.Trace("Karstaag Battle trigger forces a reset.")
		ResetBattle()
	EndEvent
	
	Function ResetBattle()
; 		Debug.Trace("Resetting the battle.")
		battleOn = False
		UnregisterForUpdate()
				
		;Remove Karstaag combat music.
		DLC2MUSCombatKarstaag.Remove()
			
		;Reenable fast travel.
		Game.EnableFastTravel(True)
				
		;Disable Karstaag and reset the battle.
		(Karstaag as DLC2dunKarstaagBattleScript).ResetBattle()
	EndFunction
EndState

State Ending
	Event OnTriggerEnter(ObjectReference triggerRef)
		;Do nothing.
	EndEvent
	
	Event OnTriggerLeave(ObjectReference triggerRef)
		;Do nothing.
	EndEvent
		
	Event OnUpdate()
		;Do nothing.
	EndEvent
	
	Function ResetBattle()
		;Do nothing.
	EndFunction
EndState