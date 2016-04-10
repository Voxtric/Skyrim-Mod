Scriptname DLC1SeranaCureQuestScript extends Quest  


FormList Property FactionsToRemove  Auto  
FormList Property SpellsToRemove  Auto  
ReferenceAlias Property AliasToClear  Auto  

ReferenceAlias Property SeranaAlias auto

Race Property DLC1NordRace auto
TextureSet Property PrettyEyes auto

Function Cure()
	Actor serana = SeranaAlias.GetActorReference()

	AliasToClear.Clear()
	; serana.SetRace(DLC1NordRace) ; whoops, can't do this on NPCs
	SetEyes()

	int count = 0
	while (count < FactionsToRemove.GetSize())
		Faction removed = FactionsToRemove.GetAt(count) as Faction
		Debug.Trace("SERANA CURE QUEST: Factions removed: " + count + "; " + removed)
		serana.RemoveFromFaction(removed)
		count += 1
	endwhile

	count = 0
	while (count < SpellsToRemove.GetSize())
		Spell removed = SpellsToRemove.GetAt(count) as Spell
		Debug.Trace("SERANA CURE QUEST: Spells removed: " + count + "; " + removed)
		serana.RemoveSpell(removed)
		count += 1
	endwhile

EndFunction



Function SetEyes()
	if (AliasToClear.GetReference() == None)
		Debug.Trace("SERANA CURE QUEST: Setting eye texture.")
		SeranaAlias.GetActorReference().SetEyeTexture(PrettyEyes)
	endif
EndFunction
