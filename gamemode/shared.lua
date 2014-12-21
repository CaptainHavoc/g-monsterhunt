GM.Name = "Monster Hunt"
GM.Author = "Captain Havoc and ArmageddonScr"
GM.Email = "N/A"
GM.Website = "N/A"

function GM:PlayerSpawn(ply)
	local a = team.BestAutoJoinTeam()
	local b = team.GetName(a)
	ply:SetTeam(a)
	print(b)
end
	