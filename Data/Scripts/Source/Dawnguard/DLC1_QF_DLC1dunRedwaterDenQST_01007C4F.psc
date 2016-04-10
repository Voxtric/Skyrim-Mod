;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 23
Scriptname DLC1_QF_DLC1dunRedwaterDenQST_01007C4F Extends Quest Hidden

;BEGIN ALIAS PROPERTY CaptiveMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaptiveMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ChatterActor1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ChatterActor1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DenCageDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DenCageDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedwaterFactionMember03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RedwaterFactionMember03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CageVampire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CageVampire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExteriorThug2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExteriorThug2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BouncerDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BouncerDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Patron3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Patron3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CageDeadbody1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CageDeadbody1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Patron2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Patron2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Patron1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Patron1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExteriorThug1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExteriorThug1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attendant2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attendant2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bouncer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bouncer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerCageDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PrisonerCageDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attendant1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attendant1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ChatterActor2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ChatterActor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedwaterFactionMember04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RedwaterFactionMember04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedwaterFactionMember05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RedwaterFactionMember05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedwaterFactionMember02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RedwaterFactionMember02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1RedwaterDenLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DLC1RedwaterDenLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedwaterFactionMember01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RedwaterFactionMember01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Player has been given a second and final free sample
Game.getPlayer().addItem(DLC1RedwaterDenSkooma, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;cage scene is over, unlock player controls. Function lives on the quest script
AllowAllPlayerControls()
utility.wait(90.0)
debug.Trace(self + ": timer up, unlock door")
if alias_DenCageDoor.getRef().isLocked()
	debug.Trace(self + ": door is locked, should now be unlocked")
	alias_DenCageDoor.getRef().Lock(False)
else
	debug.Trace(self + ": door is not locked, move along")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has taken skooma, should pass out and be moved
debug.trace(self + ": player has taken skooma in RedwaterDen")


;Here we move the player, function lives on the quest script
KnockoutPlayer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Quest doesn't need to run any more, clear location and stop
DLC1RedwaterDenLocationReservation.clear()
DLC1RedwaterDisableOnResetMarker.Disable()
alias_Patron1.getActorRef().kill()
alias_Patron2.getActorRef().kill()
alias_Patron3.getActorRef().kill()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;start up script - this will need to set the faction relationships

;Set dungeon faction neutral to dunPrisoner
DLC1dunRedwaterDenFaction.setAlly(dunPrisonerFaction, True, True)
;Set dungeon faction neutral to Player, this changes later in the dungeon quest, also follower and horse factions
DLC1dunRedwaterDenFaction.setEnemy(PlayerFaction, True, True)
DLC1dunRedwaterDenFaction.setEnemy(PlayerFollowerFaction, True, True)
DLC1dunRedwaterDenFaction.setEnemy(PlayerHorseFaction, True, True)
DLC1dunRedwaterDenFaction.setEnemy(DLC1PlayerVampireLordFaction, False, False)
DLC1dunRedwaterDenFaction.setEnemy(PlayerWerewolfFaction, False, False)
;Set dungeon faction neutral to VampireFaction
DLC1dunRedwaterDenFaction.setAlly(VampireFaction, True, True)

;Calm the guards down
alias_ExteriorThug1.getActorRef().setAV("Aggression", 1)
alias_ExteriorThug2.getActorRef().setAV("Aggression", 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Cage Door has been unlocked

;Set dungeon faction enemy to Player, also follower and horse
DLC1dunRedwaterDenFaction.setEnemy(PlayerFaction, False, False)
DLC1dunRedwaterDenFaction.setEnemy(PlayerFollowerFaction, False, False)
DLC1dunRedwaterDenFaction.setEnemy(PlayerHorseFaction, False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player is in cage, wakes up but controls are still mostly locked. Function lives on the quest script

alias_Attendant1.getReference().moveto(RedwaterDenCageSceneAttendantMarker)
alias_CageVampire.getReference().moveto(RedwaterDenCageSceneVampireMarker)
alias_Patron1.getActorRef().kill()
alias_Patron2.getActorRef().kill()
alias_Patron3.getActorRef().kill()
alias_Patron1.getReference().moveto(game.getPlayer())
alias_Patron2.getReference().moveto(game.getPlayer())
alias_Patron3.getReference().moveto(game.getPlayer())
DLC1dunRedwaterDenCageScene.start()
WakeUpPlayer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player has unlocked 'forbidden' doors or attacked people, thralls turn hostile to him
debug.trace(self + ": player unlocked forbidden door in RedwaterDen")

;Set dungeon faction enemy to Player, also follower and horse factions
DLC1dunRedwaterDenFaction.setEnemy(PlayerFaction, False, False)
DLC1dunRedwaterDenFaction.setEnemy(PlayerFollowerFaction, False, False)
DLC1dunRedwaterDenFaction.setEnemy(PlayerHorseFaction, False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Player has been given a free sample
Game.getPlayer().addItem(DLC1RedwaterDenSkooma, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Doorman Scene done, get him to open the door
(alias_Bouncer.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Door is open
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PlayerFaction  Auto  

Faction Property dunPrisonerFaction  Auto  

Faction Property DLC1dunRedwaterDenFaction  Auto  

Faction Property VampireFaction  Auto  

LocationAlias Property DLC1RedwaterDenLocationReservation  Auto  

Potion Property DLC1RedwaterDenSkooma  Auto  

ObjectReference Property RedwaterDenCageSceneVampireMarker  Auto  

ObjectReference Property RedwaterDenCageSceneAttendantMarker  Auto  

Scene Property DLC1dunRedwaterDenCageScene  Auto  

Float Property knockOutDelay = 7.0 auto
{Time delay to knock out after taking the skooma
	Default = 7.0}

Function KnockoutPlayer()
				;abMovement, abFighting, abCamSwitch, abLooking, abSneaking, abMenu, abActivate, abJournalTab, aiDisablePOVType
	
	;Stop the player from accessing the menu or fighting
	game.DisablePlayerControls(false, true, true, false, false, true, true, True)

	;Try to get the player out of combat (to avoid bugs)
	game.GetPlayer().StopCombat()

	;wait a bit so that the player has a chance to feel drugged out
	utility.wait(knockOutDelay)

	;disable player controls and FTB
	game.DisablePlayerControls(true, true, true, true, true, true, true, True)
	FadeToBlackHoldImod.applyCrossFade(2.0)

	;Then wait and move the player to the captive marker
	utility.wait(4.5)
	game.getPlayer().MoveTo(alias_CaptiveMarker.getReference())
	;Check if the player has follower and/or animal follower and boot them out too
	if PlayerFollower
		PlayerFollower.GetActorReference().MoveTo(game.getPlayer())
	endif
	if PlayerAnimalFollower
		PlayerAnimalFollower.GetActorReference().MoveTo(game.getPlayer())
	endif
endFunction

Function WakeUpPlayer()
	
	;"wake up" the player and Fade from Black
	utility.wait(3.0)
	ImagespaceModifier.removeCrossFade(40.0)
	game.EnablePlayerControls(false, false, false, true, false, false, false, false)

endFunction

Function AllowAllPlayerControls()
	;Enable all player controls again
	game.EnablePlayerControls(true, true, true, true, true, true, true, True)

endFunction

ImageSpaceModifier Property FadeToBlackImod  Auto  

ImageSpaceModifier Property FadeToBlackBackImod  Auto  

ImageSpaceModifier Property FadeToBlackHoldImod  Auto  

Faction Property PlayerFollowerFaction  Auto  

Faction Property PlayerHorseFaction  Auto  

Faction Property PlayerWerewolfFaction  Auto  

Faction Property DLC1PlayerVampireLordFaction  Auto  

ReferenceAlias Property PlayerFollower  Auto  

ReferenceAlias Property PlayerAnimalFollower  Auto  

ObjectReference Property DLC1RedwaterDisableOnResetMarker Auto  
