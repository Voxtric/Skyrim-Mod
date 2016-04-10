Scriptname DLC2MQ06Script extends Quest  Conditional

event OnUpdate()
; 	debug.trace(self + " IsWordUnlocked(DLC2BendToWillWord1) = " + Game.IsWordUnlocked(DLC2BendToWillWord1))
; 	debug.trace(self + " IsWordUnlocked(DLC2BendToWillWord2) = " + Game.IsWordUnlocked(DLC2BendToWillWord2))
; 	debug.trace(self + " IsWordUnlocked(DLC2BendToWillWord3) = " + Game.IsWordUnlocked(DLC2BendToWillWord3))

	; watch for player to unlock words
	if Game.IsWordUnlocked(DLC2BendToWillWord1) && Game.IsWordUnlocked(DLC2BendToWillWord2) && Game.IsWordUnlocked(DLC2BendToWillWord3)
		SetStage(100)
	else
		RegisterForSingleUpdate(5.0)
	endif
endEvent

; this function clears the "mind control" state of all the pillars
function ClearMindControl()
	DLC2PillarBuildSandboxMarkerTOGGLEBeast.Disable()
	DLC2PillarBuildSandboxMarkerTOGGLEEarth.Disable()
	DLC2PillarBuildSandboxMarkerTOGGLESun.Disable()
	DLC2PillarBuildSandboxMarkerTOGGLEWater.Disable()
	DLC2PillarBuildSandboxMarkerTOGGLEWind.Disable()
	; mark Tree Stone freed
	DLC2StandingStoneTreeREF.Freed = true
endFunction

Function EnableHM(bool enabling)
	if (enabling)
		DLC2MQ06HermaeusMoraENDFXRef.ChangeState()
		HermaeusMoraTA.Enable()
	else
		DLC2MQ06HermaeusMoraENDFXRef.ChangeState(false)
		HermaeusMoraTA.Disable()
	endif
EndFunction

Function EnableHMBattle(bool enabling, int iNewState = -1)
	if (enabling)
		DLC2MQ06HermaeusMoraBattleFXRef.ChangeState(true, iNewState)
	else
		DLC2MQ06HermaeusMoraBattleFXRef.ChangeState(false)
	endif
EndFunction

; called by dragon alias script if dragon unloads after being tamed (so he can't fly) but before player rides him
function MoveTameDragonFailsafe(Actor dragon)
	
endFunction


WordOfPower Property DLC2BendToWillWord1  Auto  
WordOfPower Property DLC2BendToWillWord2  Auto  
WordOfPower Property DLC2BendToWillWord3  Auto  

Location Property DLC2Book01DungeonLocation  Auto  
Location Property DLC2ApocrypaMiraaksTowerLocation Auto

ObjectReference Property DLC2PillarBuildSandboxMarkerTOGGLEBeast Auto
ObjectReference Property DLC2PillarBuildSandboxMarkerTOGGLEEarth Auto
ObjectReference Property DLC2PillarBuildSandboxMarkerTOGGLESun Auto
ObjectReference Property DLC2PillarBuildSandboxMarkerTOGGLEWater Auto
ObjectReference Property DLC2PillarBuildSandboxMarkerTOGGLEWind Auto

ObjectReference Property HermaeusMoraTA auto

int Property MiraakDragonsKilled Auto Conditional
DLC2StandingStoneScript Property DLC2StandingStoneTreeREF  Auto  

DLC2HermaeusMoraFaceFXSCRIPT Property DLC2MQ06HermaeusMoraENDFXRef  Auto  

DLC2MQ05HermaeusMoraFXScript Property DLC2MQ06HermaeusMoraBattleFXRef Auto  

