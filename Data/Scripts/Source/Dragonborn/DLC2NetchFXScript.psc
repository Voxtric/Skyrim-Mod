Scriptname DLC2NetchFXScript extends Actor
{turns off glow fx after death}

	Event onLoad()
	endEvent

	Event OnDying(Actor akKiller)

		self.PlaySubGraphAnimation("StopEffect")


	endEvent