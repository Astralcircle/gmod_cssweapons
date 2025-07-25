AddCSLuaFile()

SWEP.Spawnable = true

SWEP.PrintName = "Knife"
SWEP.Category = "Counter-Strike: Source"

SWEP.BounceWeaponIcon = false
SWEP.DrawWeaponInfoBox = false

if CLIENT then
	killicon.AddFont("weapon_knife", "css_sweps_killicons", "j", Color(255, 80, 0), 0.35)

	function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
		draw.SimpleText("j", "css_sweps_icons", x + w / 2, y + h / 2, Color(255, 255, 50, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

SWEP.ViewModel = "models/weapons/cstrike/c_knife_t.mdl"
SWEP.WorldModel = "models/weapons/w_knife_t.mdl"
SWEP.UseHands = true

function SWEP:Initialize()
	self:SetHoldType("knife")
end

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

function SWEP:DoHit(secondary)
	local owner = self:GetOwner()
	local shootpos = owner:GetShootPos()
	local tracedata = {
		start = shootpos,
		endpos = shootpos + owner:GetAimVector() * 48,
		filter = owner
	}

	owner:LagCompensation(true)

	local trace = util.TraceLine(tracedata)

	if not trace.Hit then
		tracedata.mins = Vector(-16, -16, -18)
		tracedata.maxs = Vector(16, 16, 18)
		trace = util.TraceHull(tracedata)
	end

	owner:LagCompensation(false)
	owner:SetAnimation(PLAYER_ATTACK1)

	if not trace.Hit then
		self:EmitSound("Weapon_Knife.Slash")
		self:SendWeaponAnim(ACT_VM_MISSCENTER)
	else
		local ent = trace.Entity

		if IsFirstTimePredicted() then
			local effect = EffectData()
			effect:SetEntity(ent)
			effect:SetOrigin(trace.HitPos)
			effect:SetStart(trace.StartPos)
			effect:SetSurfaceProp(trace.SurfaceProps)
			effect:SetHitBox(trace.HitBox)
			effect:SetDamageType(DMG_SLASH)
			util.Effect("Impact", effect, false)
		end

		if ent:IsValid() then
			local damage = secondary and 65 or 20

			if ent:IsPlayer() or ent:IsNPC() then
				self:EmitSound(secondary and "Weapon_Knife.Stab" or "Weapon_Knife.Hit")
				self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

				if secondary and SERVER then
					local eyeangles = owner:EyeAngles()
					eyeangles.p = 0

					local eyeangles2 = ent:EyeAngles()
					eyeangles2.p = 0

					if eyeangles:Forward():Dot(eyeangles2:Forward()) >= 0.7 then
						damage = damage * 3
					end
				end
			else
				self:EmitSound("Weapon_Knife.HitWall")
				self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
			end

			if SERVER then
				local dmg = DamageInfo()
				dmg:SetDamage(damage)
				dmg:SetDamageType(DMG_CLUB)
				dmg:SetDamageForce(trace.Normal * 10000)
				dmg:SetDamagePosition(trace.HitPos)
				dmg:SetAttacker(owner)
				dmg:SetInflictor(self)
				dmg:SetWeapon(self)
				ent:DispatchTraceAttack(dmg, trace)
			end
		else
			self:EmitSound("Weapon_Knife.HitWall")
			self:SendWeaponAnim(ACT_VM_MISSCENTER)
		end
	end

	local time = CurTime() + (secondary and 1 or 0.4)
	self:SetNextPrimaryFire(time)
	self:SetNextSecondaryFire(time)
end

function SWEP:PrimaryAttack()
	self:DoHit(false)
end

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.m_WeaponDeploySpeed = 1

function SWEP:SecondaryAttack()
	self:DoHit(true)
end