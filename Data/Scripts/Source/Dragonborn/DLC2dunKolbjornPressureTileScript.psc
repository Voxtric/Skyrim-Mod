Scriptname DLC2dunKolbjornPressureTileScript extends ObjectReference

EffectShader property EnchFrostFXShader Auto
Sound property TriggerSound Auto

int timer = 16
bool active = False
ObjectReference playerRef

Event OnInit()
	playerRef = Game.GetPlayer()
EndEvent

Auto State Waiting
	Event OnTriggerEnter(ObjectReference akActivator)
		if (akActivator == playerRef)
			GoToState("InTrigger")
			TriggerSound.play(self)
			PlayAnimation("Down")
			if (active)
				;TurnPlateOff()
			Else
				TurnPlateOn()
			EndIf
		EndIf
	EndEvent
EndState

State InTrigger
	Event OnTriggerLeave(ObjectReference akActivator)
		if (akActivator == playerRef)
			GoToState("Waiting")
			PlayAnimation("Up")
		EndIf
	EndEvent	
EndState

Event OnUpdate()
	TurnPlateOff()
EndEvent

Function TurnPlateOn()
; 	Debug.Trace("Enabling Shader")
	UnregisterForUpdate()
	RegisterForSingleUpdate(timer)
	EnchFrostFXShader.Play(Self, 30)
	(Self.GetLinkedRef() As defaultCounter).Increment()
	active = True
EndFunction

Function TurnPlateOff()
; 	Debug.Trace("Disabling Shader")
	UnregisterForUpdate()
	EnchFrostFXShader.Stop(Self)
	(Self.GetLinkedRef() As defaultCounter).Decrement()
	active = False
EndFunction