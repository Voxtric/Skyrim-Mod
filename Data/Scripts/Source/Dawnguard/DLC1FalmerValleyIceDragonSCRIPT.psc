scriptname DLC1FalmerValleyIceDragonSCRIPT extends Actor
{script for breaking ice during the ice dragon fight in Falmer Valley}


explosion property myExplosionEnter auto
explosion property myExplosionExit auto

Quest property myQuest auto
int property myStage auto
int property mySetStage auto
objectReference property myIceCapStart01 auto
objectReference property myIceCapStart02 auto
objectReference property myIceCapEnd01 auto
objectReference property myIceCapEnd02 auto
objectReference property myIceTrimStart01 auto
objectReference property myIceTrimStart02 auto
objectReference property myIceTrimEnd01 auto
objectReference property myIceTrimEnd02 auto

int diveCounter = 0
bool doOnce = false

;**********************************************

Event onLoad()
	if(myQuest.getStage() == myStage && !doOnce)
		doOnce = true
		myQuest.setStage(mySetStage)
	endif
	registerForAnimationEvent(self, "DiveSplashStart")
	registerForAnimationEvent(self, "DiveSplashEnd")
endEvent

;**********************************************

auto State waiting
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if (asEventName == "DiveSplashStart")
			if(diveCounter == 0)
				myIceCapStart01.disable(0)
				myIceTrimStart01.placeAtMe(myExplosionEnter)
				registerForAnimationEvent(self, "DiveSplashStart")
			elseIf(diveCounter == 1)
				myIceCapStart02.disable(0)
				myIceTrimStart02.placeAtMe(myExplosionEnter)
			endif
		endif

		if (asEventName == "DiveSplashEnd")
			if(diveCounter == 0)
				diveCounter = 1
				myIceCapEnd01.disable(0)
				myIceTrimEnd01.placeAtMe(myExplosionExit)
				registerForAnimationEvent(self, "DiveSplashEnd")
			elseIf(diveCounter == 1)
				diveCounter = 2
				myIceCapEnd02.disable(0)
				myIceTrimEnd02.placeAtMe(myExplosionExit)
			endif
		endif

	endEvent

	Event onDeath(actor killer)
		gotoState("done")
	endEvent
endState

;**********************************************

State done
	;do nothing
endState

;**********************************************