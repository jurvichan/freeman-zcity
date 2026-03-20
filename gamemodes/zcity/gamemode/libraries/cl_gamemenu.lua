-- ZCity ESC Menüsü

local colBG        = Color(10, 15, 25, 240)
local colBorder    = Color(0, 100, 180, 220)
local colBtnNormal = Color(0, 55, 110, 220)
local colBtnHover  = Color(0, 90, 170, 240)
local colBtnRed    = Color(130, 20, 20, 220)
local colBtnRedHov = Color(180, 30, 30, 240)
local colText      = Color(255, 255, 255, 255)
local colSubText   = Color(160, 200, 240, 200)

local zcityMenu

local function MakeButton(parent, label, yPos, color, colorHover, onClick)
    local btn = vgui.Create("DButton", parent)
    btn:SetPos(0, yPos)
    btn:SetSize(parent:GetWide(), 44)
    btn:SetText("")

    local hovered = false
    btn.OnCursorEntered = function() hovered = true  end
    btn.OnCursorExited  = function() hovered = false end

    btn.Paint = function(self, w, h)
        local col = hovered and colorHover or color
        surface.SetDrawColor(col.r, col.g, col.b, col.a)
        surface.DrawRect(0, 0, w, h)

        surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, 80)
        surface.DrawOutlinedRect(0, 0, w, h, 1)

        surface.SetFont("ZB_InterfaceMedium")
        surface.SetTextColor(colText.r, colText.g, colText.b, colText.a)
        local tw, th = surface.GetTextSize(label)
        surface.SetTextPos(w / 2 - tw / 2, h / 2 - th / 2)
        surface.DrawText(label)
    end

    btn.DoClick = onClick
    return btn
end

local function ZCityShowGameMenu()
    gui.HideGameUI()

    if IsValid(zcityMenu) then
        zcityMenu:Remove()
        zcityMenu = nil
        return
    end

    local sw, sh = ScrW(), ScrH()
    local W, H = 280, 320
    local X, Y = sw / 2 - W / 2, sh / 2 - H / 2

    zcityMenu = vgui.Create("DFrame")
    zcityMenu:SetPos(X, Y)
    zcityMenu:SetSize(W, H)
    zcityMenu:SetDraggable(false)
    zcityMenu:ShowCloseButton(false)
    zcityMenu:SetTitle("")
    zcityMenu:MakePopup()
    zcityMenu:SetKeyboardInputEnabled(false)

    zcityMenu.Paint = function(self, w, h)
        -- Arka plan
        surface.SetDrawColor(colBG.r, colBG.g, colBG.b, colBG.a)
        surface.DrawRect(0, 0, w, h)

        -- Üst çizgi (accent)
        surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, 220)
        surface.DrawRect(0, 0, w, 3)

        -- Dış çerçeve
        surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, 180)
        surface.DrawOutlinedRect(0, 0, w, h, 2)

        -- Başlık: Z-City
        surface.SetFont("ZB_InterfaceMediumLarge")
        surface.SetTextColor(colBorder.r, colBorder.g, colBorder.b, 255)
        local tw, th = surface.GetTextSize("Z-City")
        surface.SetTextPos(w / 2 - tw / 2, 14)
        surface.DrawText("Z-City")

        -- Alt başlık: sunucu adı
        local serverName = GetHostName() or ""
        surface.SetFont("ZB_InterfaceSmall")
        surface.SetTextColor(colSubText.r, colSubText.g, colSubText.b, colSubText.a)
        local sw2, sh2 = surface.GetTextSize(serverName)
        surface.SetTextPos(w / 2 - sw2 / 2, 44)
        surface.DrawText(serverName)
    end

    -- Butonlar
    local btnW = W - 40
    local btnX = 20
    local startY = 78
    local gap = 52

    -- Oyuna Devam Et
    local resume = MakeButton(zcityMenu, "Oyuna Devam Et", startY, colBtnNormal, colBtnHover, function()
        if IsValid(zcityMenu) then zcityMenu:Remove() zcityMenu = nil end
    end)
    resume:SetPos(btnX, startY)
    resume:SetSize(btnW, 44)

    -- Skor Tablosu
    local scores = MakeButton(zcityMenu, "Skor Tablosu", startY + gap, colBtnNormal, colBtnHover, function()
        if IsValid(zcityMenu) then zcityMenu:Remove() zcityMenu = nil end
        hook.Run("ScoreboardShow")
    end)
    scores:SetPos(btnX, startY + gap)
    scores:SetSize(btnW, 44)

    -- Ayarlar
    local options = MakeButton(zcityMenu, "Ayarlar", startY + gap * 2, colBtnNormal, colBtnHover, function()
        if IsValid(zcityMenu) then zcityMenu:Remove() zcityMenu = nil end
        RunConsoleCommand("gamemenucommand", "openoptionsdialog")
    end)
    options:SetPos(btnX, startY + gap * 2)
    options:SetSize(btnW, 44)

    -- Sunucudan Ayrıl
    local disc = MakeButton(zcityMenu, "Sunucudan Ayrıl", startY + gap * 3, colBtnRed, colBtnRedHov, function()
        if IsValid(zcityMenu) then zcityMenu:Remove() zcityMenu = nil end
        RunConsoleCommand("disconnect")
    end)
    disc:SetPos(btnX, startY + gap * 3)
    disc:SetSize(btnW, 44)

    -- ESC ile kapat
    zcityMenu.OnKeyCodePressed = function(self, key)
        if key == KEY_ESCAPE then
            self:Remove()
            zcityMenu = nil
        end
    end
end

-- Alternatif ESC yakalama (DFrame odak dışı kaldığında)
hook.Add("GUIMousePressed", "ZCityMenuEscClose", function()
    if IsValid(zcityMenu) and not zcityMenu:IsChildOf(vgui.GetHoveredPanel() or vgui.GetWorldPanel()) then
        zcityMenu:Remove()
        zcityMenu = nil
    end
end)

-- ESC hook'u — GM: syntax yerine hook.Add daha güvenilir
hook.Add("ShowGameMenu", "ZCityGameMenu", ZCityShowGameMenu)
function GM:ShowGameMenu() ZCityShowGameMenu() end
