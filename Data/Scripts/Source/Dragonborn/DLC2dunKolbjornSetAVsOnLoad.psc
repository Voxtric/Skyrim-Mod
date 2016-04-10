ScriptName DLC2dunKolbjornSetAVsOnLoad extends Actor
{Default script that lives on an actor. When the actor loads, sets an Actor Value. Defaults to Aggression=1, Confidence=4}

string property sActorVariable1 = "Aggression" auto
{By default, this property is set to Aggression. Set which actor variable to set as a string}

float property fActorVariable1 = 1.0 auto
{By default this property is set to 1. Set what you want the actor variable to be changed to} 

string property sActorVariable2 = "Confidence" auto
{By default, this property is set to Confidence. Set which actor variable to set as a string}

float property fActorVariable2 = 4.0 auto
{By default this property is set to 4. Set what you want the actor variable to be changed to} 

auto State waiting
	Event OnLoad()
		self.setAV(sActorVariable1, fActorVariable1)
		self.setAV(sActorVariable2, fActorVariable2)
		self.evaluatePackage()
		goToState("allDone")
	endEvent	
endState

State allDone
	;do nothing
endState
	