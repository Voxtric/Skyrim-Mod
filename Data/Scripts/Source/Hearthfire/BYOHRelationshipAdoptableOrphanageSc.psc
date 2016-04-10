Scriptname BYOHRelationshipAdoptableOrphanageSc extends Quest Conditional
{Quest script for BYOHRelationshipAdoptableOrphanage, which manages adopting children from the Orphanage.}

;This script is responsible for:
; - Handling the 'Orphanage Adoption' process, which is largely controlled via Constance's dialogue.
; - Handling the 'Orphanage Fallback Adoption' process. After Constance's death and a brief delay, the children in the Orphanage manage their own adoption.
; - Transferring newly-orphaned children to the Orphanage, with all that entails.

;----------------------------------------------------------------------------------------------------
;Properties & Variables
;----------------------
ObjectReference property ConstanceMichelRef Auto	;Constance

ObjectReference property FrancoisRef Auto			;Standard Orphanage Children
ObjectReference property RunaRef Auto
ObjectReference property SamuelRef Auto
ObjectReference property HroarRef Auto

ReferenceAlias property Orphan01 Auto	;Newly-orphaned children transferred to the Orphanage
ReferenceAlias property Orphan02 Auto
ReferenceAlias property Orphan03 Auto
ReferenceAlias property Orphan04 Auto
ReferenceAlias property Orphan05 Auto
ReferenceAlias property Orphan06 Auto
ReferenceAlias property Orphan07 Auto

ObjectReference property HonorhallOrphanageExtraBeds_Enable Auto		;When we transfer new orphans to the Orphanage, swap out these
ObjectReference property HonorhallOrphanageExtraBeds_Disable Auto	;  sets of furniture and idle markers.

Location property RiftenHonorhallOrphanageLocation Auto	;Orphanage's location.
ObjectReference property BYOHOrphanageMarker Auto			;A marker to move transferred children to.

Faction property BYOHRelationshipAdoptableFaction Auto	;Standard Adoptable faction.
Faction property BYOHRelationshipAdoptionFaction Auto		;Standard Adoption faction.
Faction property FavorJobsBeggarFaction Auto				;Beggar faction (which we need to strip from some newly-orphaned children).

int property OrphanageFactionRank Auto						;The current faction rank most of the Orphanage children are in.
int property OrphanageHouseLoc Auto							;The current house most of the Orphanage children will be directed to.

Quest property BYOHRelationshipAdoptable Auto				;Main Adoptable quest.
Quest property DB01 Auto


;----------------------------------------------------------------------------------------------------
;Initial Setup
;-------------

;On quest start:
; - If Constance is killed before the quest runs, enable Fallback Adoptions immediately.
; - Force the furniture XMarkers to their default state for safety.
Function QuestStarted()
	if ((ConstanceMichelRef as Actor).IsDead() && DB01.IsCompleted())
		EnableOrphanedOrphanageAdoptions()
	EndIf
	HonorhallOrphanageExtraBeds_Enable.Disable()
	HonorhallOrphanageExtraBeds_Disable.Enable()
EndFunction


;----------------------------------------------------------------------------------------------------
;Orphanage Transfer System
;-------------------------

;Are we accepting new orphans at this time? Lots of checks...
;  Is Constance Alive? Is the player in the Orphanage (which prevents us from warping kids in)? Is DB01 done? Do we have space available?
bool Function AcceptingTransfers(Actor child)
	return (!(ConstanceMichelRef as Actor).IsDead()) && (Game.GetPlayer().GetCurrentLocation() != RiftenHonorhallOrphanageLocation) && \
			(DB01.IsCompleted()) && (Orphan07.GetActorRef() == None) && (Orphan01.GetActorRef() != child) && \
			(Orphan02.GetActorRef() != child) && (Orphan03.GetActorRef() != child) && (Orphan04.GetActorRef() != child) && \
			(Orphan05.GetActorRef() != child) && (Orphan06.GetActorRef() != child) && (Orphan07.GetActorRef() != child)
EndFunction


;Transfer an orphaned child into the Orphanage.
Function TransferOrphan(Actor child)
	;Push the orphan into one of the Orphanage aliases.
	if (Orphan01.GetActorRef() == None)
		Orphan01.ForceRefTo(child)
	ElseIf (Orphan02.GetActorRef() == None)
		Orphan02.ForceRefTo(child)
	ElseIf (Orphan03.GetActorRef() == None)
		Orphan03.ForceRefTo(child)
	ElseIf (Orphan04.GetActorRef() == None)
		Orphan04.ForceRefTo(child)
	ElseIf (Orphan05.GetActorRef() == None)
		Orphan05.ForceRefTo(child)
	ElseIf (Orphan06.GetActorRef() == None)
		Orphan06.ForceRefTo(child)
	Else
		Orphan07.ForceRefTo(child)
	EndIf
	
	;Remove the child from the Beggar faction if necessary.
	;Children begging in the Orphanage just sounded strange.
	child.RemoveFromFaction(FavorJobsBeggarFaction)
	
	;Remove the child from their previous Crime Faction, if any.
	child.SetCrimeFaction(None)
	
	;Move the orphan into the orphanage and EVP them.
	child.MoveTo(BYOHOrphanageMarker)
	child.EvaluatePackage()
	
	;Set the child's faction rank to reflect the current situation in the Orphanage.
	If (OrphanageFactionRank == 10)
		;Orphanage state is 'Allow Orphanage Adoptions', so set the corresponding rank.
		child.SetFactionRank(BYOHRelationshipAdoptableFaction, 12)
	ElseIf (OrphanageFactionRank == 11)
		;Orphanage state is 'Allow Fallback Adoptions', so set the corresponding rank.
		child.SetFactionRank(BYOHRelationshipAdoptableFaction, 13)
	Else
		;Orphanage state is 'Disable Adoptions', so set the corresponding rank.
		child.SetFactionRank(BYOHRelationshipAdoptableFaction, 14)
	EndIf
	
	;Set the child's Variable07 to match that of the other children (this represents the location the player told Constance the child will live).
	child.SetAV("Variable07", OrphanageHouseLoc)
	
	;Swap the furniture and idle marker states.
	HonorhallOrphanageExtraBeds_Enable.Enable()
	HonorhallOrphanageExtraBeds_Disable.Disable()
EndFunction


;----------------------------------------------------------------------------------------------------
;Orphanage Adoptions via Cosntance
;---------------------------------

;Standard Orphanage Adoption is enabled when the player completes Constance's questionnaire.
Function EnableOrphanageAdoptions()
	;Debug.Trace("Enabling Orphanage Orphan Adoption")
	;Complete the 'Adopt from the Orphanage' objective, if it was running.
	(BYOHRelationshipAdoptable as BYOHRelationshipAdoptableScript).ShowOrphanageObjective(2)
	
	;Update Faction Rank variable.
	OrphanageFactionRank = 10
	
	;Update Faction Ranks for the standard children.
	if (!(FrancoisRef as Actor).IsInFaction(BYOHRelationshipAdoptionFaction))
		(FrancoisRef as Actor).SetFactionRank(BYOHRelationshipAdoptableFaction, 10)
	EndIf
	if (!(RunaRef as Actor).IsInFaction(BYOHRelationshipAdoptionFaction))
		(RunaRef as Actor).SetFactionRank(BYOHRelationshipAdoptableFaction, 10)
	EndIf
	if (!(SamuelRef as Actor).IsInFaction(BYOHRelationshipAdoptionFaction))
		(SamuelRef as Actor).SetFactionRank(BYOHRelationshipAdoptableFaction, 10)
	EndIf
	if (!(HroarRef as Actor).IsInFaction(BYOHRelationshipAdoptionFaction))
		(HroarRef as Actor).SetFactionRank(BYOHRelationshipAdoptableFaction, 10)
	EndIf
	
	;Update Faction Ranks for any additional orphans that are present.
	if (Orphan01.GetActorRef() != None && !Orphan01.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan01.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 12)
	EndIf
	if (Orphan02.GetActorRef() != None && !Orphan02.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan02.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 12)
	EndIf
	if (Orphan03.GetActorRef() != None && !Orphan03.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan03.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 12)
	EndIf
	if (Orphan04.GetActorRef() != None && !Orphan04.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan04.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 12)
	EndIf
	if (Orphan05.GetActorRef() != None && !Orphan05.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan05.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 12)
	EndIf
	if (Orphan06.GetActorRef() != None && !Orphan06.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan06.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 12)
	EndIf
	if (Orphan07.GetActorRef() != None && !Orphan07.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan07.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 12)
	EndIf
EndFunction


;Standard Orphanage Orphan adoption is disabled once the player has adopted two children, or briefly after Constance is killed (see below).
Function DisableOrphanageAdoptions()
	;Debug.Trace("Disabling Orphanage Orphan Adoption")
	;Update quest stage (used as a dialogue variable).
	Self.SetStage(255)
	
	;Update Faction Rank variable.
	OrphanageFactionRank = -1
	
	;Update Faction Ranks for the standard children.
	if (!(FrancoisRef as Actor).IsInFaction(BYOHRelationshipAdoptionFaction))
		(FrancoisRef as Actor).SetFactionRank(BYOHRelationshipAdoptableFaction, -1)
	EndIf
	if (!(RunaRef as Actor).IsInFaction(BYOHRelationshipAdoptionFaction))
		(RunaRef as Actor).SetFactionRank(BYOHRelationshipAdoptableFaction, -1)
	EndIf
	if (!(SamuelRef as Actor).IsInFaction(BYOHRelationshipAdoptionFaction))
		(SamuelRef as Actor).SetFactionRank(BYOHRelationshipAdoptableFaction, -1)
	EndIf
	if (!(HroarRef as Actor).IsInFaction(BYOHRelationshipAdoptionFaction))
		(HroarRef as Actor).SetFactionRank(BYOHRelationshipAdoptableFaction, -1)
	EndIf
	
	;Update Faction Ranks for any additional orphans.
	if (Orphan01.GetActorRef() != None && !Orphan01.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan01.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 14)
	EndIf
	if (Orphan02.GetActorRef() != None && !Orphan02.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan02.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 14)
	EndIf
	if (Orphan03.GetActorRef() != None && !Orphan03.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan03.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 14)
	EndIf
	if (Orphan04.GetActorRef() != None && !Orphan04.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan04.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 14)
	EndIf
	if (Orphan05.GetActorRef() != None && !Orphan05.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan05.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 14)
	EndIf
	if (Orphan06.GetActorRef() != None && !Orphan06.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan06.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 14)
	EndIf
	if (Orphan07.GetActorRef() != None && !Orphan07.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan07.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 14)
	EndIf
EndFunction


;Given a house location, store it off onto the children in Variable07, where the Adoptable quest expects it per the usual dialogue.
Function StoreHouseLocation(int loc)
	;Update House Loc variable.
	OrphanageHouseLoc = loc
	
	;Update House Locs for the standard children.
	if (!(FrancoisRef as Actor).IsInFaction(BYOHRelationshipAdoptionFaction))
		(FrancoisRef as Actor).SetAV("Variable07", loc)
	EndIf
	if (!(RunaRef as Actor).IsInFaction(BYOHRelationshipAdoptionFaction))
		(RunaRef as Actor).SetAV("Variable07", loc)
	EndIf
	if (!(SamuelRef as Actor).IsInFaction(BYOHRelationshipAdoptionFaction))
		(SamuelRef as Actor).SetAV("Variable07", loc)
	EndIf
	if (!(HroarRef as Actor).IsInFaction(BYOHRelationshipAdoptionFaction))
		(HroarRef as Actor).SetAV("Variable07", loc)
	EndIf
	
	;Update House Locs for any additional orphans.
	if (Orphan01.GetActorRef() != None && !Orphan01.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan01.GetActorRef().SetAV("Variable07", loc)
	EndIf
	if (Orphan02.GetActorRef() != None && !Orphan02.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan02.GetActorRef().SetAV("Variable07", loc)
	EndIf
	if (Orphan03.GetActorRef() != None && !Orphan03.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan03.GetActorRef().SetAV("Variable07", loc)
	EndIf
	if (Orphan04.GetActorRef() != None && !Orphan04.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan04.GetActorRef().SetAV("Variable07", loc)
	EndIf
	if (Orphan05.GetActorRef() != None && !Orphan05.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan05.GetActorRef().SetAV("Variable07", loc)
	EndIf
	if (Orphan06.GetActorRef() != None && !Orphan06.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan06.GetActorRef().SetAV("Variable07", loc)
	EndIf
	if (Orphan07.GetActorRef() != None && !Orphan07.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan07.GetActorRef().SetAV("Variable07", loc)
	EndIf
EndFunction


;Update the quest stage if the player adopts a child from the Orphanage.
Function CheckAdoptOrphanageChild(ObjectReference child, int childNum)
	if (child == FrancoisRef || child == RunaRef || child == SamuelRef || child == HroarRef || \
		child == Orphan01.GetActorRef() || child == Orphan02.GetActorRef() || \
		child == Orphan03.GetActorRef() || child == Orphan04.GetActorRef() || \
		child == Orphan05.GetActorRef() || child == Orphan06.GetActorRef() || \
		child == Orphan07.GetActorRef())
		if (childNum == 1)
			Self.SetStage(200)
		Else
			Self.SetStage(255)
		EndIf
	EndIf
EndFunction



;----------------------------------------------------------------------------------------------------
;Handling for Constance's Death
;------------------------------

;If Constance is killed, temporarily turn off any adoptions and wait 24h before we decide what to do.
Function ConstanceKilled()
	;Debug.Trace("Constance Killed")
	;Disable adoptions here.
	DisableOrphanageAdoptions()
	;Disable the 'Adopt from the Orphanage' objective.
	(BYOHRelationshipAdoptable as BYOHRelationshipAdoptableScript).ShowOrphanageObjective(2)
	;Wait at least 24h before putting the kids up for adoption again.
	RegisterForSingleUpdateGameTime(24)
EndFunction

Event OnUpdateGameTime()
	;Debug.Trace("Orphanage timer check. Can we enable adoptions?")
	if (BYOHRelationshipAdoptable.GetStage() == 0)		;Are we allowing any more adoptions?
		if (DB01.IsCompleted())							;Is Grelod dead, too?
			;Debug.Trace("Reenabling Orphanage Adoptions.")
			EnableOrphanedOrphanageAdoptions()
		Else
			;Debug.Trace("DB01 not yet complete. Waiting 24h.")
			RegisterForSingleUpdateGameTime(24)
		EndIf
	EndIf
EndEvent

;After Constance's death, get all of the Orphanage Orphans back into a state where they can be adopted.
Function EnableOrphanedOrphanageAdoptions()
	;Debug.Trace("Orphanage kids returned to the standard adoption system.")
	;Update Faction Rank variable.
	OrphanageFactionRank = -1
	;Update Faction and Relationship Ranks for the standard children.
	if (!(FrancoisRef as Actor).IsInFaction(BYOHRelationshipAdoptableFaction))
		(FrancoisRef as Actor).SetFactionRank(BYOHRelationshipAdoptableFaction, 11)
		(FrancoisRef as Actor).SetRelationshipRank(Game.GetPlayer(), 0)
	EndIf
	if (!(RunaRef as Actor).IsInFaction(BYOHRelationshipAdoptableFaction))
		(RunaRef as Actor).SetFactionRank(BYOHRelationshipAdoptableFaction, 11)
		(RunaRef as Actor).SetRelationshipRank(Game.GetPlayer(), 0)
	EndIf
	if (!(SamuelRef as Actor).IsInFaction(BYOHRelationshipAdoptableFaction))
		(SamuelRef as Actor).SetFactionRank(BYOHRelationshipAdoptableFaction, 11)
		(SamuelRef as Actor).SetRelationshipRank(Game.GetPlayer(), 0)
	EndIf
	if (!(HroarRef as Actor).IsInFaction(BYOHRelationshipAdoptableFaction))
		(HroarRef as Actor).SetFactionRank(BYOHRelationshipAdoptableFaction, 11)
		(HroarRef as Actor).SetRelationshipRank(Game.GetPlayer(), 0)
	EndIf
	;Update Faction and Relationship Ranks for any additional orphans.
	if (Orphan01.GetActorRef() != None && !Orphan01.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan01.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 13)
		Orphan01.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 0)
	EndIf
	if (Orphan02.GetActorRef() != None && !Orphan02.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan02.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 13)
		Orphan02.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 0)
	EndIf
	if (Orphan03.GetActorRef() != None && !Orphan03.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan03.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 13)
		Orphan03.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 0)
	EndIf
	if (Orphan04.GetActorRef() != None && !Orphan04.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan04.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 13)
		Orphan04.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 0)
	EndIf
	if (Orphan05.GetActorRef() != None && !Orphan05.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan05.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 13)
		Orphan05.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 0)
	EndIf
	if (Orphan06.GetActorRef() != None && !Orphan06.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan06.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 13)
		Orphan06.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 0)
	EndIf
	if (Orphan07.GetActorRef() != None && !Orphan07.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
		Orphan07.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, 13)
		Orphan07.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 0)
	EndIf
EndFunction