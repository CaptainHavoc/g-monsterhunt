include("shared.lua")
include("cl_weaponhud.lua")

--local board=false
if board==nil then
	board=false
end
function GM:ScoreboardShow()
	board=(!board)
end

function GM:ScoreboardHide()
	--board=false
end

function GM:HUDDrawScoreBoard()
	if (board==false) then return end
	local x = ScrW()*0.32
	local y = ScrH()*0.1
	local w = 0
	local h = 0

	draw.RoundedBoxEx( 16, x, y, ScrW()-(x*2), ScrH()*0.3, Color(35,35,35,235), false, false, true, true )
	
	local spacing=13
	local yoffset=y+3
	
	for num,ply in pairs(player.GetAll()) do
	
		--local ypos=yoffset
		if num>-1 then
			ypos=yoffset+(spacing*num)-spacing
		end
		
		draw.DrawText( /*"[" .. num .. "] " ..*/ ply:GetName(), "ChatFont", x + 8, ypos, team.GetColor( ply:Team() ), TEXT_ALIGN_LEFT ) 
		
	end

end















