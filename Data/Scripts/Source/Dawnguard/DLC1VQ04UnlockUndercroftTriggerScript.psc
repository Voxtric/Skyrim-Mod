Scriptname DLC1VQ04UnlockUndercroftTriggerScript extends ObjectReference  


Quest Property VQ04 auto
ObjectReference Property UndercroftDoor auto
DLC1_NPCMentalModelScript Property MM Auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer() && VQ04.GetStageDone(20) && MM.IsFollowing)
		; Debug.Trace("Unlocking...")
		UndercroftDoor.Lock(false)
		Delete()
	else
		; Debug.Trace("Not unlocking...")
		; Debug.Trace("activator: " + akActivator)
		; Debug.Trace("stage: " + VQ04.GetStageDone(20))
		; Debug.Trace("following: " + MM.IsFollowing)
	endif
EndEvent
