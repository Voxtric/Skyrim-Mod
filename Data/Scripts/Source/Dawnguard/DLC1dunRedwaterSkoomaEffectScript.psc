Scriptname DLC1dunRedwaterSkoomaEffectScript extends ActiveMagicEffect
{This script is to set a stage on the quest when the player uses this skooma in the cell}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      Properties block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Location property DLC1dunRedwaterDenLocation auto

Quest property DLC1dunRedwaterDenQST auto

int property Stage = 10 auto

int property maxStage = 10 auto
{maximum stage at which this will be allowed}

float property timeDelay = 30.0 auto
{time delay before setting the stage to move the player on the quest
		default = 15.0}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;       Event Block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == game.getPlayer() && game.getPlayer().isInLocation(DLC1dunRedwaterDenLocation)
		;if used by the player and in the RedwaterDen Location
		if DLC1dunRedwaterDenQST.getStage() < maxStage
			;and if prereq stage
			utility.wait(timeDelay)
			DLC1dunRedwaterDenQST.setStage(Stage)
		endif
	endif
endEvent

