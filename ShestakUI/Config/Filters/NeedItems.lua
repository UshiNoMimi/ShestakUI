﻿local T, C, L = unpack(select(2, ...))
if C.loot.auto_greed ~= true then return end

----------------------------------------------------------------------------------------
--	The best way to add or delete item is to go at www.wowhead.com, search for a item.
--	Example : Huge Seaforium Bombs from Isle of Conquest -> http://www.wowhead.com/?item=67049
--	Take the number ID at the end of the URL, and add it to the list
----------------------------------------------------------------------------------------
T.NeedLoot = {
	33865,	-- Amani Hex Stick
	68729,	-- Elementium Lockbox
}