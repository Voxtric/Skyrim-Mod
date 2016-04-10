Scriptname DLC1VQ08QuestScript extends Quest  Conditional

Int Property HunterUpdate  Auto  Conditional

ReferenceAlias Property IsranAlias  Auto  

ReferenceAlias Property SorineAlias  Auto  

ReferenceAlias Property GunmarAlias  Auto  

ReferenceAlias Property FlorentiusAlias  Auto  

ReferenceAlias Property AgmaerAlias  Auto  

ReferenceAlias Property BelevalAlias  Auto  

ReferenceAlias Property CelannAlias  Auto  

ReferenceAlias Property DurakAlias  Auto  

ReferenceAlias Property IngjardAlias  Auto  


Function HunterPackageUpdate()

	IsranAlias.GetActorReference().EvaluatePackage()
	SorineAlias.GetActorReference().EvaluatePackage()
	GunmarAlias.GetActorReference().EvaluatePackage()
	FlorentiusAlias.GetActorReference().EvaluatePackage()
	AgmaerAlias.GetActorReference().EvaluatePackage()
	BelevalAlias.GetActorReference().EvaluatePackage()
	CelannAlias.GetActorReference().EvaluatePackage()
	DurakAlias.GetActorReference().EvaluatePackage()
	IngjardAlias.GetActorReference().EvaluatePackage()

EndFunction