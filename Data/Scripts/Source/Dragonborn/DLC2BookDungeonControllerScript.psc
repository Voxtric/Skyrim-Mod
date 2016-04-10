Scriptname DLC2BookDungeonControllerScript extends Quest  Conditional

import Game

; called by player script
function PlayerInBleedout()
	bPlayerBleedingOut = true
; 	debug.trace(self + " PlayerInBleedout: CurrentLocation=" + Game.GetPlayer().GetCurrentLocation() + " DungeonLocation=" + DungeonLocation)
; 	debug.trace(self + " PlayerInBleedout: is current location child of DungeonLocation? " + DungeonLocation.IsChild(Game.GetPlayer().GetCurrentLocation()) )
; 	debug.trace(self + " PlayerAlias=" + PlayerAlias.GetRef())

	Actor player = Game.GetPlayer()
	; make sure player is in dungeon location
	if player.IsInLocation(DungeonLocation) || player.GetWorldspace() == DLC2ApocryphaWorld
		Game.DisablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, abLooking = false, abSneaking = true, abMenu = true, abActivate = true, abJournalTabs = true)
; 		debug.trace(self + " PlayerAlias=" + PlayerAlias.GetRef())
		utility.wait(2.0)
		DLC2ApocryphaRewardBookEnter.Apply()
		utility.wait(1.5)
		DLC2ApocryphaRewardBookEnter.PopTo(FadeToBlackHoldImod)
		; move player home
		MovePlayerHome(true)
	else
		; otherwise, clear alias and let player die
		PlayerAlias.Clear()
	endif
	Game.EnablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, abLooking = false, abSneaking = true, abMenu = true, abActivate = true, abJournalTabs = true)
	bPlayerBleedingOut = false
endFunction

; called by Apocrypha book activator when it's "read" by player
function ReadApocryphaBook(DLC2ApocryphaBookScript pApocryphaBook, bool bRequireQuestStageToMove = true, bool bRequireRewardsShownToMove = False, bool bRewardsShown = False, bool bShowRewardsOnActivation = False)
; 	debug.trace(self + " DLC2BlackBookRewardScript=" + pApocryphaBook + ", bRequireQuestStageToMove=" + bRequireQuestStageToMove + ", bRequireRewardsShownToMove=" + bRequireRewardsShownToMove+ ", bRewardsShown=" + bRewardsShown + ", bShowRewardsOnActivation=" + bShowRewardsOnActivation)

	; check quest stage now (because we're about to set it)
	bool isMovingAllowed = ((!bRequireQuestStageToMove || (bRequireQuestStageToMove && pApocryphaBook.myQuest.GetStageDone(pApocryphaBook.myQuestStage))) && \
								(!bRequireRewardsShownToMove || bRewardsShown))

	; set quest stage
	if pApocryphaBook.myQuest
		pApocryphaBook.myQuest.setStage(pApocryphaBook.myQuestStage)
	endif

	; Should we send the player back to Tamriel?
; 	debug.trace(self + " pApocryphaBook.GetLinkedRef(DLC2ApocryphaBookLink)=" + pApocryphaBook.GetLinkedRef(DLC2ApocryphaBookLink))
; 	debug.trace(self + " pApocryphaBook.GetLinkedRef(DLC2ApocryphaBookLink) as DLC2BlackBookScript=" + pApocryphaBook.GetLinkedRef(DLC2ApocryphaBookLink) as DLC2BlackBookScript)
	DLC2BlackBookScript myBook = (pApocryphaBook.GetLinkedRef(DLC2ApocryphaBookLink) as DLC2BlackBookScript)
; 	debug.trace(self + " myBook=" + myBook)
	if myBook
		if isMovingAllowed
			ReadBook(myBook)
		endif
	else
		; BAD DATA - this should never happen
; 		debug.TraceAndBox(self + " WARNING - BAD DATA - missing link to matching Tamriel book")
	endif
	
	; Should we display the Reward Activators?
	if (bShowRewardsOnActivation && !bRewardsShown)
		if (pApocryphaBook as DLC2ApocryphaBookRewardScript)
			(pApocryphaBook as DLC2ApocryphaBookRewardScript).ShowRewards()
		Else
			(pApocryphaBook as DLC2MiraakAltarScript).ShowRewards()
		EndIf
	EndIf	
endFunction


; called by book when it's read by player
; return TRUE if reading is successful; false if nothing happens (player is not moved)

; pDataBook - this is the book ref in the holding cell that holds all the data
; pRealBook - this is the book that is actually being read - could be in the player's inventory.
; ReenableControls: set to false to leave controls disabled after reading

bool function ReadBook(DLC2BlackBookScript pDataBook, DLC2BlackBookScript pRealBook = None)
; 		debug.trace(self + " ReadBook: " + pDataBook)
		Actor player = Game.GetPlayer()
		; does player have anything equipped in hands?
		bool bWaitForUnequip = ( player.GetEquippedItemType(0) > 0 || player.GetEquippedItemType(1) > 0 ) && player.IsWeaponDrawn()
; 		debug.trace(self + "bWaitForUnequip = " + bWaitForUnequip )

		utility.waitMenuMode(1.5)	; wait for book opening animation


		; basic checks for "are we allowed to be moved at all" - note that we only check if the player has picked up book - if she's reading it "in the world" you always get moved
		if pDataBook.bPlayerHasRead
			if !IsReadingAllowed()
; 				debug.trace(self + "ReadBook - not allowed to read - just play effects")
				; if not allowed to be moved, just do "base read" effect
; 	; 			debug.trace(self + " OnEquipped - can't move player")		
				; close menu, disable player controls briefly, force first person
				Game.DisablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = false, abLooking = false, abSneaking = false, abMenu = true, abActivate = false, abJournalTabs = false)
				utility.wait(0.5)
				game.ShakeCamera(afStrength = 0.5, afDuration = 1.5) 
				AMBBlackBookShakeMarker.Play(player)
				Game.EnablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = false, abLooking = false, abSneaking = false, abMenu = true, abActivate = false, abJournalTabs = false)

				return false ; no reading
			endif
		endif

; 		debug.trace(self + "ReadBook - reading allowed")
		; set bPlayerHasRead flag
		pDataBook.bPlayerHasRead = true

		; we are allowed to read the book
		
		; is this a book - if so, give it to the player if he doesn't already have it
		if (pDataBook.GetBaseObject() as Book)
; 			debug.trace(pDataBook + " is a Book")
			if player.GetItemCount(pDataBook.GetBaseObject()) == 0
				; add real book to player's inventory
				if pRealBook
; 					debug.trace("ReadBook - adding " + pRealBook + " to inventory")
					; swap aliases so it goes back to full name
					TakeBook(pDataBook)
					; disable sound
					pDataBook.GetLinkedRef(DLC2LinkBlackBookSound).Disable()
					; add it to the player's inventory
					player.AddItem(pRealBook)
				endif
			endif
		endif

		; basic reading sequence:

		; close menu force fp, lock controls
		Game.DisablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, abLooking = pDataBook.DisableLooking, abSneaking = true, abMenu = true, abActivate = true, abJournalTabs = true)

		; wait for player to sheath weapons
		if bWaitForUnequip
			utility.wait(2.0)							
		endif

		; time to move player -where?
		; are we in Apocrypha, or in Tamriel?
		bool bMoveToApocrypha = false
		
		if PlayerAlias.GetActorRef() && (player.IsInLocation(DLC2ApocryphaLocation) || player.GetWorldspace() == DLC2ApocryphaWorld)
; 			debug.trace(self + "ReadBook - in Apocrypha, move player home")
			; in Apocrypha, so reading sends us home
			MovePlayerHome()
		elseif player.IsInLocation(DLC2SolstheimLocation)
; 			debug.trace(self + "ReadBook - in Tamriel, move player to Apocrypha")
			bMoveToApocrypha = true
			; in Tamriel, so reading sends us to Apocrypha (if allowed)
			MovePlayerToDungeon(pDataBook.DungeonMarker, pDataBook.DungeonLocation)
		else
; 			debug.trace(self + "ReadBook - ERROR - we don't know where you are - do nothing")
			; do nothing - something went wrong
		endif
		; reenable controls
		if pDataBook.ReenableControls
; 			debug.trace("ReadBook - reenabling controls")
			Game.EnablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, abLooking = pDataBook.DisableLooking, abSneaking = true, abMenu = true, abActivate = true, abJournalTabs = true)
		else
; 			debug.trace("ReadBook - NOT reenabling controls - reenable flag on " + pDataBook + " is false")
		endif

		; autosave - not first time in book01 dungeon
		if pDataBook.ReenableControls
			Game.RequestAutoSave()
		EndIf

		; do this last because it waits
		if bMoveToApocrypha
			CheckForHMIntro()
		endif
		; set quest stage on book if there is one
		if pDataBook.myQuest
			pDataBook.myQuest.SetStage(pDataBook.myQuestStage)
		endif

		return true ; book was read
endFunction

; call this function to swap book ref into "full name" alias
function TakeBook(DLC2BlackBookScript pDataBook)
	Book myBase = pDataBook.GetBaseObject() as Book
; 	debug.trace(self + "TakeBook: base book=" + myBase)
	; find this in the book array
	int myIndex = BlackBooks.Find(myBase)
; 	debug.trace(self + "TakeBook: index=" + myIndex)
	; swap aliases if we haven't already
	if BlackBookAliases[myIndex].GetRef()
		BlackBookFinalAliases[myIndex].ForceRefTo(BlackBookAliases[myIndex].GetRef())
		BlackBookAliases[myIndex].Clear()
	endif
endFunction


; call this function to move player back to starting point
function MovePlayerHome(bool bHealPlayer = false)
; 	debug.trace(self + "MovePlayerHome START: bHealPlayer=" + bHealPlayer)
	Actor player = Game.GetPlayer()
	player.GetActorBase().SetInvulnerable(true)
	; remove spell
	player.RemoveSpell(DLC2abApoWaterDamage)

	if !bHealPlayer
		DLC2ApocryphaRewardBookEnter.Apply()
		utility.wait(1.5)
		DLC2ApocryphaRewardBookEnter.PopTo(FadeToBlackHoldImod)
	EndIf

	if bHealPlayer
		; restore health
		player.RestoreActorValue("Health", 9999)
; 		debug.trace(self + "MovePlayerHome: healed player - current health= " + player.getActorValue("Health"))
	endif

	; TEST 93097 - get equipped spells
	Spell leftSpell = player.GetEquippedSpell(0)
	Spell rightSpell = player.GetEquippedSpell(1)
; 	debug.trace(self + " spells equipped: left hand=" + leftSpell + ", right hand=" + rightSpell)

	player.MoveTo(TamrielMarker)
	FadeToBlackHoldImod.PopTo(DLC2ApocryphaRewardBookExit)
	FadeToBlackHoldImod.Remove()
	; clear from alias - make sure healed first as a failsafe for water damage
	if player.GetActorValue("Health") < 0
		; restore health
		player.RestoreActorValue("Health", 9999)
; 		debug.trace(self + "MovePlayerHome: healed player - current health= " + player.getActorValue("Health"))
	endif
	PlayerAlias.Clear()
	player.GetActorBase().SetInvulnerable(false)
	; TEST - wait
	utility.wait(3.0)
	; test to fix equip bug 93097
	int ileftHand = player.GetEquippedItemType(0)
	int iRightHand = player.GetEquippedItemType(1)
; 	debug.trace(self + " item type equipped: left hand=" + ileftHand + ", right hand=" + iRightHand)
	; if nothing in hand still (or staff), set graph variables to make sure animation is cleared
	if iLeftHand == 8
		player.UnequipItem(player.GetEquippedWeapon(true), false, true)
	elseif iLeftHand == 0
		player.SetAnimationVariableInt("iLeftHandType", 0)
	EndIf

	if iRightHand == 8
		player.UnequipItem(player.GetEquippedWeapon(false), false, true)
	elseif iRightHand == 0
		player.SetAnimationVariableInt("iRightHandType", 0)
	EndIf
	; END TEST


endFunction

; call this function to move player to dungeon
function MovePlayerToDungeon(ObjectReference newDungeonMarker, Location newDungeonLocation)
; 	debug.trace(self + "MovePlayerToDungeon: to " + newDungeonMarker)
	Actor player = Game.GetPlayer()
	if player.IsDead()
		return
	endif
	; first, move Tamriel marker to player's location
	TamrielMarker.MoveTo(player)
	; save current dungeon marker & location
	DungeonMarker = newDungeonMarker
	DungeonLocation = newDungeonLocation
	; put player in alias
	PlayerAlias.ForceRefTo(player)
	; put follower in book follower alias
	if Follower.GetRef()
		BookFollowerAlias.ForceRefTo(Follower.GetRef())
		DLC2BookReadScene.Start()
	EndIf
	; reading sequence:
	Game.ForceThirdPerson()
	; equip armor item
	player.equipItem(DLC2ApocryphaBookWarpArmor, false, true)
	; play idle
	player.PlayIdle(IdleDLC2TentacleWarpBook)
	; imod
	DLC2ApocryphaBookEnter.Apply()
	OBJApocryphaBookTentaclesTamriel.Play(player)
	utility.wait(5.0)
	DLC2ApocryphaBookEnter.PopTo(FadeToBlackHoldImod)
	player.removeItem(DLC2ApocryphaBookWarpArmor, 1, true)
	; move player
	player.MoveTo(DungeonMarker)
	; special case for MQ02 book01 dungeon:
	if newDungeonLocation == DLC2Book01DungeonLocation && !bMQ02SceneStarted
; 		debug.trace(self + " special case for MQ02 scene - start MQ02 fadeup")
		; set flag and play special fadeup
		bMQ02SceneStarted = true
		FadeToBlackHoldImod.PopTo(DLC2ApocryphaBookExitMQ02)
	else
		FadeToBlackHoldImod.PopTo(DLC2ApocryphaBookExit)
	endif
	FadeToBlackHoldImod.Remove()
	utility.wait(2)
	; add spell
	Game.GetPlayer().AddSpell(DLC2abApoWaterDamage, false)
endFunction

; helper function that really should live on Location
; compare two locations - if one is a child of the other, return true
;bool function IsSameOrChildLocation(Location Location1, Location Location2)
;	debug.trace(self + " IsSameOrChildLocation location1=" + Location1 + ", location2=" + Location2)
;	if Location1==None || Location2==None
;		return false
;	else
;		return (Location1 == Location2 || Location1.IsChild(Location2) || Location2.IsChild(Location1) )
;	endif
;endFunction

; returns true if player is allowed to read book and move to Apocrypha
; also displays appropriate failure messages
bool function IsReadingAllowed(bool bDisplayMessages = true)
	Actor player = Game.GetPlayer()
	bool bAllowReading = false

	if player.GetSitState() != 0
		; player is sitting
; 		debug.trace(self + " sitting")
		if bDisplayMessages
			DLC2BookFailureGenericMSG.Show()
		endif
	elseif ( !player.IsInLocation(DLC2SolstheimLocation) && !player.IsInLocation(DLC2ApocryphaLocation) )
		; not in Solstheim
; 		debug.trace(self + " Not in Solstheim or Apocrypha")
		if bDisplayMessages
			DLC2BookFailureSolstheimMSG.Show()
		endif
	elseif !IsControlsEnabled()
		; controls disabled
; 		debug.trace(self + " controls are disabled")
		if bDisplayMessages
			DLC2BookFailureGenericMSG.Show()
		endif
	elseif player.IsInCombat()
; 		debug.trace(self + " player is in combat")
		; player is in combat
		if bDisplayMessages
			DLC2BookFailureCombatMSG.Show()
		endif
	else
		bAllowReading = true
	EndIf

	return bAllowReading
endFunction

; helper function to check if any of the controls we care about are disabled
bool function IsControlsEnabled()
	; check for:
		; movement
		; fighting
		; activation
		; menu
		; sneaking
		; looking
		; fast travel - because of Nchardak, don't care about fast travel being disabled if on Solstheim
; 		debug.trace(self + "IsFastTravelControlsEnabled: fast travel = " + IsFastTravelControlsEnabled() )
	return ( IsFightingControlsEnabled() && IsActivateControlsEnabled() && IsLookingControlsEnabled() && IsMenuControlsEnabled() && IsMovementControlsEnabled() && IsSneakingControlsEnabled() && (IsFastTravelControlsEnabled () || Game.GetPlayer().IsInLocation(DLC2SolstheimLocation)) )
endFunction

; helper function to change book property - pass it along to the data book
function SetReenableControls(DLC2BlackBookScript pBook, bool bReenableControlsFlag)
	(pBook.myReference as DLC2BlackBookScript).ReenableControls = bReenableControlsFlag
endFunction

; special function for Book 1 intro (since it isn't called when you read the book)
function Book01DungeonHMIntro()
	if bHMIntroScenePlayed
		return
	EndIf

	; otherwise, play the intro scene
	bHMIntroScenePlayed = true

	; move HM into place
	HermaeusMoraTA.MoveTo(Game.GetPlayer())
;	HermaeusMoraFX.MoveTo(Game.GetPlayer())

	; HM appears
	HermaeusMoraIntroFX[0].ChangeState()

;	HermaeusMoraFX.Enable()
	utility.wait(1.0)
	HermaeusMoraTA.Enable()
	DLC2BookDungeonHMIntroScene.Start()
	; hold until scene is done
	while DLC2BookDungeonHMIntroScene.IsPlaying()
		utility.wait(1.0)
		; if player isn't in Apocrypha, kill scene
		if Game.GetPlayer().IsInLocation(DLC2ApocryphaLocation) == false
			DLC2BookDungeonHMIntroScene.Stop()
		endif
	endwhile
	; HM disappears
	HermaeusMoraIntroFX[0].ChangeState(false)
	HermaeusMoraTA.Disable()
endFunction

; if player has entered apocrypha for the first time, play HM intro
function CheckForHMIntro()
	; if already played, or in Book01Dungeon, exit
	if bHMIntroScenePlayed || DungeonLocation == DLC2Book01DungeonLocation
		return
	EndIf

	; otherwise, play the intro scene
	bHMIntroScenePlayed = true

	; get location index
	int iLocationIndex = BookDungeonLocations.Find(DungeonLocation)
	if iLocationIndex < 1
		; bad data or first dungeon - return
	endif

	; move HM into place
	HermaeusMoraTA.MoveTo(Game.GetPlayer())
;	HermaeusMoraFX.MoveTo(Game.GetPlayer())

	; HM appears
	HermaeusMoraIntroFX[iLocationIndex].ChangeState()

;	HermaeusMoraFX.Enable()
	utility.wait(1.0)
	HermaeusMoraTA.Enable()
	DLC2BookDungeonHMIntroScene.Start()
	; hold until scene is done
	while DLC2BookDungeonHMIntroScene.IsPlaying()
		utility.wait(1.0)
		; if player isn't in Apocrypha, kill scene
		if Game.GetPlayer().IsInLocation(DLC2ApocryphaLocation) == false
			DLC2BookDungeonHMIntroScene.Stop()
		endif
	endwhile
	; HM disappears
	HermaeusMoraIntroFX[iLocationIndex].ChangeState(false)
	HermaeusMoraTA.Disable()
endFunction

; called when player "finishes" each black book, to track for achievement
function IncrementBookFinished()
	iBlackBookFinishedCount = iBlackBookFinishedCount + 1
	if iBlackBookFinishedCount >= iBlackBookFinishedForAchievement
		Game.AddAchievement(71)
	endif
endFunction

int iBlackBookFinishedCount
int Property iBlackBookFinishedForAchievement = 5 Auto

bool bMQ02SceneStarted = false ;used to trigger special MQ02 fadeup first time you enter book01 dungeon

ObjectReference Property TamrielMarker  Auto  
{moveto marker in Tamriel}

ObjectReference Property DungeonMarker  Auto  
{marker in dungeon to move player to - passed by book script}

ReferenceAlias Property PlayerAlias  Auto  

Location Property DungeonLocation  Auto  
{passed in from book}

Location Property DLC2SolstheimLocation  Auto  
Location Property DLC2ApocryphaLocation  Auto  
Worldspace Property DLC2ApocryphaWorld Auto

Keyword Property DLC2ApocryphaBookLink Auto
Keyword Property DLC2LinkBlackBookSound Auto


Message Property DLC2BookFailureCombatMSG  Auto  
Message Property DLC2BookFailureGenericMSG Auto
Message Property DLC2BookFailureSolstheimMSG Auto


SPELL Property DLC2abApoWaterDamage  Auto  

Scene Property DLC2BookDungeonHMIntroScene  Auto  

Location Property DLC2Book01DungeonLocation  Auto  
{Miraak's temple - don't play HM intro here}

bool Property bHMIntroScenePlayed = false Auto Conditional
; set to true after intro has played

ObjectReference Property HermaeusMoraTA auto
ObjectReference Property HermaeusMoraFX auto

ReferenceAlias[] Property BlackBookAliases  Auto  
{list of starting black book aliases (name replacement)}

ReferenceAlias[] Property BlackBookFinalAliases  Auto  
{matching array of "final" aliases (without name replacement)}

Book[] Property BlackBooks  Auto  
{array of book base objects (matching index to alias arrays)}

Armor Property DLC2ApocryphaBookWarpArmor Auto
{ black book reading item }

Idle Property IdleDLC2TentacleWarpBook Auto
{ player animation for reading inventory book }

ImageSpaceModifier Property DLC2ApocryphaBookEnter Auto
{ imagespace to play during book to Apocrypha transition}

ImageSpaceModifier Property FadeToBlackImod  Auto  

ImageSpaceModifier Property FadeToBlackHoldImod  Auto  

ImageSpaceModifier Property FadeToBlackBackImod  Auto  

ImageSpaceModifier Property DLC2ApocryphaBookExit  Auto  
ImageSpaceModifier Property DLC2ApocryphaBookExitMQ02  Auto  
ImageSpaceModifier Property DLC2ApocryphaRewardBookEnter  Auto  
ImageSpaceModifier Property DLC2ApocryphaRewardBookExit  Auto  

Location[] Property BookDungeonLocations Auto
{ array of book dungeon locations, used to index the HermaeusMoraIntroFX array }

DLC2HermaeusMoraFaceFXSCRIPT[] Property HermaeusMoraIntroFX Auto
{ array of the HM effect refs, matching the book dungeon location array }
ReferenceAlias Property Follower  Auto  

ReferenceAlias Property BookFollowerAlias  Auto  

Scene Property DLC2BookReadScene  Auto  

Sound Property AMBBlackBookShakeMarker  Auto  

Sound Property OBJApocryphaBookTentaclesTamriel  Auto  

bool Property bPlayerBleedingOut Auto Conditional
{ set to true while the player is in the process of being moved home }

