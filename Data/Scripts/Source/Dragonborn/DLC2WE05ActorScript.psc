Scriptname DLC2WE05ActorScript extends ReferenceAlias  
{Script attached to Actor alias in DLC2WE05 quest}

Event OnUpdate()
;registered once in stage 10
	GoUp()
EndEvent


Function GoUp(float myHeight = 7500.0, float mySpeed = 2500.0)
; 	Debug.Trace(self + "GoUp()")
	Actor ActorRef = GetActorReference()

	if ActorRef.isDead()
; 		Debug.Trace(self + "GoUp() actor is dead, RETURNing without translating")
		return
	endif

	float myX = ActorRef.X
	float myY = ActorRef.Y
	float myZ = ActorRef.Z

	float myAngX = ActorRef.GetAngleX()
	float myAngY = ActorRef.GetAngleY()
	float myAngZ = ActorRef.GetAngleZ()


	ActorRef.TranslateTo(myX, myY, myZ + myHeight, myAngX, myAngY, myAngZ, mySpeed) 

EndFunction