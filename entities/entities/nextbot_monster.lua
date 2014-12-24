AddCSLuaFile("nextbot_monster.lua")

ENT.Base				= "base_nextbot"
ENT.Spawnable		= true

function ENT:Initialize()
	self:SetModel("models/zombie/classic.mdl")
	self.LoseTargetDist	= 2000
	self.SearchRadius	= 1000
end

function ENT:SetEnemy(ent)
	self.Enemy = ent
end
function ENT:GetEnemy()
	return self.Enemy
end
function ENT:HaveEnemy()
	local _ents = ents.FindInSphere(self:GetPos(), self.SearchRadius)
	for k,v in pairs (_ents) do
		if (v:IsPlayer()) then
			self:SetEnemy(v)
			return true
		end
	end
	self:SetEnemy(nil)
	return false
end

function ENT:RunBehaviour()
	-- This function is called when the entity is first spawned, it acts as a giant loop that will run as long as the NPC exists
	while ( true ) do
		
		
		-- Lets use the above mentioned functions to see if ( we have/can find a enemy
		if ( self:HaveEnemy() ) then
			-- Now that we have a enemy, the code in this block will run
			self.loco:FaceTowards( self:GetEnemy():GetPos() )	-- Face our enemy
			self:PlaySequenceAndWait( "plant" )		-- Lets make a pose to show we found a enemy
			self:PlaySequenceAndWait( "hunter_angry" )-- Play an animation to show the enemy we are angry
			self:PlaySequenceAndWait( "unplant" )	-- Get out of the pose
			self:StartActivity( ACT_RUN )			-- Set the animation
			self.loco:SetDesiredSpeed( 170 )		-- Set the speed that we will be moving at. Don't worry, the animation will speed up/slow down to match
			self.loco:SetAcceleration( 900 )			-- We are going to run at the enemy quickly, so we want to accelerate really fast
			self:ChaseEnemy() 						-- The new function like MoveToPos that will be looked at soon.
			self.loco:SetAcceleration( 400 )			-- Set this back to its default since we are done chasing the enemy
			self:PlaySequenceAndWait( "charge_miss_slide" )	-- Lets play a fancy animation when we stop moving
			self:StartActivity( ACT_IDLE )			--We are done so go back to idle
			-- Now once the above function is finished doing what it needs to do, the code will loop back to the start
			-- unless you put stuff after the if ( statement. Then that will be run before it loops
			
		else
			-- Since we can't find an enemy, lets wander
			-- Its the same code used in Garry's test bot
			self:StartActivity( ACT_WALK )			-- Walk anmimation
			self.loco:SetDesiredSpeed( 100 )		-- Walk speed
			self:MoveToPos( self:GetPos() + Vector( math.Rand( -1, 1 ), math.Rand( -1, 1 ), 0 ) * 400 ) -- Walk to a random place within about 400 units ( yielding )
			self:StartActivity( ACT_IDLE )
		end
		-- At this point in the code the bot has stopped chasing the player or finished walking to a random spot
		-- Using this next function we are going to wait 2 seconds until we go ahead and repeat it 
		coroutine.wait( 1 )
		
	end

end	

function ENT:ChaseEnemy( options )

	local options = options or {}

	local path = Path( "Follow" )
	path:SetMinLookAheadDistance( options.lookahead or 300 )
	path:SetGoalTolerance( options.tolerance or 20 )
	path:Compute( self, self:GetEnemy():GetPos() )		-- Compute the path towards the enemy's position

	if ( !path:IsValid() ) then return "failed" end

	while ( path:IsValid() and self:HaveEnemy() ) do
	
		if ( path:GetAge() > 0.1 ) then					-- Since we are following the player we have to constantly remake the path
			path:Compute( self, self:GetEnemy():GetPos() )-- Compute the path towards the enemy's position again
		end
		path:Update( self )								-- This function moves the bot along the path
		
		if not ( options.draw ) then path:Draw() end
		-- If we're stuck ) then call the HandleStuck function and abandon
		if ( self.loco:IsStuck() ) then
			self:HandleStuck()
			return "stuck"
		end

		coroutine.yield()

	end

	return "ok"

end

function ENT:Use()
	self:Remove()
end

list.Set( "NPC", "simple_nextbot", {
	Name = "Simple Bot", 
	Class = "simple_nextbot", 
	Category = "NextBot"
} )

