
local allow_draw={}
allow_draw["CHudHealth"]=false

surface.CreateFont( "mhHudSymbol", {
	font = "CloseCaption_Normal", 
	size = 70, 
	weight = 800, 
	blursize = 0, 
	scanlines = 0, 
	antialias = true, 
	underline = false, 
	italic = false, 
	strikeout = false, 
	symbol = false, 
	rotary = false, 
	shadow = false, 
	additive = false, 
	outline = false, 
} )

surface.CreateFont( "mhHudFont", {
	font = "CloseCaption_Normal", 
	size = 55, 
	weight = 600, 
	blursize = 0, 
	scanlines = 0, 
	antialias = true, 
	underline = false, 
	italic = false, 
	strikeout = false, 
	symbol = false, 
	rotary = false, 
	shadow = true, 
	additive = false, 
	outline = false, 
} )


function GM:HUDShouldDraw( name )
	if allow_draw[name]!=nil then
		return false
	end
	return true
end


local health=100
function GM:HUDPaint()
	local size_w=180
	local size_h=60
	local x=ScrW()*0.04
	local y=ScrH()*0.89
	
	
	
	draw.RoundedBoxEx( 8, 
	x, -- X
	y,     -- Y
	size_w,				 -- W
	size_h, 				 -- H
	Color(25,25,25,225), false , true , false , true )
	
	draw.DrawText( "+","mhHudSymbol",x+4,y-10, Color(0,0,255) )
	if not IsValid(LocalPlayer()) then return end
	--health=math.Approach( health, LocalPlayer():Health(), 0.05 ) 
	--draw.DrawText( math.Round(health),"mhHudFont",x+68,y, Color(45,45,45), TEXT_ALIGN_LEFT )
	draw.DrawText( math.Clamp( LocalPlayer():Health(),0,5000 ) ,"mhHudFont",x+68,y, Color(0,0,255), TEXT_ALIGN_LEFT )

end










if true then return end

local weapon_list={}
weapon_list["weapon_smg1"]="/"
weapon_list["weapon_shotgun"]="0"
weapon_list["weapon_pistol"]="-"
weapon_list["weapon_rpg"]="3"
weapon_list["weapon_crowbar"]="6"
weapon_list["weapon_physcannon"]=","
//weapon_list["weapon_crowbar"]=[[-+=./]]



function GM:HUDPaint()
	if not IsValid(LocalPlayer()) then return end
	if not LocalPlayer():Alive() then return end
	local wep=LocalPlayer():GetActiveWeapon():GetClass()
	
	local w=ScrW()
	local h=ScrH()
	local center=ScrW()/2
	local wep=LocalPlayer():GetActiveWeapon():GetClass()
	local allweps=LocalPlayer():GetWeapons()
	local weps={}
	local count = 1
	for k,v in pairs(allweps) do
		if weapon_list[v:GetClass()]!=nil then
			weps[count]=v:GetClass()
			count=count+1
		end
	end
	
	local box_h=50
	local yoffset=25
	local size_w=w*0.4
	draw.RoundedBoxEx( 2, 
	center-(size_w/2), -- X
	h-box_h-yoffset,     -- Y
	size_w,				 -- W
	box_h, 				 -- H
	Color(25,25,25,225), true, true, true, true )
	
	for k,v in pairs(weps) do
		local col=color_white
		if LocalPlayer():GetActiveWeapon():GetClass()==v then
			col=Color(255,255,0)
		end
		draw.DrawText( weapon_list[v] or "1", "HL2MPTypeDeath" ,
		
		( 
			center-(size_w/2) + 
			( k * 
				( size_w / table.Count(weapon_list) ) 
			)				
			-(size_w/table.Count(weapon_list)/2)
		)	,
		
		h*0.925,col,TEXT_ALIGN_CENTER )
	end
	draw.DrawText( tostring(size_w/table.Count(weapon_list)/2), "ChatFont",10,10,color_white)
end