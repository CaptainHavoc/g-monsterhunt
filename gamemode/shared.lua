GM.Name 	= "Monster Hunt"
GM.Author 	= "Captain Havoc and ArmageddonScr"
GM.Email 	= "N/A"
GM.Website 	= "N/A"
--DeriveGamemode("sandbox")

mh={}

function GM:Initialize()
	team.SetUp(1,"Red",Color(187,0,0),true)
	team.SetUp(2,"Gold",Color(255,201,14),true)
end

function mh.CreateNpc(ply,cmd,args,fullstr)
	if (CLIENT) then return end
	local npc=args[1]
	local ent=ents.Create(npc or "nextbot_monster")
	ent:Activate()
	ent:Spawn()
	
	ent:SetPos(ply:GetEyeTrace().HitPos)
end
concommand.Add("mh_spawn_npc", mh.CreateNpc)