local T, C, L = unpack(select(2, ...))
if not C.actionbar.enable == true then return end

----------------------------------------------------------------------------------------
--	Setup MultiBarBottomRight as bar #5 by Tukz
----------------------------------------------------------------------------------------
local Bar5Holder = CreateFrame("Frame", "Bar5Holder", UIParent)
if C.actionbar.rightbars < 3 then
	if C.actionbar.split_bars == true then
		Bar5Holder:SetAllPoints(SplitBarLeft)
	else
		Bar5Holder:SetAllPoints(ActionBarAnchor)
	end
else
	Bar5Holder:SetAllPoints(RightActionBarAnchor)
end
MultiBarBottomRight:SetParent(Bar5Holder)

for i = 1, 12 do
	local b = _G["MultiBarBottomRightButton"..i]
	local b2 = _G["MultiBarBottomRightButton"..i-1]
	b:ClearAllPoints()
	if C.actionbar.split_bars == true and C.actionbar.rightbars < 3 then
		if i == 1 then
			b:SetPoint("TOPLEFT", SplitBarLeft, "TOPLEFT", 0, 0)
		elseif i == 4 then
			b:SetPoint("BOTTOMLEFT", SplitBarLeft, "BOTTOMLEFT", 0, 0)
		elseif i == 7 then
			b:SetPoint("TOPLEFT", SplitBarRight, "TOPLEFT", 0, 0)
		elseif i == 10 then
			b:SetPoint("BOTTOMLEFT", SplitBarRight, "BOTTOMLEFT", 0, 0)
		else
			b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
		end
	else
		if i == 1 then
			if C.actionbar.rightbars < 3 then
				b:Point("BOTTOM", ActionButton1, "TOP", 0, T.buttonsize + (T.buttonspacing * 2))
			else
				b:Point("TOPLEFT", RightActionBarAnchor, "TOPLEFT", 0, 0)
			end
		else
			if C.actionbar.rightbars < 3 then
				b:Point("LEFT", b2, "RIGHT", T.buttonspacing, 0)
			else
				b:Point("TOP", b2, "BOTTOM", 0, -T.buttonspacing)
			end
		end
	end
end

-- Hide bar
if C.actionbar.rightbars < 3 and C.actionbar.bottombars < 3 then
	Bar5Holder:Hide()
end

-- Mouseover bar
if C.actionbar.rightbars_mouseover == true and C.actionbar.rightbars > 2 then
	for i = 1, 12 do
		local b = _G["MultiBarBottomRightButton"..i]
		b:SetAlpha(0)
		b:HookScript("OnEnter", function() RightBarMouseOver(1) end)
		b:HookScript("OnLeave", function() RightBarMouseOver(0) end)
	end
end