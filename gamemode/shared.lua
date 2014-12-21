GM.Name = "Monster Hunt"
GM.Author = "Captain Havoc and ArmageddonScr"
GM.Email = "N/A"
GM.Website = "N/A"

function GM:Initialize()
	team.SetUp(1,"Red",Color(50,0,0),true)
	team.SetUp(2,"Gold",Color(50,50,0),true)
end

function GM:PlayerSpawn(ply)
	local a = team.BestAutoJoinTeam()
	local b = team.GetName(a)
	ply:SetTeam(a)
	print(b)
end
	