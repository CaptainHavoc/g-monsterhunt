AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_weaponhud.lua")

include ("shared.lua")

function GM:PlayerInitialSpawn( ply )
	local a = team.BestAutoJoinTeam()
	local b = team.GetName(a)
	ply:SetTeam(a)
	print( ply:Nick() .. " joined team " .. b )
	ply:SetModel("models/player/group03/male_0" .. math.random(1,9) .. ".mdl")
end

function GM:PlayerLoadout( ply )
	local tab={"weapon_smg1", "weapon_pistol", "weapon_rpg", "weapon_shotgun",
	"weapon_crowbar", "weapon_physcannon"}
	for k,v in pairs( tab ) do
		ply:Give(v)
	end
	self:SetPlayerSpeed(ply,390,390)
end

function GM:PlayerSwitchFlashlight( ply, b_option ) 
	return true
end