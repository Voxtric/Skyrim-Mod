ScriptName defaultSetAVOnLoad extends Actor
{Default script that lives on an actor. When the actor loads, sets an Actor Value. Defaults to Aggression=1}

string property sActorVariable = "Aggression" auto
{By default, this property is set to Aggression. Set which actor variable to set as a string}

float property fActorVariable auto
{By default this property is set to 1. Set what you want the actor variable to be changed to} 

auto State waiting
	Event OnLoad()
		self.setAV(sActorVariable, fACtorVariable)
		self.evaluatePackage()
		goToState("allDone")
	endEvent	
endState

State allDone
	;do nothing
endState
	