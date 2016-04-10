Scriptname DLC1RV10Script extends Quest  
{Script on DLC1RV10 quest}

ReferenceAlias Property Isran auto
ReferenceAlias Property Sorine auto
ReferenceAlias Property Gunmar auto
ReferenceAlias Property Florentius auto
ReferenceAlias Property Agmaer auto
ReferenceAlias Property Beleval auto
ReferenceAlias Property Celann auto
ReferenceAlias Property Durak auto

Outfit Property DLC1OutfitSorine  Auto  
Outfit Property DLC1OutfitGunmar  Auto  

Function CheckDead()
	if Isran.GetActorReference().IsDead() \
		&& Sorine.GetActorReference().IsDead() \
		&& Gunmar.GetActorReference().IsDead() \
		&& Florentius.GetActorReference().IsDead() \
		&& Agmaer.GetActorReference().IsDead() \
		&& Beleval.GetActorReference().IsDead() \
		&& Celann.GetActorReference().IsDead() \
		&& Durak.GetActorReference().IsDead()


		SetStage(100)

	endIf

EndFunction

Function StripEssentialAndEnable(ReferenceAlias WhichAlias)
	Actor ActorRef = WhichAlias.GetActorReference()

	ActorRef.Enable()
	ActorRef.GetActorBase().SetEssential(false)

EndFunction

