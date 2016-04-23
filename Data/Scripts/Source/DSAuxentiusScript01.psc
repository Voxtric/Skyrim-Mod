Scriptname DSAuxentiusScript01 extends ReferenceAlias  

Quest Property DwemerSecrets  Auto  

Event OnDeath(Actor akActor)
if DwemerSecrets.GetStage() == 120
	DwemerSecrets.SetStage(121)
elseif DwemerSecrets.GetStage() == 122
	DwemerSecrets.SetStage(130)
elseif DwemerSecrets.GetStage() == 140
	DwemerSecrets.SetStage(141)
else
	DwemerSecrets.SetStage(200)
endif
endevent
