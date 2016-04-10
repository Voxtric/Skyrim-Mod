ScriptName DLC1VQ08VampAggressionScript extends ReferenceAlias
{This is to set the aggression on vampires during the siege}

Quest Property DLC1VQ08 auto
GlobalVariable Property DLC1PlayingVampireLine auto
Faction Property DLC1VQ08VampireSiegeFaction auto

auto State Waiting
	event onCellAttach()
		if !DLC1PlayingVampireLine.getValue() && DLC1VQ08.getStage() >= 40
			self.getActorReference().addToFaction(DLC1VQ08VampireSiegeFaction)
			self.getActorReference().setAV("Aggression", 1)
			goToState("Done")
		endif
	endEvent
endState

State Done
endState
