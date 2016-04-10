Scriptname DLC2dunBookLevel4Bend extends ObjectReference
{toggle left, right, middle, or always bend for the bending bridge
0 = continue bending
1 = bend right
2 = bend left
3 = reset to middle
}

int property triggerType = 0 auto
{0 = onTriggerEnter (Default)
 1 = onActivate
 }

int property BendType auto
{
0 = continue bending
1 = bend right
2 = bend left
3 = reset to middle
}
;******************************************************
Function myBend()
	DLC2dunBookLevel4BendControl myLinkedRef = getLinkedRef() as DLC2dunBookLevel4BendControl
	myLinkedRef.Bend(BendType)
endFunction
;******************************************************
auto State Waiting

	Event onTriggerEnter(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.getPlayer() && triggerType == 0)
			gotoState("done")
			self.myBend()
		endif
	endEvent

	Event OnActivate(ObjectReference ActivateRef)
		if(triggerType == 1)
			gotoState("done")
			self.myBend()
		endif
	endEvent
	
endState

;******************************************************

State done
	;do nothing
endState

;******************************************************