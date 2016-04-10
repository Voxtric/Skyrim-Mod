Scriptname DLC2dunTempleofMiraakRumbleScript extends ObjectReference
{once player learns the word of power from the word wall, shake camera and activate some dust drops, then activate the draugr}

Sound Property QSTUstengravRumble2DLPM auto
ObjectReference property myDustMarker1 auto
ObjectReference property myDustMarker2 auto
ObjectReference property myDustMarker3 auto


EVENT OnActivate(ObjectReference ActivateRef)
	int rumbleID = QSTUstengravRumble2DLPM.play(self)
	self.RampRumble(1, 10, 1600)
	Game.ShakeCamera(self, 0.3, 2)
	utility.wait(2)
	Game.ShakeCamera(self, 0.4, 2)
	myDustMarker1.activate(myDustMarker1)
	utility.wait(2)
	Game.ShakeCamera(self, 0.4, 2)
	myDustMarker2.activate(myDustMarker2)
	utility.wait(2)
	Game.ShakeCamera(self, 0.4, 2)
	utility.wait(2)
	myDustMarker3.activate(myDustMarker3)
	Game.ShakeCamera(self, 0.3, 2)
	utility.wait(2)
	Game.ShakeCamera(self, 0.3, 5)
	utility.wait(5)
	Sound.StopInstance(rumbleID) 
	Game.ShakeCamera(self, 0.2, 2)
endEVENT