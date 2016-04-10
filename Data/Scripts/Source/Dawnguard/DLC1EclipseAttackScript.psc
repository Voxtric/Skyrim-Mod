Scriptname DLC1EclipseAttackScript extends Quest  

DLC1RadiantScript Property DLC1Radiant  Auto  

ReferenceAlias[] Property SpawnPointAliases auto
ReferenceAlias[] Property AttackerAliases auto

GlobalVariable property GameDaysPassed auto
GlobalVariable property DLC1EclipseAttackNextWait auto  ;next allowed is today + This
GlobalVariable property DLC1EclipseAttackNextAllowed auto ;today + NextWait

GlobalVariable property DLC1EclipseAttackNextChanceEclipse auto ;starts at 100, then drops to 25
GlobalVariable property DLC1EclipseAttackNextChanceNight auto ;starts at 100, then drops to 5

GlobalVariable property DLC1EclipseAttackNextGauranteed auto ;next time we should make sure this happens - today + NextMaxWait
GlobalVariable property DLC1EclipseAttackNextMaxWait auto ;today + this

GlobalVariable Property DLC1EclipseActive auto

Quest Property DLC1VQ01MiscObjective auto

GlobalVariable Property DLC1EclipseAttackGuardHellos  Auto  
{global to turn on guard hellos}


Function MoveAndEnableAttackersToFathestSpawnPointAlias()
	Debug.Trace(self + "MoveAndEnableAttackersToFathestSpawnPointAlias()")
	MoveAliasesToRef(GetFarthestAliasFromPlayer())
EndFunction

objectReference Function GetFarthestAliasFromPlayer()
	int index = 0

	float farthestDistance
	ObjectReference farthestRef

	ObjectReference PlayerRef = Game.GetPlayer()

	while (index < SpawnPointAliases.Length)
		
		if SpawnPointAliases[index]
			ObjectReference currentRef = SpawnPointAliases[index].GetReference()
			float distance = currentRef.GetDistance(PlayerRef)

			if distance > farthestDistance
				farthestDistance = distance
				farthestRef = currentRef

			endif

		endif
		index += 1
	endwhile

	RETURN farthestRef

EndFunction

Function MoveAliasesToRef(ObjectReference RefToMoveTo)
	Debug.Trace(self + "MoveAliasesToRef() AttackerAliases.Length == " + AttackerAliases.Length)
	int index = 0
		while (index < AttackerAliases.Length)
			Debug.Trace(self + "MoveAliasesToRef() index: " + index + ", alias: " + AttackerAliases[index] + ", reference: " + AttackerAliases[index].GetReference())
			AttackerAliases[index].TryToMoveTo(RefToMoveTo)
			AttackerAliases[index].TryToEnable()
			index += 1
		endwhile	

EndFunction

function SetControllingGlobals()
	SetNextAllowed()
	SetNextChance()
	SetNextGauranteed()
EndFunction

Function SetNextAllowed()
	DLC1EclipseAttackNextAllowed.SetValue(GameDaysPassed.GetValue() + DLC1EclipseAttackNextWait.GetValue())
EndFunction

Function SetNextChance()


	int NewChance

	if DLC1EclipseActive.GetValue() == 1
		NewChance = 25 ;starts game at 100
		DLC1EclipseAttackNextChanceEclipse.SetValue(NewChance)

	Else ;not an eclipse - just happening because its nighttime
		NewChance = 5; starts game at 100
		DLC1EclipseAttackNextChanceNight.SetValue(NewChance)

	endIf

EndFunction


Function SetNextGauranteed()
	DLC1EclipseAttackNextGauranteed.SetValue(GameDaysPassed.GetValue() + DLC1EclipseAttackNextMaxWait.GetValue())
		
EndFunction
