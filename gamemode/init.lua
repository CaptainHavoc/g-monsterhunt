AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include ("shared.lua")

<<<<<<< HEAD
function GM:PlayerSpawn(ply)
	local a = team.BestAutoJoinTeam()
	local b = team.GetName(a)
	ply:SetTeam(a)
	print( ply:Nick() .. " joined team " .. b )
end
=======
function GM:Initialize()
	team.SetUp(1,"Red",Color(50,0,0),true)
	team.SetUp(2,"Gold",Color(50,50,0),true)
end
>>>>>>> origin/master
