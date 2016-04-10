Scriptname DLC1VQ07PostQuestScript extends Quest  Conditional

Ammo Property pDLC1ElvenArrowBlessed Auto
Ammo Property pDLC1ElvenArrowBlood auto
Ammo Property pElvenArrow Auto
int Property pArrowCount Auto

Function ArrowSwap(bool blessed = true)

	pArrowCount = Game.GetPlayer().GetItemCount(pElvenArrow)

	if pArrowCount > 20
		pArrowCount = 20
	endif

	Game.GetPlayer().RemoveItem(pElvenArrow,pArrowCount)
	if (blessed)
		Game.GetPlayer().AddItem(pDLC1ElvenArrowBlessed,pArrowCount)
	else
		Game.GetPlayer().AddItem(pDLC1ElvenArrowBlood,pArrowCount)
	endif

endFunction

