ScriptName DLC2MQ06DragonDeathTracker extends ReferenceAlias

int property DragonNumber = 1 auto
ReferenceAlias property Miraak auto
DLC2MQ06MiraakBossBattle property BossFightScript auto hidden

auto state waiting
	event onDeath(Actor akKiller)
		goToState("Done")
		BossFightScript = Miraak as DLC2MQ06MiraakBossBattle
		BossFightScript.TrackDragonDeath(DragonNumber)
		int myStage = 400 + DragonNumber*20
		GetOwningQuest().SetStage(myStage)
	endEvent
endstate


state done
endstate