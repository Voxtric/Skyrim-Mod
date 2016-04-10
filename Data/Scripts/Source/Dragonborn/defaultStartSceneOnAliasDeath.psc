Scriptname defaultStartSceneOnAliasDeath extends ReferenceAlias  
{Starts a scene if the creature in this alias is killed be the player}

;Properties
Scene Property SceneToStart Auto

Event OnDeath(Actor akKiller)
    if (akKiller == Game.GetPlayer())
	SceneToStart.Start()
   endif
endEvent  