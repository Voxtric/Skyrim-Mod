Scriptname DLC1ElderScrollScript extends ObjectReference  Conditional

DLC1VQ06ReadingTriggerScript Property DLC1VQ06ReadTriggerRef auto 

int Property WhichScroll auto
{which scroll is this?
1 = Blood
2 = Dragon
3 = Sun
}

Event OnEquipped(Actor akActor)
	Debug.Trace(self + "OnEquipped()")
	DLC1VQ06ReadTriggerRef.ReadScroll(WhichScroll)

endEvent