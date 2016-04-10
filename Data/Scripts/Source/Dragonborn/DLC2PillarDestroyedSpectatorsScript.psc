Scriptname DLC2PillarDestroyedSpectatorsScript extends Quest  
{Script on DLC2PillarDestroyedSpectators quest}

ReferenceAlias[] Property SpectatorAliasArray auto

Faction Property DLC2PillarBuilderFaction auto

Event OnUpdateGameTime()
; 	Debug.Trace(self + "OnGameTimeUpdate() calling Stop()")
	Stop()
EndEvent

Function RemoveAliasesFromBuilderFaction()
	int index = 0
	int maxsize = SpectatorAliasArray.length
	while (index < maxSize)
		ReferenceAlias CurrentAlias = SpectatorAliasArray[index]
		Actor CurrentActor = CurrentAlias.GetActorReference()
; 		Debug.Trace(self + "RemoveAliasesFromBuilderFaction() CurrentAlias: " + CurrentAlias + ", CurrentActor: " + CurrentActor)
		if CurrentAlias && CurrentActor
; 			Debug.Trace(self + "Removing CurrentActor from DLC2PillarBuilderFaction and EVPing")
			CurrentActor.RemoveFromFaction(DLC2PillarBuilderFaction)
			CurrentActor.EvaluatePackage()
		endif
		index += 1
	endwhile
EndFunction

Function EVPAliases(bool AndStopCombat = false)
	int i = 0
	while (i < SpectatorAliasArray.length)
		Actor CurrentActor = SpectatorAliasArray[i].GetActorReference()

		CurrentActor.EvaluatePackage()

		if AndStopCombat
			CurrentActor.StopCombat()
			CurrentActor.StopCombatAlarm()
		endif

		i += 1
	endwhile
EndFunction