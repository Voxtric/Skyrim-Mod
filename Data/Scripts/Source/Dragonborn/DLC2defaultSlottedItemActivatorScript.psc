Scriptname DLC2defaultSlottedItemActivatorScript extends ObjectReference  
{This is a generic script for slotted item activators like the DweDynamoTrigger}

import debug
import utility

bool property isOn = false	auto conditional
{set to true to start open}

bool property itemIsNotRemovable = false auto
{if this item cannot be removed once slotted set this to true
	default = false}

bool property playerOnly = false auto
{If this is true, this sets no favor allowed on this
	default = false}

bool property silenceContainerMessage auto
{if this is set to true, do not display item added/removed messages
	default = false}

bool property doOnce = false auto
{set to true to open/close on first activation only}

bool property doesNotRemoveItem = false auto
{if this is set to true, this requires an item but does not remove it from your inventory
	Default = FALSE}

bool property isAnimating = false auto Hidden
{is the activator currently animating from one state to another?}

string property onAnim = "on" auto
{animation to play when opening}

string property offAnim = "off" auto
{animation to play when closing}

string property startOnAnim = "startOn" auto
{open event name - waits for this event before considering itself "open"}

string property doneEvent = "done" auto
{close event name - waits for this event before considering itself "closed"}

message property itemNeededMessage auto
{if set, this message is shown when the player activates this and does not have the required item}

message property busyMessage auto
{if set, this message is displayed if activated while busy}

miscObject property requiredItem auto
{This is the object to be slotted into the activator}

int property myState = 1 auto hidden

float property waitTime = 0.0 auto
{wait this amount of time while changing states to allow child to finish animating
	NOTE: this is not 100% safe, but is good enough in many cases
	default = 0.0}

bool property noItemRequired = false auto

EVENT OnLoad()
	blockActivation()
	if playerOnly
		SetNoFavorAllowed()
	endif
	if isOn
		playAnimation(startOnAnim)
		goToState("On")
		if itemIsNotRemovable
			setDestroyed(True)
		endif
	endif
endEVENT

Event OnReset()
	reset()
	setDestroyed(false)
EndEvent

auto STATE off	; waiting to be activated
	EVENT onActivate (objectReference akActivator)
		goToState("busy")
		if akActivator.getItemCount(requiredItem) >=1 || noItemRequired
			if !doesNotRemoveItem
				akActivator.removeItem(requiredItem, 1, silenceContainerMessage)
			endif
			playAnimationandwait(onAnim, doneEvent)
			self.Activate(self, true)
			isOn = True
			if itemIsNotRemovable
				setDestroyed(True)
			endif
			;This statement is currently not functional, but meant to handshake with
			;2stateActivators or doors to ensure state agreement
			if (getLinkedRef() as default2stateActivator) || (getLinkedRef().getBaseObject() as door)
				getLinkedRef().setOpen(True)
				objectReference currentLink = getLinkedRef()
				while (CurrentLink.getLinkedRef() as default2stateActivator) || (CurrentLink.getLinkedRef().getBaseObject() as door)
					CurrentLink.getLinkedRef().setOpen(True)
					CurrentLink = currentLink.getLinkedRef()
				endwhile
			endif
			wait(waitTime)
			if DoOnce
				goToState("Done")
			else
				goToState("on")
			endif
		Else
			if akActivator == game.getPlayer() && itemNeededMessage
				itemNeededMessage.show()
			endif
			if DoOnce
				goToState("Done")
			else
				goToState("on")
			endif
		endif
	endEVENT
endState

STATE busy
	event onActivate(objectReference akActivator)
		if busyMessage
			busyMessage.show()
			utility.wait(1.0)
		endif
	endEVENT
endSTATE

STATE on
	EVENT onActivate (objectReference akActivator)
		goToState("busy")
		if itemIsNotRemovable
			;doNothing
			goToState("on")
		else
			if !doesNotRemoveItem
				akActivator.addItem(requiredItem, 1, silenceContainerMessage)
			endif
			playAnimationandwait(offAnim, doneEvent)
			self.Activate(self, true)
			isOn = False
			;This statement is currently not functional, but meant to handshake with
			;2stateActivators or doors to ensure state agreement
			if (getLinkedRef() as default2stateActivator) || (getLinkedRef().getBaseObject() as door)
				getLinkedRef().setOpen(false)
				objectReference currentLink = getLinkedRef()
				while (CurrentLink.getLinkedRef() as default2stateActivator) || (CurrentLink.getLinkedRef().getBaseObject() as door)
					CurrentLink.getLinkedRef().setOpen(false)
					CurrentLink = currentLink.getLinkedRef()
				endwhile
			endif
			wait(waitTime)
			if DoOnce
				goToState("Done")
			else
				goToState("off")
			endif
		endif
	endEVENT
endSTATE


State done
	EVENT OnLoad()
		blockActivation()
		if playerOnly
			SetNoFavorAllowed()
		endif
		if isOn
			playAnimation(startOnAnim)
			;goToState("On")
			if itemIsNotRemovable
				setDestroyed(True)
			endif
		endif
	endEVENT

endState