scriptName DLC1VCEmberToggleScript extends ObjectReference
{This script is to allow for embers that toggle from out to lit, linkRef'd light will be enable/disabled as well}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;        Properties Block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


bool property init = false auto hidden
sound property lightUpSound auto
{This sound is played when the embers turn on}

;changing this property handles the guts everything
bool currentLitState
bool property isLit
	function set(bool newLitState)
		;Told to turn on and is currently off
		if newLitState && currentLitState == false
			;return true
			if lightUpSound
				lightUpSound.play(self)
			endif
			playGamebryoAnimation("partA")
			if getLinkedRef()
				getLinkedRef().enable()
			endif
		;Told to turn of and is currently on
		elseif !newLitState && currentLitState == true
			;return false
			playGamebryoAnimation("partB")
			if getLinkedRef()
				getLinkedRef().disable()
			endif
		endif
		currentLitState = newLitState
          ;TraceStack("Setting objectsInTrigger to " + value) 
     endFunction 
     bool function get() 
          return currentLitState 
     endFunction 
endProperty
;{This property controls if the embers are lit
;	Default = False}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;        Event Block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;onLoad make sure the light is in the correct state
event onLoad()
	if !Init
		Init = True
		if isLit
			if getLinkedRef()
				getLinkedRef().Enable()
			endif
		else
			if getLinkedRef()
				getLinkedRef().Disable()
			endif
		endif
	endif
endEvent

;when activated toggle state of isLit
event onActivate(objectReference activateRef)
	if isLit
		isLit = False
	else
		isLit = True
	endif
endEvent



