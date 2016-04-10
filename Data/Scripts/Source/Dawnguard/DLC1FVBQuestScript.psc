Scriptname DLC1FVBQuestScript extends Quest  Conditional

ReferenceAlias Property pDLC1FVBBook01 Auto
ReferenceAlias Property pDLC1FVBBook02 Auto
ReferenceAlias Property pDLC1FVBBook03 Auto
ReferenceAlias Property pDLC1FVBBook04 Auto
ReferenceAlias Property pDLC1FVBBook01E Auto
ReferenceAlias Property pDLC1FVBBook02E Auto
ReferenceAlias Property pDLC1FVBBook03E Auto
ReferenceAlias Property pDLC1FVBBook04E Auto
MiscObject Property pGold001 Auto
GlobalVariable Property pDLC1FVBGotABook Auto
int Property pCountBooks Auto
Quest Property pDLC1VQFVBooks Auto

Function SellMeABook()

	if Game.GetPlayer().GetItemCount(pDLC1FVBBook01.GetRef()) == 1
		Game.GetPlayer().RemoveItem(pDLC1FVBBook01.GetRef())
		Game.GetPlayer().AddItem(pDLC1FVBBook01E.GetRef())
		Game.GetPlayer().AddItem(pGold001,1000)
		pDLC1FVBGotABook.SetValue(pDLC1FVBGotABook.GetValue() - 1)
		pCountBooks = (pCountBooks + 1)
	endif

	if Game.GetPlayer().GetItemCount(pDLC1FVBBook02.GetRef()) == 1
		Game.GetPlayer().RemoveItem(pDLC1FVBBook02.GetRef())
		Game.GetPlayer().AddItem(pDLC1FVBBook02E.GetRef())
		Game.GetPlayer().AddItem(pGold001,1000)
		pDLC1FVBGotABook.SetValue(pDLC1FVBGotABook.GetValue() - 1)
		pCountBooks = (pCountBooks + 1)
	endif

	if Game.GetPlayer().GetItemCount(pDLC1FVBBook03.GetRef()) == 1
		Game.GetPlayer().RemoveItem(pDLC1FVBBook03.GetRef())
		Game.GetPlayer().AddItem(pDLC1FVBBook03E.GetRef())
		Game.GetPlayer().AddItem(pGold001,1000)
		pDLC1FVBGotABook.SetValue(pDLC1FVBGotABook.GetValue() - 1)
		pCountBooks = (pCountBooks + 1)
	endif

	if Game.GetPlayer().GetItemCount(pDLC1FVBBook04.GetRef()) == 1
		Game.GetPlayer().RemoveItem(pDLC1FVBBook04.GetRef())
		Game.GetPlayer().AddItem(pDLC1FVBBook04E.GetRef())
		Game.GetPlayer().AddItem(pGold001,1000)
		pDLC1FVBGotABook.SetValue(pDLC1FVBGotABook.GetValue() - 1)
		pCountBooks = (pCountBooks + 1)
	endif

	if pCountBooks >= 4
		pDLC1VQFVBooks.SetStage(200)
	endif

endFunction