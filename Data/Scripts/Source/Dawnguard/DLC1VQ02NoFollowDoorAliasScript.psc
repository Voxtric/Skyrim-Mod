Scriptname DLC1VQ02NoFollowDoorAliasScript extends referenceAlias  
{block activation by non-quest NPCs to keep followers out}

;This is removed because the quest is handling it.
;Event OnInit()

;	BlockActivation()

;EndEvent

bool Property BlockWerewolves = false auto
Quest Property PlayerWerewolfQuest auto
MagicEffect Property WerewolfChangeEffect auto
bool property isMainDoor = false auto

auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		goToState("Busy")
		; only do this check if activation is blocked
		if getReference().IsActivationBlocked() == false
	; 		debug.trace(self + "OnActivate " + akActionRef + " - not blocked, normal activation")
			return
		endif


		if (akActionRef == Game.GetPlayer())
			if (akActionRef as actor).HasMagicEffect(WerewolfChangeEffect) || PlayerWerewolfQuest.IsRunning()
				Game.DisablePlayerControls(abMovement = false, abFighting = true, abCamSwitch = false, abLooking = false, abSneaking = false, abMenu = true, abActivate = false, abJournalTabs = false)
				(PlayerWerewolfQuest as PlayerWerewolfChangeScript).ShiftBack()
				;utility.wait(1.0)
				getReference().Activate(akActionRef, true)
			elseif isMainDoor
				getReference().Activate(akActionRef, true)
			endif
	; 		debug.trace(self + "OnActivate - player, allow activation")
			;if (!BlockWerewolves || !PlayerWerewolfQuest.IsRunning())
			;	getReference().Activate(akActionRef, true)
			;endif
		else
			Actor actorRef = akActionRef as Actor
	; 		;debug.trace(self + "OnActivate - " + actorRef)
			if actorRef && (actorRef.isInFaction( AllowDoorFaction01) || actorRef.isInFaction(AllowDoorFaction02) || actorRef.isInFaction(AllowDoorFaction03) || (myQuest && myQuest.GetStageDone(myQuestStage) == 1))
	; 			debug.trace(self + "OnActivate - " + actorRef + ": allow activation")
				getReference().Activate(akActionRef, true)
			else		
	; 			debug.trace(self + "OnActivate - " + actorRef + ": activation BLOCKED")
				If DoOnce == 0
					FollowerBlockedMessage.Show()
					DoOnce = 1
				EndIf
			endif
		endif
		goToState("Waiting")
	EndEvent
endState

State Busy
endState

; factions that are allowed to use the door
Faction Property AllowDoorFaction01  Auto  

Faction Property AllowDoorFaction02  Auto  

Faction Property AllowDoorFaction03  Auto 

Quest Property myQuest Auto

Int Property myQuestStage Auto 

Message Property FollowerBlockedMessage Auto 

Int Property DoOnce Auto