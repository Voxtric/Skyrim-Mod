Scriptname DLC1VQ06QuestScript extends Quest  Conditional

GlobalVariable Property pDLC1VQ06MothsFound Auto
GlobalVariable Property pDLC1VQ06MothsTotal Auto
VisualEffect Property pDLC1ReadElderScrollBlankEffect Auto
VisualEffect Property pDLC1ReadElderScrollEffect Auto
ImageSpaceModifier Property pFadeToWhiteHoldImod Auto
VisualEffect Property pDLC01_ScrollAttunementEffect Auto 

Function TreeCheck()

	if GetStage() == 20
		SetStage(30)
	endif

endFunction

Function ScrollRead()

	;Disable Controls
	Game.DisablePlayerControls(true,true,true,false,true,true,false,false)
	Game.SetInChargen(true, true, false)

	;Play New Elder Scrolls Effects
	pDLC1ReadElderScrollBlankEffect.Play(Game.GetPlayer(),50)
	pDLC1ReadElderScrollEffect.Play(Game.GetPlayer(),50)

	;Crossfade to White Delay (Initial)
	Utility.Wait(38)
	pFadeToWhiteHoldImod.applyCrossFade(1.0)

	;Crossfade from White Delay (Post)
	Utility.Wait(3)
	ImagespaceModifier.removeCrossFade(40.0)
	Game.EnablePlayerControls(false, false, false, true, false, false, false, false)
	Game.SetInChargen(false,false,false)

endFunction

Function TreeHarvested(Int TreeNumber)

endFunction

int property barkGiven = 0 auto hidden
referenceAlias property DLC1VQ06CanticleBark1 auto
referenceAlias property DLC1VQ06CanticleBark2 auto
referenceAlias property DLC1VQ06CanticleBark3 auto
referenceAlias property DLC1VQ06CanticleBark4 auto
referenceAlias property DLC1VQ06CanticleBark5 auto
MiscObject property DLC1CanticleBarkFake auto

Function GiveBark()
	game.GetPlayer().removeItem(DLC1CanticleBarkFake, 1, abSilent = True)
	if barkGiven == 0
		game.getPlayer().addItem(DLC1VQ06CanticleBark1.getRef(), 1, abSilent = True)
	endif
	TreeCheck()
	barkGiven +=1
endFunction

Function AddMoths()
	if pDLC1VQ06MothsFound.getValue() < pDLC1VQ06MothsTotal.GetValue()
		ModObjectiveGlobal(1, pDLC1VQ06MothsFound, 30)
		pDLC1MothAttachFX01Effect.Play(Game.GetPlayer())
		if pDLC1VQ06MothsFound.GetValue() == 1
			SetStage(40)
			pDLC01_ScrollAttunementEffect.Play(Game.GetPlayer(), -1)
			Game.GetPlayer().SetSubGraphFloatVariable("ftoggleBlendAlt", 0.2)
		elseif pDLC1VQ06MothsFound.GetValue() == 2
			Game.GetPlayer().SetSubGraphFloatVariable("ftoggleBlendAlt", 0.3)
		elseif pDLC1VQ06MothsFound.GetValue() == 3
			Game.GetPlayer().SetSubGraphFloatVariable("ftoggleBlendAlt", 0.4)
		elseif pDLC1VQ06MothsFound.GetValue() == 4
			Game.GetPlayer().SetSubGraphFloatVariable("ftoggleBlendAlt", 0.5)
		elseif pDLC1VQ06MothsFound.GetValue() == 5
			Game.GetPlayer().SetSubGraphFloatVariable("ftoggleBlendAlt", 0.6)
		elseif pDLC1VQ06MothsFound.GetValue() == 6
			Game.GetPlayer().SetSubGraphFloatVariable("ftoggleBlendAlt", 0.7)
		elseif pDLC1VQ06MothsFound.GetValue() >= pDLC1VQ06MothsTotal.GetValue()
			Game.GetPlayer().SetSubGraphFloatVariable("ftoggleBlendAlt", 1.0)
			utility.wait(2)
			Game.GetPlayer().SetSubGraphFloatVariable("ftoggleBlendAlt", 0.7)
			SetStage(50)
		endif
	endif
endFunction


VisualEffect Property pDLC1MothAttachFX01Effect Auto


;/     ***OLD SCRIPT GUTS***
GlobalVariable Property pDLC1VQ06HaveKnife  Auto  
GlobalVariable Property pDLC1VQ06MothsFound  Auto  
GlobalVariable Property pDLC1VQ06MothsTotal  Auto
GlobalVariable Property pDLC1VQ06TreeDone Auto Conditional  
Quest Property pDLC1VQ06  Auto
Message Property pDLC1VQ06KnifeMessage Auto
Message Property pDLC1VQ06TreeMessage Auto
VisualEffect Property pDLC1MothAttachFX01Effect Auto
int Property pTreeUsedUp Auto
DLC1VQ06QuestScript Property pDLC1VQ06QS Auto

Event OnActivate(ObjectReference akActionRef)

	if pTreeUsedUp == 0
		if pDLC1VQ06HaveKnife.GetValue() == 1
			pDLC1VQ06MothsFound.SetValue(pDLC1VQ06MothsFound.GetValue() +1)
			pDLC1VQ06QS.TreeCheck()
			pDLC1MothAttachFX01Effect.Play(Game.GetPlayer())
			pDLC1VQ06TreeDone.SetValue(1)
			if pDLC1VQ06MothsFound.GetValue() >= 5
				pDLC1VQ06.SetStage(30)
			endif
			pTreeUsedUp = 1
		elseif pDLC1VQ06HaveKnife.GetValue() == 0
			BlockActivation()
			pDLC1VQ06KnifeMessage.Show()
		endif
	elseif pTreeUsedUp >= 1
		BlockActivation()
		pDLC1VQ06TreeMessage.Show()
	endif

endEvent
/;