Scriptname DSArtifactScript extends ReferenceAlias  

Quest Property DwemerSecrets  Auto  
Actor Property PlayerRef  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
if akNewContainer == PlayerREF && akOldContainer == Boss
	DwemerSecrets.SetStage(100)
endif
endevent
Actor Property Boss  Auto  
