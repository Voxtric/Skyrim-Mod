Scriptname DLC2dunFahlbtharzHelmEffectScript extends ActiveMagicEffect  

spell property DLC2dunFahlbtharzSteamBreath auto
float property duration = 5.0 auto
bool property breakout = false auto hidden
int property minStamina = 25  auto
float endTime
float property recastTime = 0.2 auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget.getAv("Stamina") >= minStamina 
		breakout = false
		EndTime = utility.getCurrentRealTime() + duration
		while !breakout && utility.getCurrentRealTime() < EndTime
			DLC2dunFahlbtharzSteamBreath.cast(akTarget)
			utility.wait(recastTime )
		endWhile
	endif
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	breakout = true
endEvent


