include("shared.lua")
<<<<<<< HEAD
local w = ScrW()

function GM:ScoreboardShow()
	draw.WordBox(2,10,10,"derp","Trebuchet24",Color(0,0,0),Color(255,255,255))
=======

local board=false
function GM:ScoreboardShow()
	board=true
end

function GM:ScoreboardHide()
	board=false
end

function GM:HUDDrawScoreBoard()
	if (board==false) then return end
	local x = ScrW()*0.2
	local y = ScrH()*0.1

	draw.RoundedBoxEx( 2, x, y, ScrW()-(x*2), ScrH()*0.3, Color(35,35,35,235), true, true, true, true )
	
	local ycount=-17
	for num,ply in pairs(player.GetAll()) do
		ycount=ycount+17
		draw.DrawText( ply:GetName(), "ChatFont", x + 3, (y+3)+ycount, team.GetColor( ply:Team() ), TEXT_ALIGN_LEFT ) 
	end

>>>>>>> origin/master
end