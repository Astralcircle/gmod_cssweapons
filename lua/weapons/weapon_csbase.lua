AddCSLuaFile()

SWEP.Spawnable = false

SWEP.BounceWeaponIcon = false
SWEP.DrawWeaponInfoBox = false

if CLIENT then
	surface.CreateFont("css_sweps_icons", {
		font = "cs",
		size = math.min(ScreenScale(55), 165)
	})

	surface.CreateFont("css_sweps_killicons", {
		font = "csd",
		size = 64,
		additive = true
	})

	function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
		draw.SimpleText(self.IconSymbol or "", "css_sweps_icons", x + w / 2, y + h / 2, Color(255, 255, 50, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

SWEP.CSMuzzleFlashes = true
SWEP.HoldType = "pistol"
SWEP.UseHands = true

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:CanBePickedUpByNPCs()
	return true
end

SWEP.Primary.Sound = "Weapon_AR2.Single"
SWEP.Primary.Damage = 10
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.1
SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 10
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "Pistol"

SWEP.Primary.Cone = 0
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = angle_zero
SWEP.Primary.Recoil.MaxAng = angle_zero
SWEP.Primary.Recoil.Punch = 0
SWEP.m_WeaponDeploySpeed = 1

function SWEP:ShootBullet(damage, num_bullets, aimcone, ammo_type, force, tracer)
	local owner = self:GetOwner()

	owner:FireBullets({
		Num = num_bullets,
		Src = owner:GetShootPos(),
		Dir = owner:IsPlayer() and (owner:GetAimVector():Angle() + owner:GetViewPunchAngles()):Forward() or owner:GetAimVector(),
		Spread = Vector(aimcone, aimcone, 0),
		Tracer = tracer or 5,
		Force = force or 1,
		Damage = damage,
		AmmoType = ammo_type or self.Primary.Ammo,
		Attacker = owner,
		Inflictor = self
	})

	self:ShootEffects()
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	local primary = self.Primary
	self:EmitSound(primary.Sound)
	self:ShootBullet(primary.Damage, primary.NumShots, primary.Cone, primary.Ammo, primary.Force, primary.Tracer)
	self:SetNextPrimaryFire(CurTime() + primary.Delay)
	self:TakePrimaryAmmo(1)

	local owner = self:GetOwner()

	if owner:IsPlayer() then
		local recoil = primary.Recoil
		local seed = owner:GetCurrentCommand():CommandNumber()
		owner:ViewPunch(Angle(-util.SharedRandom(seed, recoil.MinAng.p, recoil.MaxAng.p), util.SharedRandom(seed, recoil.MinAng.y, recoil.MaxAng.y), 0))
	end
end

SWEP.Secondary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false

function SWEP:SecondaryAttack()
	-- For overriding
end
