Scriptname DLC2dunGyldenhulFurnitureScript extends ObjectReference  Conditional
{Script for furniture associated with the fake wall in Gyldenhul Barrow.}

objectReference property lastActivateRef auto Hidden
{tracks the last triggeringRef}

bool property isRegisteredForEvents = false auto hidden
{bool to track if this is registered for events}

bool property canBeActivated = true auto hidden

idle property PickaxeExit auto

bool property playerIsLeavingFurniture = false auto hidden

bool property playerIsInFurniture = false auto hidden

Keyword property LinkCustom01 Auto


Event OnCellAttach()
	blockActivation()
	SetNoFavorAllowed()
EndEvent

Event OnUnload()
	UnregisterForEvents()
endEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if (asEventName == "AddToInventory")
		;Break the wall.
		Self.GetLinkedRef().Activate(Self)
		;Disable mining trigger and furniture.
		Self.GetLinkedRef(LinkCustom01).Disable()
		;Break player out of mining.
		Game.GetPlayer().PlayIdle(PickaxeExit)
	endif	

	if asEventName == "IdleFurnitureExit" || asEventName == "IdlePickaxeExit" || asEventName == "IdlePickaxeFloorExit" || asEventName == "IdlePickaxeTableExit"
		UnregisterForEvents()
	endif
endEvent


Auto STATE normal
	Event onBeginState()
		canBeActivated = true
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		if canBeActivated
			canBeActivated = False
			gotoState("busy")
			if akActionRef == Game.GetPlayer() && !isFurnitureInUse()
				RegisterForEvents()
				Activate(akActionRef, true)
			elseif akActionRef == Game.GetPlayer()
				Activate(akActionRef, true)
			else
				Activate(akActionRef, true)
			endif
		endif
		canBeActivated = true
	endEvent
endState

STATE busy
	Event onBeginState()
		canBeActivated = True
	EndEvent
	
	Event onActivate(objectReference akActionRef)
		if canBeActivated && isFurnitureInUse()
			canBeActivated = False
			if isRegisteredForEvents
				if akActionRef == lastActivateRef
					playerIsLeavingFurniture = True
					goToState("reseting")
				elseif akActionRef == game.GetPlayer()
					playerIsLeavingFurniture = True
					goToState("reseting")
				endif
			elseif akActionRef == game.GetPlayer()
				Activate(game.getPlayer(), true)
			else
			endif
		elseif !isFurnitureInUse() && akActionRef == game.GetPlayer()
			RegisterForEvents()
			Activate(akActionRef, true)
		endif
		canBeActivated = true
	endEvent
endState

state reseting
	event onBeginState()
		if playerIsLeavingFurniture
			playerIsLeavingFurniture = false
			Game.GetPlayer().PlayIdle(PickaxeExit)
		else
			UnregisterForEvents()
		endif
	endEvent
endState

function RegisterForEvents()
	if !isRegisteredForEvents
		isRegisteredForEvents = True
		RegisterForAnimationEvent(Game.GetPlayer(), "AddToInventory")
		RegisterForAnimationEvent(Game.GetPlayer(), "IdlePickaxeExit")
		RegisterForAnimationEvent(Game.GetPlayer(), "IdlePickaxeFloorExit")
		RegisterForAnimationEvent(Game.GetPlayer(), "IdlePickaxeTableExit")
		RegisterForAnimationEvent(Game.GetPlayer(), "IdleFurnitureExit")
	endif
endFunction

function UnregisterForEvents()
	if isRegisteredForEvents
		isRegisteredForEvents = false
		UnRegisterForAnimationEvent(Game.GetPlayer(), "AddToInventory")
		UnRegisterForAnimationEvent(Game.GetPlayer(), "IdlePickaxeExit")
		UnRegisterForAnimationEvent(Game.GetPlayer(), "IdlePickaxeFloorExit")
		UnRegisterForAnimationEvent(Game.GetPlayer(), "IdlePickaxeTableExit")
		UnRegisterForAnimationEvent(Game.GetPlayer(), "IdleFurnitureExit")
	endif
	gotoState("normal")
	canBeActivated = True
endFunction

