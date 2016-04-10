Scriptname DLC2EncExpSpiderGenericControlSCRIPT extends ObjectReference Hidden 

Faction Property DLC2ExpSpiderFriendFaction Auto
{Faction to check for before adding this spider to the list of spawned spiders}

Quest Property DLC2ExpSpiderQuest Auto
{Quest that holds the script/aliases we need}

Explosion Property SpiderCrumbleExplosion Auto
{Explosion that comes from the spider when he dies without exploding}

Bool Property bDisableOnDeath = TRUE Auto
{Whether or not this actor should disable on death (TRUE)}

Bool Property bAlreadyForcedRef = FALSE Auto Hidden



Event OnLoad()
	ObjectReference mySelf = self

	if (mySelf as Actor).IsInFaction(DLC2ExpSpiderFriendFaction)
; 		debug.Trace("I'm a friendly spider, attempting to add myself to the list of spawned spiders" + self)
		if !bAlreadyForcedRef
			(DLC2ExpSpiderQuest as DLC2ExpSpiderAliasArrayScript).ForceRefInto(mySelf)
			bAlreadyForcedRef = TRUE
		endif
	endif

EndEvent

Function ClearActor()
	ObjectReference mySelf = self
	if (mySelf as Actor).IsInFaction(DLC2ExpSpiderFriendFaction)
		(DLC2ExpSpiderQuest as DLC2ExpSpiderAliasArrayScript).ClearRefFrom(mySelf)
; 		debug.Trace("Killing myself because I'm the oldest spawned spider and another one has spawned." + self)
		;SpiderCrumble()
	endif
EndFunction

	; Handles the spider crumble on death
Function SpiderCrumble()
	ObjectReference mySelf = self
	if (mySelf as Actor).IsInFaction(DLC2ExpSpiderFriendFaction)
; 		debug.Trace("Spider running SpiderCrumble()" + self)
		if (mySelf.IsDisabled() == FALSE)
			if bDisableOnDeath
				PlaceAtMe(SpiderCrumbleExplosion, 1)
				(mySelf as Actor).SetAlpha(0)
				(mySelf as Actor).DisableNoWait()
			endif
		endif
	endif
EndFunction