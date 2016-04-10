Scriptname DLC2dwarvenBallistaFX extends Actor  
{Adds fx to theis creature}

VisualEffect Property DLC2BallistaCenturionParticlesE Auto

	EVENT OnLoad()
			DLC2BallistaCenturionParticlesE.Play(self, -1)
	ENDEVENT
