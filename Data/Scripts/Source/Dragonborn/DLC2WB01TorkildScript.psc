Scriptname DLC2WB01TorkildScript extends ReferenceAlias  

Spell Property WerebearChange auto
Race Property DLC2WerebearBeastRace auto
ReferenceAlias Property Journal auto
ReferenceAlias Property RemoteSelf auto

Event OnDeath(Actor akKiller)
	GetOwningQuest().SetStage(15)
	GetReference().AddItem(Journal.GetReference())
EndEvent


Function Transform()
	Actor actorRef = GetActorReference()
	if (actorRef.IsDead())
		return
	endif

	(GetOwningQuest() as DLC2WB01QuestScript).TorkildTransformed = true

	WEAliasScript selfWEAlias = (RemoteSelf as WEAliasScript)
	selfWEAlias.DisableOnUnload = false
; 	Debug.Trace("DLC2WB01: Torkild's disable on unload should be false -- " + selfWEAlias.DisableOnUnload)


	actorRef.StopCombat()
	actorRef.StopCombatAlarm()
	WerebearChange.Cast(actorRef)

	Utility.Wait(20)
	FinishTransform()

EndFunction

Event OnRaceSwitchComplete()
	FinishTransform()
EndEvent

bool __finished = false
Function FinishTransform()
	if (__finished)
		return
	endif
	__finished = true

	Actor actorRef = GetActorReference()
	if (actorRef.IsDead())
		return
	endif

	if (GetActorReference().GetRace() != DLC2WerebearBeastRace)
		GetActorReference().SetRace(DLC2WerebearBeastRace)
	endif

	WEAliasScript selfWEAlias = (RemoteSelf as WEAliasScript)

	actorRef.SetAv("aggression", 3)
	actorRef.SetAv("confidence", 4)
	actorRef.StartCombat(Game.GetPlayer())

	selfWEAlias.DisableOnUnload = true
; 	Debug.Trace("DLC2WB01: Torkild's disable on unload should be true -- " + selfWEAlias.DisableOnUnload)	
EndFunction
