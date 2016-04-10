Scriptname DLC2ExpSpiderZombieOnHumanSCRIPT extends ObjectReference Hidden 

VisualEffect Property DLC2ExpSpiderFaceGrabEffect Auto
{Visual effect of the zombie spider that's attached to this actor.}
EffectShader Property DLC2ExpSpiderZombieFXS Auto
{Effect Shader that plays across the actor}
Faction Property DLC2ExpSpiderEnemyFaction Auto
{Faction to add this actor to}
Faction Property FactionToRemove  Auto  
{Faction you want to remove from this actor on load (Ex. if a Bandit then remove from BanditFaction)}

bool AlreadyLoaded


Event OnLoad()
	ObjectReference MySelf = self

	if AlreadyLoaded == FALSE
		AlreadyLoaded = TRUE
		DLC2ExpSpiderFaceGrabEffect.Play(MySelf, -1)
		DLC2ExpSpiderZombieFXS.Play(MySelf)
		(MySelf as Actor).RemoveFromFaction(FactionToRemove)
		(MySelf as Actor).AddToFaction(DLC2ExpSpiderEnemyFaction)
	endif

	MySelf = NONE
EndEvent


Event OnDying(Actor akKiller)
	ObjectReference MySelf = self

	DLC2ExpSpiderFaceGrabEffect.Stop(MySelf)
	DLC2ExpSpiderZombieFXS.Stop(MySelf)

	MySelf = NONE
EndEvent