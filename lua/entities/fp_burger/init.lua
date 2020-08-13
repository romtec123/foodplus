AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
function ENT:Initialize()
	self:SetModel("models/food/burger.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()

	if phys:IsValid() then
		phys:Wake()
	end
end

function ENT:Use(ply)
	if ply:Health() == ply:GetMaxHealth() then return end 
	ply:SetHealth(ply:Health() + 5)
	ply:EmitSound(Sound("foodplus/nom".. math.random(1,5) .. ".wav"), 100, math.random(90,110))
	if ply:Health() > ply:GetMaxHealth() then ply:SetHealth(ply:GetMaxHealth()) end
	self:Remove()
end