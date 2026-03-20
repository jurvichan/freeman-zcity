include("shared.lua")
function ENT:Initialize()
	self.HudHintMarkup = markup.Parse("<font=ZCity_Tiny>Claymore\n<colour=150,150,150>E - Hareket sensörünü aç</colour></font>",450)
end

function ENT:Draw()
	self:DrawModel()
end