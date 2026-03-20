include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end

function ENT:Initialize()
	self.HudHintMarkup = markup.Parse("<font=ZCity_Tiny>El Bombası\n<colour=200,0,0>KAÇ AHMAK!</colour></font>",450)
end