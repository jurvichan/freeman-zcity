-- ZCity Oyuncu Rehberi (F2)

local colBG       = Color(10, 15, 25, 245)
local colBorder   = Color(0, 100, 180, 220)
local colAccent   = Color(0, 120, 210, 255)
local colDark     = Color(6, 10, 18, 255)
local colRowEven  = Color(15, 22, 35, 200)
local colRowOdd   = Color(20, 30, 48, 200)
local colKey      = Color(30, 50, 80, 255)
local colKeyBord  = Color(0, 130, 220, 180)
local colText     = Color(255, 255, 255, 255)
local colTextDim  = Color(160, 200, 240, 210)
local colHeader   = Color(0, 150, 255, 255)
local colYellow   = Color(255, 210, 60, 255)

-- Bölümler ve içerikleri
-- Her satır: { tuş(lar), açıklama }
local sections = {
    {
        title = "Temel Hareket",
        icon  = "icon16/arrow_right.png",
        rows  = {
            { keys = {"W","A","S","D"},      desc = "İleri / Sola / Geri / Sağa hareket" },
            { keys = {"Shift"},              desc = "Koşma" },
            { keys = {"Ctrl"},               desc = "Çömelme" },
            { keys = {"Space"},              desc = "Zıplama" },
            { keys = {"Alt","E"},            desc = "Duruş değiştir (yürüyüş / kullanım modu)" },
            { keys = {"E"},                  desc = "Nesneyle etkileşim / kapı açma" },
        }
    },
    {
        title = "Eller & Nesne Taşıma",
        icon  = "icon16/hand.png",
        rows  = {
            { keys = {"SOL FARE"},           desc = "Yumrukları kaldır (boş elde)" },
            { keys = {"Reload"},             desc = "Yumrukları indir" },
            { keys = {"SOL FARE"},           desc = "Vur (yumruklar kaldırıldığında)" },
            { keys = {"SAĞ FARE"},           desc = "Blok (yumruklar kaldırıldığında)" },
            { keys = {"SAĞ FARE"},           desc = "Nesneyi kaldır (yumruklar indirildiğinde)" },
            { keys = {"SAĞ FARE","R"},       desc = "Nabzı kontrol et (baş/ele tutulunca)" },
            { keys = {"Reload"},             desc = "Tuttuğun nesneyi havada sabitle" },
            { keys = {"E"},                  desc = "Nesneyi havada döndür" },
        }
    },
    {
        title = "Silah Kullanımı",
        icon  = "icon16/gun.png",
        rows  = {
            { keys = {"SOL FARE"},           desc = "Ateş et" },
            { keys = {"SAĞ FARE"},           desc = "Nişan al / ikincil mod" },
            { keys = {"R"},                  desc = "Yeniden doldur" },
            { keys = {"R","SOL FARE"},       desc = "Saldırı modunu değiştir (bıçaklar)" },
            { keys = {"SAĞ FARE"},           desc = "Blok (yakın dövüş silahları)" },
            { keys = {"SAĞ FARE","SOL FARE"},desc = "Fırlat (bazı yakın dövüş silahları)" },
            { keys = {"1","2","3"},          desc = "Silah yuvası seç" },
            { keys = {"Q"},                  desc = "Son silaha geç" },
        }
    },
    {
        title = "Tıbbi Sistem",
        icon  = "icon16/heart.png",
        rows  = {
            { keys = {"SOL FARE"},           desc = "Kendine uygula" },
            { keys = {"SAĞ FARE"},           desc = "Başkasına uygula (bakıcı olarak hedefle)" },
            { keys = {"R"},                  desc = "Kullanım modunu değiştir (tıbbi çanta)" },
            { keys = {"—"},                  desc = "Sargı → Hafif kanama durdurucu" },
            { keys = {"—"},                  desc = "Turnike → Arteryal kanama durdurucu (uzvu yavaşlatır)" },
            { keys = {"—"},                  desc = "Morfin/Fentanil → Ağrı / basınç, doz kontrolü şart!" },
            { keys = {"—"},                  desc = "Nalokson → Opiat aşırı dozu tedavisi" },
            { keys = {"—"},                  desc = "Dekompresyon iğnesi → Pnömotoraks tedavisi" },
            { keys = {"—"},                  desc = "Epinefrin → Kalp durması / düşük tansiyon" },
        }
    },
    {
        title = "Ekipman & Araçlar",
        icon  = "icon16/wrench.png",
        rows  = {
            { keys = {"SOL FARE"},           desc = "Kanca: Sallan / Fırlat" },
            { keys = {"SAĞ FARE"},           desc = "Kanca: İpi uzat" },
            { keys = {"R"},                  desc = "Kanca: İpi bırak" },
            { keys = {"SOL FARE"},           desc = "Kapı takozu: Kapıyı kilitle" },
            { keys = {"E"},                  desc = "Kapı takozu: Geri al" },
            { keys = {"SOL FARE"},           desc = "Kelepçe: Birini kelepçele" },
            { keys = {"SOL FARE"},           desc = "Walkie-talkie: Konuş" },
            { keys = {"SOL FARE"},           desc = "Koli bandı: Nesneyi yapıştır" },
            { keys = {"SOL FARE"},           desc = "Katlanır kutu: Saklan" },
        }
    },
    {
        title = "Oyun & Arayüz",
        icon  = "icon16/information.png",
        rows  = {
            { keys = {"Tab"},                desc = "Skor tablosu" },
            { keys = {"F2"},                 desc = "Bu rehberi aç / kapat" },
            { keys = {"F1"},                 desc = "Yardım (GMod varsayılan)" },
            { keys = {"U"},                  desc = "Sohbet (yerel)" },
            { keys = {"Y"},                  desc = "Genel sohbet" },
            { keys = {"—"},                  desc = "Round 0 → Bekleme  |  1 → Aktif  |  2 → Bitiş" },
            { keys = {"—"},                  desc = "Ölünce spectator moduna geçilir, SOL/SAĞ FARE ile oyuncu değiştir" },
            { keys = {"—"},                  desc = "AFK: 5 dk hareketsiz → seyirci, 10 dk → kick" },
        }
    },
}

-- Panel durumu
local tutOpen  = false
local tutPanel = nil
local curPage  = 1

local function DrawKey(x, y, w, h, txt)
    -- arka plan
    surface.SetDrawColor(colKey.r, colKey.g, colKey.b, colKey.a)
    surface.DrawRect(x, y, w, h)
    -- çerçeve
    surface.SetDrawColor(colKeyBord.r, colKeyBord.g, colKeyBord.b, colKeyBord.a)
    surface.DrawOutlinedRect(x, y, w, h, 1)
    -- metin
    surface.SetFont("ZB_InterfaceSmall")
    surface.SetTextColor(colText.r, colText.g, colText.b, colText.a)
    local tw, th = surface.GetTextSize(txt)
    surface.SetTextPos(x + w/2 - tw/2, y + h/2 - th/2)
    surface.DrawText(txt)
end

local function OpenTutorial()
    if IsValid(tutPanel) then
        tutPanel:Remove()
        tutPanel = nil
        tutOpen = false
        return
    end
    tutOpen = true
    curPage = 1

    local sw, sh = ScrW(), ScrH()
    local W, H   = math.min(820, sw * 0.85), math.min(560, sh * 0.85)
    local X, Y   = sw/2 - W/2, sh/2 - H/2

    tutPanel = vgui.Create("ZFrame")
    tutPanel:SetPos(X, Y)
    tutPanel:SetSize(W, H)
    tutPanel:SetTitle("")
    tutPanel:SetDraggable(true)
    tutPanel:ShowCloseButton(false)
    tutPanel:MakePopup()
    tutPanel:SetKeyboardInputEnabled(false)

    tutPanel.Paint = function(self, w, h)
        -- arka plan
        surface.SetDrawColor(colBG.r, colBG.g, colBG.b, colBG.a)
        surface.DrawRect(0, 0, w, h)

        -- üst accent çizgisi
        surface.SetDrawColor(colAccent.r, colAccent.g, colAccent.b, 255)
        surface.DrawRect(0, 0, w, 3)

        -- dış çerçeve
        surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, 180)
        surface.DrawOutlinedRect(0, 0, w, h, 2)

        -- başlık
        surface.SetFont("ZB_InterfaceMediumLarge")
        surface.SetTextColor(colAccent.r, colAccent.g, colAccent.b, 255)
        local title = "Z-City — Oyuncu Rehberi"
        local tw, th = surface.GetTextSize(title)
        surface.SetTextPos(w/2 - tw/2, 12)
        surface.DrawText(title)

        -- F2 ipucu
        surface.SetFont("ZB_InterfaceSmall")
        surface.SetTextColor(colTextDim.r, colTextDim.g, colTextDim.b, 120)
        local hint = "F2 ile kapat"
        local hw, hh = surface.GetTextSize(hint)
        surface.SetTextPos(w - hw - 10, h - hh - 8)
        surface.DrawText(hint)

        -- sayfa numarası
        surface.SetFont("ZB_InterfaceSmall")
        surface.SetTextColor(colTextDim.r, colTextDim.g, colTextDim.b, 180)
        local pg = curPage .. " / " .. #sections
        local pw, ph = surface.GetTextSize(pg)
        surface.SetTextPos(w/2 - pw/2, h - ph - 8)
        surface.DrawText(pg)
    end

    -- Kapat butonu
    local closeBtn = vgui.Create("DButton", tutPanel)
    closeBtn:SetPos(tutPanel:GetWide() - 32, 8)
    closeBtn:SetSize(24, 24)
    closeBtn:SetText("")
    closeBtn.Paint = function(self, w, h)
        local hov = self:IsHovered()
        surface.SetDrawColor(hov and 180 or 100, 20, 20, hov and 220 or 160)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, 120)
        surface.DrawOutlinedRect(0, 0, w, h, 1)
        surface.SetFont("ZB_InterfaceMedium")
        surface.SetTextColor(255, 255, 255, 255)
        local tw, th = surface.GetTextSize("×")
        surface.SetTextPos(w/2 - tw/2, h/2 - th/2)
        surface.DrawText("×")
    end
    closeBtn.DoClick = function()
        tutPanel:Remove()
        tutPanel = nil
        tutOpen = false
    end

    -- Sol sidebar — bölüm listesi
    local sideW = 170
    local sidebar = vgui.Create("DPanel", tutPanel)
    sidebar:SetPos(8, 44)
    sidebar:SetSize(sideW, tutPanel:GetTall() - 60)
    sidebar.Paint = function(self, w, h)
        surface.SetDrawColor(colDark.r, colDark.g, colDark.b, colDark.a)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, 80)
        surface.DrawOutlinedRect(0, 0, w, h, 1)
    end

    local sideButtons = {}
    for i, sec in ipairs(sections) do
        local btn = vgui.Create("DButton", sidebar)
        btn:SetPos(4, 6 + (i-1) * 46)
        btn:SetSize(sideW - 8, 42)
        btn:SetText("")

        btn.Paint = function(self, w, h)
            local active  = (curPage == i)
            local hovered = self:IsHovered()
            local bgCol   = active and Color(0, 80, 160, 220)
                         or (hovered and Color(0, 55, 110, 180))
                         or Color(8, 14, 24, 180)

            surface.SetDrawColor(bgCol.r, bgCol.g, bgCol.b, bgCol.a)
            surface.DrawRect(0, 0, w, h)

            if active then
                surface.SetDrawColor(colAccent.r, colAccent.g, colAccent.b, 255)
                surface.DrawRect(0, 0, 3, h)
            end

            surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, active and 120 or 40)
            surface.DrawOutlinedRect(0, 0, w, h, 1)

            surface.SetFont("ZB_InterfaceSmall")
            local col = active and colText or (hovered and colTextDim or Color(120, 160, 200, 200))
            surface.SetTextColor(col.r, col.g, col.b, col.a)
            local tw, th = surface.GetTextSize(sec.title)
            surface.SetTextPos(w/2 - tw/2, h/2 - th/2)
            surface.DrawText(sec.title)
        end

        btn.DoClick = function()
            curPage = i
            sidebar:InvalidateChildren(true)
            sidebar:InvalidateLayout(true)
        end

        sideButtons[i] = btn
    end

    -- İçerik alanı
    local contentX = sideW + 14
    local contentW = tutPanel:GetWide() - contentX - 8
    local contentH = tutPanel:GetTall() - 60

    local content = vgui.Create("DPanel", tutPanel)
    content:SetPos(contentX, 44)
    content:SetSize(contentW, contentH)
    content.Paint = function(self, w, h)
        surface.SetDrawColor(colDark.r, colDark.g, colDark.b, colDark.a)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, 80)
        surface.DrawOutlinedRect(0, 0, w, h, 1)

        local sec = sections[curPage]
        if not sec then return end

        -- Bölüm başlığı
        surface.SetFont("ZB_InterfaceMediumLarge")
        surface.SetTextColor(colHeader.r, colHeader.g, colHeader.b, colHeader.a)
        surface.SetTextPos(14, 12)
        surface.DrawText(sec.title)

        -- Alt çizgi
        surface.SetDrawColor(colAccent.r, colAccent.g, colAccent.b, 100)
        surface.DrawRect(10, 42, w - 20, 1)

        -- Satırlar
        local rowH   = 36
        local startY = 50
        local keyColW = 200  -- tuş bölgesi genişliği
        local padding = 14

        for i, row in ipairs(sec.rows) do
            local ry  = startY + (i-1) * rowH
            local bgc = (i % 2 == 0) and colRowEven or colRowOdd

            surface.SetDrawColor(bgc.r, bgc.g, bgc.b, bgc.a)
            surface.DrawRect(10, ry, w - 20, rowH - 2)

            -- Tuş kutucukları
            local kx = padding + 10
            local boxH = 20
            local boxY = ry + rowH/2 - boxH/2

            for j, key in ipairs(row.keys) do
                if key == "—" then
                    surface.SetFont("ZB_InterfaceSmall")
                    surface.SetTextColor(colTextDim.r, colTextDim.g, colTextDim.b, 120)
                    surface.SetTextPos(kx, boxY + 2)
                    surface.DrawText("—")
                    kx = kx + 16
                else
                    surface.SetFont("ZB_InterfaceSmall")
                    local kw, kh = surface.GetTextSize(key)
                    local boxW = math.max(kw + 12, 28)
                    DrawKey(kx, boxY, boxW, boxH, key)
                    kx = kx + boxW + 4

                    -- + işareti (aradaki)
                    if j < #row.keys and row.keys[j+1] ~= nil then
                        surface.SetFont("ZB_InterfaceSmall")
                        surface.SetTextColor(colTextDim.r, colTextDim.g, colTextDim.b, 180)
                        surface.SetTextPos(kx, boxY + 2)
                        surface.DrawText("+")
                        kx = kx + 12
                    end
                end
            end

            -- Açıklama
            local descX = keyColW + padding
            surface.SetFont("ZB_InterfaceSmall")
            surface.SetTextColor(colText.r, colText.g, colText.b, 220)
            local _, th = surface.GetTextSize(row.desc)
            surface.SetTextPos(descX, ry + rowH/2 - th/2)
            surface.DrawText(row.desc)
        end
    end

    -- Önceki / Sonraki butonlar
    local btnH = 30
    local btnW = 110
    local btnY = tutPanel:GetTall() - btnH - 6

    local prevBtn = vgui.Create("DButton", tutPanel)
    prevBtn:SetPos(contentX, btnY)
    prevBtn:SetSize(btnW, btnH)
    prevBtn:SetText("")
    prevBtn.Paint = function(self, w, h)
        local en  = curPage > 1
        local hov = self:IsHovered() and en
        surface.SetDrawColor(hov and 0 or 8, hov and 70 or 14, hov and 140 or 24, en and 200 or 60)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, en and 100 or 30)
        surface.DrawOutlinedRect(0, 0, w, h, 1)
        surface.SetFont("ZB_InterfaceMedium")
        surface.SetTextColor(255, 255, 255, en and 220 or 60)
        local tw, th = surface.GetTextSize("← Önceki")
        surface.SetTextPos(w/2 - tw/2, h/2 - th/2)
        surface.DrawText("← Önceki")
    end
    prevBtn.DoClick = function()
        if curPage > 1 then curPage = curPage - 1 end
    end

    local nextBtn = vgui.Create("DButton", tutPanel)
    nextBtn:SetPos(contentX + contentW - btnW, btnY)
    nextBtn:SetSize(btnW, btnH)
    nextBtn:SetText("")
    nextBtn.Paint = function(self, w, h)
        local en  = curPage < #sections
        local hov = self:IsHovered() and en
        surface.SetDrawColor(hov and 0 or 8, hov and 70 or 14, hov and 140 or 24, en and 200 or 60)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(colBorder.r, colBorder.g, colBorder.b, en and 100 or 30)
        surface.DrawOutlinedRect(0, 0, w, h, 1)
        surface.SetFont("ZB_InterfaceMedium")
        surface.SetTextColor(255, 255, 255, en and 220 or 60)
        local tw, th = surface.GetTextSize("Sonraki →")
        surface.SetTextPos(w/2 - tw/2, h/2 - th/2)
        surface.DrawText("Sonraki →")
    end
    nextBtn.DoClick = function()
        if curPage < #sections then curPage = curPage + 1 end
    end

    tutPanel.OnKeyCodePressed = function(self, key)
        if key == KEY_ESCAPE or key == KEY_F2 then
            self:Remove()
            tutPanel = nil
            tutOpen  = false
        elseif key == KEY_LEFT then
            if curPage > 1 then curPage = curPage - 1 end
        elseif key == KEY_RIGHT then
            if curPage < #sections then curPage = curPage + 1 end
        end
    end
end

-- F2 tuşu
hook.Add("PlayerButtonDown", "ZCityTutorialKey", function(ply, btn)
    if ply ~= LocalPlayer() then return end
    if btn == KEY_F2 then
        OpenTutorial()
    end
end)

-- Chat "help" komutu
hook.Add("OnPlayerChat", "ZCityTutorialChat", function(ply, text)
    if ply ~= LocalPlayer() then return end
    if string.lower(string.Trim(text)) == "help" then
        timer.Simple(0, OpenTutorial)
        return true -- chat'te görünmesini engelle
    end
end)
