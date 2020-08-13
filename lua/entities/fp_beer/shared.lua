ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Category = "Food"
ENT.PrintName = "Beer"
ENT.Spawnable = true

function ENT:Use(ply)
	if ply:Health() >= ply:GetMaxHealth() then return end 
	ply:EmitSound(Sound("foodplus/drink.wav"), 100, math.random(90,110))
	ply:ChatPrint("This beer seems to have a higher alcohol content than advertised...")
	if ply:Health() > ply:GetMaxHealth() then ply:SetHealth(ply:GetMaxHealth()) end
	self:Remove()
end