scriptName DLC1VQ03BarrierPylonScript extends objectReference
{This script controls deactivating the barrier for DCL1VQ03Hunter/Vampire}

miscObject property DLC1VQ03MagicWidget auto
Quest property DLC1VQ03Hunter auto
Int property HunterStage auto
Int property HunterObjectiveStage = 61 auto
Quest property DLC1VQ03Vampire auto
Int property VampireStage auto
Int property VampireObjectiveStage = 61 auto
message property DLC1VQ03BarrierMessage auto
float property stageDelay = 2.0 auto

ObjectReference property DLC1VQ03BarrierStone01 auto
ObjectReference property DLC1VQ03BarrierStone02 auto
ObjectReference property DLC1VQ03BarrierStone03 auto
ObjectReference property DLC1VQ03BarrierStone04 auto
ObjectReference property DLC1VQ03Barrier auto
ObjectReference property DLC1VQ03BarrierLight auto
ObjectReference property DLC1VQ03LightActivateParent auto

float property rumbleAmount1 = 0.3 Auto
float property rumbleDuration = 6.0 Auto
float property cameraShakeAmount1 = 0.2 Auto

sound property AMBEvernightCryptRumbleSD auto
sound property QSTWaystoneMagicBarrierLPM auto
int property barrierSoundInstance auto hidden

event onActivate(objectReference ActivateRef)
	if (ActivateRef as Actor).GetItemCount(DLC1VQ03MagicWidget) > 0
		if DLC1VQ03Hunter.isRunning()
			DLC1VQ03Hunter.setstage(HunterObjectiveStage )
			(ActivateRef as Actor).RemoveItem(DLC1VQ03MagicWidget, 1)
			LowerTheBarrier()
			;utility.wait(stageDelay)
			;DLC1VQ03Hunter.setstage(HunterStage)
		elseif DLC1VQ03Vampire.isRunning()
			DLC1VQ03Vampire.SetStage(VampireObjectiveStage)
			(ActivateRef as Actor).RemoveItem(DLC1VQ03MagicWidget, 1)
			LowerTheBarrier()
			;utility.wait(stageDelay)
			;DLC1VQ03Vampire.SetStage(VampireStage)
		else
			debug.Trace(self + ": BADNESS neither quest is running but actor has the widget")
		endif
	elseif ActivateRef == self
		debug.Trace(self + ": has been activated by self, this should only happen through testing")
		LowerTheBarrier()
	else
		barrierSoundInstance = DLC1VQ03BarrierMessage.show()
	endif
endEvent

event OnLoad()
	QSTWaystoneMagicBarrierLPM.Play(DLC1VQ03Barrier)
endEvent

Function LowerTheBarrier()
	;This is temp till I figure out this part out
	debug.Trace(self + ": LOWER THE BARRIER!")
	PlayAnimationAndWait("Activate01", "Done")
	AMBEvernightCryptRumbleSD.Play(DLC1VQ03Barrier)
	game.ShakeController(rumbleAmount1, rumbleAmount1, rumbleDuration)
	game.ShakeCamera(none, cameraShakeAmount1, rumbleDuration)
	utility.Wait(2.0)
	DLC1VQ03BarrierStone01.Activate(Self)
	utility.Wait(0.5)
	DLC1VQ03BarrierStone03.Activate(Self)
	utility.Wait(0.3)
	DLC1VQ03BarrierStone02.Activate(Self)
	utility.Wait(0.2)
	DLC1VQ03BarrierStone04.Activate(Self)
	utility.Wait(0.4)
	sound.StopInstance(barrierSoundInstance)
	DLC1VQ03Barrier.playGamebryoAnimation("AnimTrans01")
	RegisterForSingleUpdate(0.1)
	Debug.Trace(self + ": HAS PASSED THE SET STAGE BLOCK")
	utility.wait(1.0)
	DLC1VQ03Barrier.disableNoWait()
	DLC1VQ03BarrierLight.disable(abFadeout = True)
	utility.wait(0.6)
	DLC1VQ03LightActivateParent.Activate(self)
endFunction

Event OnUpdate()
	if DLC1VQ03Hunter.isRunning()
		DLC1VQ03Hunter.setstage(HunterStage)
	elseif DLC1VQ03Vampire.isRunning()
		DLC1VQ03Vampire.SetStage(VampireStage)
	endif
endEvent


