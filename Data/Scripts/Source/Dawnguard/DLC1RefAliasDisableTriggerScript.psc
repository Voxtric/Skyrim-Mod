Scriptname DLC1RefAliasDisableTriggerScript extends ObjectReference
;Once the reference alias hits the trigger, the trigger is disabled.
import utility
import debug

ReferenceAlias property myRefAlias auto
Quest property myQuest auto
{optional - prereq quest}
Int property myStage auto
{optional - prereq quest stage}

;************************************

Function execute()
	gotoState("done")
	disable()
endFunction

;************************************

auto State waiting
	Event onTriggerEnter(ObjectReference akActionRef)
		if(akActionRef == myrefAlias.getReference() as Actor)
			if(myQuest)
				if(myQuest.getStage() >= myStage)
					execute()
				endif
			else
				execute()
			endif
		endif
	endEvent
endState

;************************************

State done
	;do Nothing
endState
;************************************
