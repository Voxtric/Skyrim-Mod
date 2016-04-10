Scriptname DLC2PillarBuilderActorScript extends Actor  
{Script attached to anyone who is or might become a pillar builder. Handles removing them from faction if the pillar is destroyed.}

;NOTE: see also DLC2PillarBuilderScript which is on aliases in DLC2Pillar quest that handle adding someone to the builder faction after the game starts

DLC2PillarScript Property DLC2Pillar auto
{AUTOFILL THIS PROPERTY}

event OnLoad()
; 	Debug.Trace(self + "OnLoad() will call CheckMyPillarToggle()")
	DLC2Pillar.CheckMyPillarToggle(self)

endEvent

Event OnPackageStart(Package akNewPackage)
; 	Debug.Trace(self + "OnPackageStart()")
	if akNewPackage.GetTemplate() == DLC2Pillar.DLC2SleepBuild
		DLC2Pillar.SetBuilderFactionFriendliness(self, IsSleepBuildTemplate = true)
	else
		DLC2Pillar.SetBuilderFactionFriendliness(self, IsSleepBuildTemplate = false)
	endif

endEvent