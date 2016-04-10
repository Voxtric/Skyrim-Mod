Scriptname DLC2KagrumezMasterScript extends ObjectReference  

globalvariable property fightCountGlobal auto
referencealias property KagrumezGem01 auto
referencealias property KagrumezGem02 auto
referencealias property KagrumezGem03 auto
referencealias property KagrumezGem04 auto
referencealias property KagrumezGem05 auto
quest property DLC2KagrumezQST auto
location property kagrumezLocation auto

;Objects to animate in the room for each fight, named for the fight they are used in
objectReference property console auto
objectReference property fight1PlatformL auto
objectReference property fight1PlatformR auto
objectReference property fight2WallActivator auto
objectReference property fight2TrapDisabler auto
objectReference property fight3water auto
objectReference property fight3platforms auto
objectReference property fight3SparksTrigger auto

;sound properties
sound property stoneWallFast auto
sound property stoneWallSlowLoop auto
sound property waterRiseDrainLoop auto
objectReference property waterSoundMarker01 auto
objectReference property waterSoundMarker02 auto
int wallSoundLoop = 0
int waterSoundLoop = 0


;markers to enable collision cutting volumes
objectReference property CollisionEnablerExitGates auto 
objectReference property CollisionEnablerFight02 auto 
objectReference property CollisionEnablerFight03 auto 

;markers to enable encounters for each fight, also activators to trigger ambush encounters
objectReference property encounterEnableMarkerFight01 auto 
objectReference property encounterEnableMarkerFight02 auto 
objectReference property encounterEnableMarkerFight03 auto 
objectReference property AmbushTriggerFight01 auto 
objectReference property AmbushTriggerFight02 auto 
objectReference property AmbushTriggerFight03 auto 

;markers to enable lights and fx for each fight
objectReference property lightEnablerFight01 auto 
objectReference property lightEnablerFight02 auto 
objectReference property lightEnablerFight03 auto 

;gates to open to release the encounters
objectReference property gate01 auto
objectReference property gate02 auto
objectReference property gate03 auto

;gates that block the exits of the room
objectReference property exitGate01 auto
objectReference property exitGate02 auto

;gates that open the way to the prize rooms
objectReference property prizeGate01 auto
objectReference property prizeGate02 auto
objectReference property prizeGate03 auto

;properties for each gem slot
objectReference property gem01 auto 
objectReference property gem02 auto 
objectReference property gem03 auto 
objectReference property gem04 auto 
objectReference property gem05 auto 
objectReference property gem06 auto 
objectReference property gem07 auto 
objectReference property gem08 auto 
objectReference property gem09 auto 

DLC2KagrumezGemScript gem01Script 
DLC2KagrumezGemScript gem02Script 
DLC2KagrumezGemScript gem03Script
DLC2KagrumezGemScript gem04Script
DLC2KagrumezGemScript gem05Script
DLC2KagrumezGemScript gem06Script 
DLC2KagrumezGemScript gem07Script
DLC2KagrumezGemScript gem08Script
DLC2KagrumezGemScript gem09Script


;When a fight is finished, this value is set to true to make sure each fight is not repeatable
bool property fight1Done = false auto hidden
bool property fight2Done = false auto hidden
bool property fight3Done = false auto hidden

int property enemiesKilled = 0 auto Hidden

function gemsGoToFightState()
	;puts all gems in a state to block activation
		gem01Script.goToState("fightState")
		gem02Script.goToState("fightState")
		gem03Script.goToState("fightState")
		gem04Script.goToState("fightState")
		gem05Script.goToState("fightState")
		gem06Script.goToState("fightState")
		gem07Script.goToState("fightState")
		gem08Script.goToState("fightState")
		gem09Script.goToState("fightState")
endFunction

function gemsReset()     
	;puts all gems in a state to block activation
		gem01Script.goToState("default")
		gem02Script.goToState("default")
		gem03Script.goToState("default")
		gem04Script.goToState("default")
		gem05Script.goToState("default")
		gem06Script.goToState("default")
		gem07Script.goToState("default")
		gem08Script.goToState("default")
		gem09Script.goToState("default")
endFunction

auto State default
	Event OnCellAttach()
	;set gem activator scripts
			gem01Script = gem01 as DLC2KagrumezGemScript
			gem02Script = gem02 as DLC2KagrumezGemScript
			gem03Script = gem03 as DLC2KagrumezGemScript
			gem04Script = gem04 as DLC2KagrumezGemScript
			gem05Script = gem05 as DLC2KagrumezGemScript
			gem06Script = gem06 as DLC2KagrumezGemScript
			gem07Script = gem07 as DLC2KagrumezGemScript
			gem08Script = gem08 as DLC2KagrumezGemScript
			gem09Script = gem09 as DLC2KagrumezGemScript
			fightCountGlobal.setValueInt(0) 
	EndEvent

	Event OnActivate(objectReference Actronaut)
		if fight1Done == false && gem01Script.hasGem == 0 && gem02Script.hasGem == 0 && gem03Script.hasGem == 0 && gem04Script.hasGem == 1 && gem05Script.hasGem == 0 && gem06Script.hasGem == 0 && gem07Script.hasGem == 0 && gem08Script.hasGem == 0 && gem09Script.hasGem == 1
		;initiates Kagrumez fight 1
			goToState("fight1")
			console.playAnimation("stage1")
			fightCountGlobal.setValueInt(0) 
			exitGate01.Activate(exitGate01)
			exitGate02.Activate(exitGate02)
			CollisionEnablerExitGates.enable()
			utility.wait(3)
			gemsGoToFightState()
			;utility.wait(2)
			console.playAnimation("stage2")
			utility.wait(2)
			console.playAnimation("stage3")
			console.RampRumble(1, 3, 1500)
			lightEnablerFight01.Enable()
			stoneWallFast.Play(self)
			fight1PlatformL.SetAnimationVariablefloat("fToggleBlend", 1) 
			fight1PlatformR.SetAnimationVariablefloat("fToggleBlend", 1) 
			encounterEnableMarkerFight01.enable()
			utility.wait(1)
			gate01.Activate(gate01)
			gate02.Activate(gate02)
			gate03.Activate(gate03)
			;utility.wait(1)
			AmbushTriggerFight01.Activate(AmbushTriggerFight01)
			utility.wait(4)
			wallSoundLoop = stoneWallSlowLoop.Play(self)
			fight1PlatformL.SetAnimationVariablefloat("fDampRate", 0.0008) 
			fight1PlatformR.SetAnimationVariablefloat("fDampRate", 0.0008) 
			fight1PlatformL.SetAnimationVariablefloat("fToggleBlend", 0) 
			fight1PlatformR.SetAnimationVariablefloat("fToggleBlend", 0) 
		elseif fight1Done == true && fight2Done == false && gem01Script.hasGem == 0 && gem02Script.hasGem == 1 && gem03Script.hasGem == 0 && gem04Script.hasGem == 0 && gem05Script.hasGem == 0 && gem06Script.hasGem == 0 && gem07Script.hasGem == 0 && gem08Script.hasGem == 1 && gem09Script.hasGem == 1
		;initiates Kagrumez fight 2
			goToState("fight2")
			console.playAnimation("stage1")
			fightCountGlobal.setValueInt(0) 
			exitGate01.Activate(exitGate01)
			exitGate02.Activate(exitGate02)
			CollisionEnablerExitGates.enable()
			encounterEnableMarkerFight01.disable()
			utility.wait(3)
			gemsGoToFightState()
			;utility.wait(2)
			console.playAnimation("stage2")
			utility.wait(2)
			console.playAnimation("stage3")
			console.RampRumble(1, 3, 1500)
			encounterEnableMarkerFight02.enable()
			;utility.wait(1)
			lightEnablerFight02.Enable()
			fight2WallActivator.Activate(Fight2WallActivator)
			CollisionEnablerFight02.enable()
			AmbushTriggerFight02.Activate(AmbushTriggerFight02)
			gate01.Activate(gate01)
			gate02.Activate(gate02)
			gate03.Activate(gate03)
		elseif fight1Done == true && fight2Done == true && fight3Done == false && gem01Script.hasGem == 1 && gem02Script.hasGem == 0 && gem03Script.hasGem == 0 && gem04Script.hasGem == 0 && gem05Script.hasGem == 1 && gem06Script.hasGem == 0 && gem07Script.hasGem == 1 && gem08Script.hasGem == 0 && gem09Script.hasGem == 1
		;initiates Kagrumez fight 3
			goToState("fight3")
			console.playAnimation("stage1")
			fightCountGlobal.setValueInt(0) 
			exitGate01.Activate(exitGate01)
			exitGate02.Activate(exitGate02)
			CollisionEnablerExitGates.enable()
			encounterEnableMarkerFight02.disable()
			utility.wait(3)
			gemsGoToFightState()
			;utility.wait(2)
			console.playAnimation("stage2")
			utility.wait(2)
			console.playAnimation("stage3")
			console.RampRumble(1, 4, 1500)
			lightEnablerFight03.Enable()
			fight3platforms.playAnimation("stage1")
			CollisionEnablerFight03.enable()
			waterSoundLoop = waterRiseDrainLoop.Play(self)
			fight3water.translateTo(4823.4160, 250.8519, -518.4196, 0, 0, 0, 50.0)
			waterSoundMarker01.enable()
			waterSoundMarker02.enable()
			sound.StopInstance(waterSoundLoop)
			encounterEnableMarkerFight03.enable()
			fight3SparksTrigger.Activate(fight3SparksTrigger)
			AmbushTriggerFight03.Activate(AmbushTriggerFight03)
			gate01.Activate(gate01)
			gate02.Activate(gate02)
			gate03.Activate(gate03)
		endif
	endEvent
endState

State fight1
	Event OnActivate(objectReference Actronaut)
		enemiesKilled = fightCountGlobal.getValueInt()
		if fightCountGlobal.getValueInt() == 6
		;resets room to default state when all enemies are killed
			fightCountGlobal.setValueInt(0) 
			fight1Done = true
			utility.wait(2)
			goToState("default")
			gate01.Activate(gate01)
			gate02.Activate(gate02)
			gate03.Activate(gate03)
			lightEnablerFight01.Disable()
			sound.StopInstance(wallSoundLoop)
			stoneWallFast.Play(self)
			fight1PlatformL.SetAnimationVariablefloat("fDampRate", 0.03) 
			fight1PlatformR.SetAnimationVariablefloat("fDampRate", 0.03) 
			CollisionEnablerExitGates.disable()
			exitGate01.Activate(exitGate01)
			exitGate02.Activate(exitGate02)
			CollisionEnablerExitGates.disable()
			prizeGate01.Activate(prizeGate01)
			console.playAnimation("Stage4")
			;dlc2KagrumezQST.setstage(10)
			gemsReset()
		endif
	EndEvent
endState

State fight2
	Event OnActivate(objectReference Actronaut)
		enemiesKilled = fightCountGlobal.getValueInt()
		if fightCountGlobal.getValueInt() == 7
		;resets room to default state when all enemies are killed
			fightCountGlobal.setValueInt(0) 
			fight2Done = true
			utility.wait(2)
			goToState("default")
			gate01.Activate(gate01)
			gate02.Activate(gate02)
			gate03.Activate(gate03)
			lightEnablerFight02.Disable()
			fight2WallActivator.Activate(Fight2WallActivator)
			fight2TrapDisabler.Activate(Fight2TrapDisabler)
			CollisionEnablerFight02.disable()
			exitGate01.Activate(exitGate01)
			exitGate02.Activate(exitGate02)
			CollisionEnablerExitGates.disable()
			prizeGate02.Activate(prizeGate02)
			console.playAnimation("Stage4")
			gemsReset()
		endif
	EndEvent
endState

State fight3
	Event OnActivate(objectReference Actronaut)
		enemiesKilled = fightCountGlobal.getValueInt()
		if fightCountGlobal.getValueInt() == 5
		;resets room to default state when all enemies are killed
			fightCountGlobal.setValueInt(0) 
			fight3Done = true
			utility.wait(2)
			goToState("default")
			gate01.Activate(gate01)
			gate02.Activate(gate02)
			gate03.Activate(gate03)
			lightEnablerFight03.Disable()
			waterSoundLoop = waterRiseDrainLoop.Play(self)
			fight3water.translateTo(4823.4160, 250.8519, -640, 0, 0, 0, 50.0)
			waterSoundMarker01.disable()
			waterSoundMarker02.disable()
			sound.StopInstance(waterSoundLoop)
			fight3SparksTrigger.Activate(fight3SparksTrigger)
			fight3platforms.playAnimation("stage2")
			CollisionEnablerFight03.disable()
			exitGate01.Activate(exitGate01)
			exitGate02.Activate(exitGate02)
			CollisionEnablerExitGates.disable()
			prizeGate03.Activate(prizeGate03)
			console.playAnimation("Stage4")
			;sets quest stage to indicate all fights are done
			dlc2KagrumezQST.setstage(250)
			kagrumezLocation.setCleared()
			gemsReset()
			;remove gem items from their alias so they player may drop or sell them
			KagrumezGem01.tryToClear()
			KagrumezGem02.tryToClear()
			KagrumezGem03.tryToClear()
			KagrumezGem04.tryToClear()
			KagrumezGem05.tryToClear()
		endif
	EndEvent
endState