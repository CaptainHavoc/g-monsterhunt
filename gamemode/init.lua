AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include ("shared.lua")

function GM:PlayerSpawn(ply)
	local a = team.BestAutoJoinTeam()
	local b = team.GetName(a)
	ply:SetTeam(a)
	print( ply:Nick() .. " joined team " .. b )
	ply:SetModel("models/player/group03/male_0" .. math.random(1,9) .. ".mdl")
	ply:Give("cw_bizongsm")
end

