local PANEL = {}

local colBG      = Color(10, 15, 25, 250)
local colBorder  = Color(0, 100, 180, 220)
local colAccent  = Color(0, 130, 220, 255)
local colTimer   = Color(255, 210, 60, 255)
local colTimerLow = Color(255, 60, 60, 255)

function PANEL:Paint(w, h)
    -- Arka plan
    surface.SetDrawColor(colBG.r, colBG.g, colBG.b, colBG.a)
    surface.DrawRect(0, 0, w, h)

    -- Üst accent çizgisi
    surface.SetDrawColor(colAccent.r, colAccent.g, colAccent.b, 255)
    surface.DrawRect(0, 0, w, 3)

    -- Dış çerçeve
    surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, colBorder.a)
    surface.DrawOutlinedRect(0, 0, w, h, 2)

    -- Başlık
    surface.SetFont("ZB_InterfaceMediumLarge")
    surface.SetTextColor(colAccent.r, colAccent.g, colAccent.b, 255)
    local title = "Harita Oylaması"
    local tw, th = surface.GetTextSize(title)
    surface.SetTextPos(w / 2 - tw / 2, 10)
    surface.DrawText(title)

    -- Kalan süre
    local remaining = math.max(0, math.ceil((zb.RTVEndTime or 0) - CurTime()))
    local timerCol = remaining <= 10 and colTimerLow or colTimer
    surface.SetFont("ZB_InterfaceMedium")
    surface.SetTextColor(timerCol.r, timerCol.g, timerCol.b, 255)
    local tstr = "Kalan süre: " .. remaining .. "s"
    local ttw, tth = surface.GetTextSize(tstr)
    surface.SetTextPos(w / 2 - ttw / 2, 34)
    surface.DrawText(tstr)

    -- Alt ayırıcı çizgi
    surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, 80)
    surface.DrawRect(10, 58, w - 20, 1)
end

vgui.Register("ZB_RTVMenu", PANEL, "ZFrame")
