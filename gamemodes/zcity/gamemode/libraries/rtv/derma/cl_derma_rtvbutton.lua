local PANEL = {}

local colBorder   = Color(0, 100, 180, 180)
local colHover    = Color(0, 100, 180, 60)
local colVoteBar  = Color(0, 120, 210, 130)
local colWin      = Color(239, 47, 47, 200)
local colTextShadow = Color(0, 0, 0, 200)
local colVoteText = Color(255, 210, 60, 255)

BlurBackground = BlurBackground or hg.DrawBlur

function PANEL:Init()
    self.Map    = ""
    self.Votes  = 0
    self.lerp   = 0
    self.BipCD  = 0
    self.hovered   = false
    self.alpha     = 0
    self.setalpha  = 0
    self.disabled  = false
    self.selected  = false
    self:SetFont("ZB_InterfaceSmall")
    self:SetPaintBackground(false)
    self:SetContentAlignment(5)
    self:SetTextColor(color_white)
end

function PANEL:Paint(w, h)
    if self.disabled then return end

    -- Harita önizleme resmi
    if self.MapIcon and not self.MapIcon:IsError() then
        surface.SetDrawColor(255, 255, 255, 200)
        surface.SetMaterial(self.MapIcon)
        surface.DrawTexturedRect(0, 0, w, h)
    end

    -- Koyu overlay
    BlurBackground(self)
    surface.SetDrawColor(0, 0, 0, 100)
    surface.DrawRect(0, 0, w, h)

    -- Hover overlay
    if self.hovered then
        surface.SetDrawColor(colHover.r, colHover.g, colHover.b, colHover.a)
        surface.DrawRect(0, 0, w, h)
    end

    -- Oy barı
    local playerCount = math.max(player.GetCount(), 1)
    self.lerp = Lerp(FrameTime() * 6, self.lerp, w * (self.Votes / playerCount))
    surface.SetDrawColor(colVoteBar.r, colVoteBar.g, colVoteBar.b, colVoteBar.a)
    surface.DrawRect(0, h - 4, self.lerp, 4)

    -- Kazanan animasyonu
    if self.Win and self.BipCD < CurTime() then
        self.alpha = 255
        surface.PlaySound("buttons/blip1.wav")
        self.BipCD = CurTime() + 1
        self:CreateAnimation(0.5, {
            index = 1,
            target = { alpha = 0 },
            easing = "inExpo",
            bIgnoreConfig = true
        })
    end
    if self.alpha > 0 then
        surface.SetDrawColor(colWin.r, colWin.g, colWin.b, self.alpha)
        surface.DrawRect(0, 0, w, h)
    end

    -- Çerçeve
    local borderCol = self.hovered and Color(0, 150, 255, 255) or colBorder
    surface.SetDrawColor(borderCol.r, borderCol.g, borderCol.b, borderCol.a)
    surface.DrawOutlinedRect(0, 0, w, h, 2)

    -- Harita adı (alt kısım, koyu arka plan üzerinde)
    surface.SetDrawColor(0, 0, 0, 160)
    surface.DrawRect(0, h - 28, w, 28)

    surface.SetFont("ZB_InterfaceSmall")
    surface.SetTextColor(colTextShadow.r, colTextShadow.g, colTextShadow.b, colTextShadow.a)
    local tw, th = surface.GetTextSize(self:GetText())
    surface.SetTextPos(w / 2 - tw / 2 + 1, h - 22 + 1)
    surface.DrawText(self:GetText())

    surface.SetTextColor(255, 255, 255, 255)
    surface.SetTextPos(w / 2 - tw / 2, h - 22)
    surface.DrawText(self:GetText())

    -- Oy sayısı
    if self.Votes > 0 then
        surface.SetFont("ZB_InterfaceSmall")
        surface.SetTextColor(colVoteText.r, colVoteText.g, colVoteText.b, 255)
        local vtxt = self.Votes .. " oy"
        local vw, vh = surface.GetTextSize(vtxt)
        surface.SetTextPos(w / 2 - vw / 2, h - 22 - vh - 2)
        surface.DrawText(vtxt)
    end
end

function PANEL:OnCursorEntered()
    if self.disabled then return end
    self:CreateAnimation(0.1, {
        index = 1,
        target = { alpha = 155 },
        easing = "inExpo",
        bIgnoreConfig = true
    })
    self.hovered = true
end

function PANEL:OnCursorExited()
    if self.selected then return end
    self:CreateAnimation(0.3, {
        index = 1,
        target = { alpha = self.setalpha },
        easing = "outExpo",
        bIgnoreConfig = true
    })
    self.hovered = false
end

function PANEL:SetSelected(value)
    self.selected = value
    if value then self:OnCursorEntered()
    else self:OnCursorExited() end
end

function PANEL:Disabled(bool)
    self.disabled = bool
    self:SetTextColor(bool and Color(255, 255, 255, 50) or color_white)
    self:SetCursor(bool and "arrow" or "hand")
end

vgui.Register("ZB_RTVButton", PANEL, "DButton")
