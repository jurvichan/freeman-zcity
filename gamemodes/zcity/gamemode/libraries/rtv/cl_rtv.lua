-- RTV Client
local maps      = {}
local votes     = {}
local winmap    = ""
local rtvStarted = false
local rtvEnded   = false
local VoteCD     = 0

zb.RTVEndTime = 0

local BlurBackground = hg.DrawBlur

local colBG     = Color(10, 15, 25, 245)
local colBorder = Color(0, 100, 180, 220)
local colAccent = Color(0, 130, 220, 255)
local colBtnNormal = Color(0, 55, 110, 200)
local colBtnHover  = Color(0, 90, 160, 230)

local COLS = 4  -- Grid sütun sayısı

function zb.RTVMenu()
    system.FlashWindow()

    if IsValid(zb._RTVPanel) then zb._RTVPanel:Remove() end

    local sw, sh = ScrW(), ScrH()
    local W = math.min(sw * 0.80, 960)
    local H = math.min(sh * 0.88, 700)

    local RTVMenu = vgui.Create("ZB_RTVMenu")
    RTVMenu:SetSize(W, H)
    RTVMenu:Center()
    RTVMenu:SetTitle("")
    RTVMenu:SetBackgroundBlur(true)
    RTVMenu:ShowCloseButton(false)
    RTVMenu:SetDraggable(false)
    RTVMenu:MakePopup()
    RTVMenu:SetKeyboardInputEnabled(false)
    zb._RTVPanel = RTVMenu

    -- Harita grid alanı
    local scroll = vgui.Create("DScrollPanel", RTVMenu)
    scroll:SetPos(8, 66)
    scroll:SetSize(W - 16, H - 100)

    local sbar = scroll:GetVBar()
    sbar:SetWide(ScreenScale(3))
    sbar:SetHideButtons(true)
    function sbar:Paint(w, h)
        surface.SetDrawColor(20, 30, 45, 180)
        surface.DrawRect(0, 0, w, h)
    end
    function sbar.btnGrip:Paint(w, h)
        surface.SetDrawColor(0, 100, 180, 200)
        surface.DrawRect(2, 2, w - 4, h - 4)
    end

    local grid = vgui.Create("DIconLayout", scroll)
    grid:Dock(TOP)
    grid:SetSpaceX(6)
    grid:SetSpaceY(6)
    grid:DockMargin(2, 2, 2, 2)

    local btnW = math.floor((W - 16 - (COLS + 1) * 6) / COLS)
    local btnH = math.floor(btnW * 0.65)

    for k, v in ipairs(maps) do
        local MapButton = vgui.Create("ZB_RTVButton", grid)
        MapButton:SetSize(btnW, btnH)

        if v == "random" then
            MapButton:SetText("Rastgele Harita")
            MapButton.Map = "random"
            MapButton.MapIcon = Material("icon64/random.png")
            if MapButton.MapIcon:IsError() then
                MapButton.MapIcon = Material("icon64/tool.png")
            end
        else
            -- Harita adını düzenle: gm_building_v2 → Building V2
            local parts = string.Explode("_", v)
            table.remove(parts, 1)
            for i, p in ipairs(parts) do
                parts[i] = string.upper(string.Left(p, 1)) .. string.sub(p, 2)
            end
            MapButton:SetText(table.concat(parts, " "))
            MapButton.Map = v
            MapButton.MapIcon = Material("maps/thumb/" .. v .. ".png")
            if MapButton.MapIcon:IsError() then
                MapButton.MapIcon = Material("icon64/tool.png")
            end
        end

        function MapButton:Think()
            self.Votes = votes[self.Map] or 0
            self.Win   = (self.Map ~= "random" and self.Map == winmap)
        end

        function MapButton:DoClick()
            if VoteCD > CurTime() then return end
            net.Start("ZB_RockTheVote_vote")
                net.WriteString(self.Map)
            net.SendToServer()
            VoteCD = CurTime() + 1
            surface.PlaySound("buttons/button14.wav")
        end
    end

    -- Kapat butonu
    local closeBtn = vgui.Create("DButton", RTVMenu)
    closeBtn:SetPos(W / 2 - ScreenScale(30), H - ScreenScale(14))
    closeBtn:SetSize(ScreenScale(60), ScreenScale(12))
    closeBtn:SetText("")

    local hovered = false
    closeBtn.OnCursorEntered = function() hovered = true  end
    closeBtn.OnCursorExited  = function() hovered = false end

    function closeBtn:Paint(w, h)
        local col = hovered and colBtnHover or colBtnNormal
        surface.SetDrawColor(col.r, col.g, col.b, col.a)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, 180)
        surface.DrawOutlinedRect(0, 0, w, h, 1)

        surface.SetFont("ZB_InterfaceMedium")
        surface.SetTextColor(255, 255, 255, 255)
        local tw, th = surface.GetTextSize("Kapat")
        surface.SetTextPos(w / 2 - tw / 2, h / 2 - th / 2)
        surface.DrawText("Kapat")
    end

    function closeBtn:DoClick()
        if IsValid(RTVMenu) then RTVMenu:Remove() end
    end
end

function zb.StartRTV()
    maps = net.ReadTable()
    zb.RTVEndTime = net.ReadFloat()
    votes = {}
    zb.RTVMenu()
    rtvStarted = true
    rtvEnded   = false
end

net.Receive("RTVMenu", function()
    zb.RTVMenu()
end)

function zb.RTVregVote()
    votes = net.ReadTable()
end

function zb.EndRTV()
    winmap   = net.ReadString()
    rtvEnded = true
end

net.Receive("ZB_RockTheVote_start",   zb.StartRTV)
net.Receive("ZB_RockTheVote_voteCLreg", zb.RTVregVote)
net.Receive("ZB_RockTheVote_end",     zb.EndRTV)
