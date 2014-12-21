AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include ("shared.lua")

function GM:Initialize()
	team.SetUp(1,"Red",Color(50,0,0),true)
	team.SetUp(2,"Gold",Color(50,50,0),true)
end