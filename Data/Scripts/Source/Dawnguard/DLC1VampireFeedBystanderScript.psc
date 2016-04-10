Scriptname DLC1VampireFeedBystanderScript extends Quest  

GlobalVariable Property DLC1VampireFeedStartTime  Auto  
GlobalVariable Property TimeScale  Auto  

referencealias Property Victim auto

referencealias[] Property BystanderAliasArray auto

Function CheckBystandersSendAlarmAndStopQuest()
	Debug.Trace(self + "CheckBystandersAlarmAndStopQuest())")

	Float StartTime = DLC1VampireFeedStartTime.GetValue()
	Float Now = utility.GetCurrentGameTime()
	Float Duration = Now - StartTime

	Float DurationInRealTimeSeconds = Duration/(24*60*60) * TimeScale.GetValue()

	Actor VictimRef = Victim.GetActorReference()
	Faction VictimCrimeFaction = VictimRef.GetCrimeFaction()

	Debug.Trace(self + "CheckBystandersAlarmAndStopQuest Start Time: " + StartTime)
	Debug.Trace(self + "CheckBystandersAlarmAndStopQuest Now: " + Now)
	Debug.Trace(self + "CheckBystandersAlarmAndStopQuest Duration: " + Duration)
	Debug.Trace(self + "CheckBystandersAlarmAndStopQuest DurationInRealTimeSeconds : " + DurationInRealTimeSeconds )
	Debug.Trace(self + "CheckBystandersAlarmAndStopQuest VictimRef: " + VictimRef)
	Debug.Trace(self + "CheckBystandersAlarmAndStopQuest Victim's Crime faction: " + VictimCrimeFaction) 
	Debug.Trace(self + "CheckBystandersAlarmAndStopQuest Will check if a bystander cares") 

	bool BystanderCares = CheckBystanders()

	Debug.Trace(self + "CheckBystandersAlarmAndStopQuest BystanderCares:" + BystanderCares) 

	if bystanderCares && DurationInRealTimeSeconds <= 30
	Debug.Trace(self + "CheckBystandersAlarmAndStopQuest calling VictimCrimeFaction.SendAssaultAlarm() because DurationInRealTimeSeconds <= 30")
	   VictimCrimeFaction.SendAssaultAlarm()
	else
		Debug.Trace(self + "CheckBystandersAlarmAndStopQuest NOT DOING ANYTHING because DurationInRealTimeSeconds > 30 OR BystanderCares == false")
	endif

	stop()

EndFunction


bool Function CheckBystanders()
;NOTE: The aliases already check relationship to player, if they are friends, they won't fill the aliases

	actor playerRef = Game.GetPlayer()

	int i = 0
	while (i < BystanderAliasArray.length)
		actor currentActor = BystanderAliasArray[i].GetActorReference()
		
		if currentActor

			Debug.Trace(self + "CheckBystanders() currentActor == " + currentActor)

			bool detected = playerRef.IsDetectedBy(currentActor)
			utility.wait(0.25) ;first time checking detection between non-hostiles doesn't work
			detected = playerRef.IsDetectedBy(currentActor)

			Debug.Trace(self + "CheckBystanders() detected?:" + detected + "-->" + currentActor)

			if detected 
				RETURN True
			endif

		else
			Debug.Trace(self + "CheckBystanders() only have empty aliases left, RETURNING FALSE")
			RETURN FALSE

		endif


		i += 1
	endwhile

	RETURN False

EndFunction