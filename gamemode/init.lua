AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include ("shared.lua")

function GM:PlayerSpawn(ply)
	local a = team.BestAutoJoinTeam()
	local b = team.GetName(a)
	ply:SetTeam(a)
	print( ply:Nick() .. " joined team " .. b )
end
