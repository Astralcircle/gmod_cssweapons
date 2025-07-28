AddCSLuaFile()

DEFINE_BASECLASS("weapon_csbase")
SWEP.Spawnable = true

SWEP.PrintName = "FAMAS"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "t"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_rif_famas.mdl"
SWEP.WorldModel = "models/weapons/w_rif_famas.mdl"
SWEP.HoldType = "ar2"

SWEP.Primary.Sound = "Weapon_FAMAS.Single"
SWEP.Primary.Damage = 30
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.09
SWEP.Primary.ClipSize = 25
SWEP.Primary.DefaultClip = 50
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

SWEP.Primary.Cone = 0.0125
SWEP.Primary.Recoil = {MinAng = Angle(0.275, -0.125, 0), MaxAng = Angle(0.325, 0.125, 0)}

function SWEP:SetupDataTables()
	self:NetworkVar("Bool", 0, "BurstMode")
	self:NetworkVar("Int", 0, "BurstShotsRemaining")
end

function SWEP:PrimaryAttack()
	if self:GetBurstMode() then
		self.Primary.Delay = 0.075
		self:SetBurstShotsRemaining(2)
	else
		self.Primary.Delay = 0.09
	end

	BaseClass.PrimaryAttack(self)
end

function SWEP:Think()
	if self:GetBurstMode() then
		local shotsremaining = self:GetBurstShotsRemaining()

		if shotsremaining > 0 and self:GetNextPrimaryFire() <= CurTime() then
			shotsremaining = shotsremaining - 1
			self:SetBurstShotsRemaining(shotsremaining)
			BaseClass.PrimaryAttack(self)

			if shotsremaining == 0 then
				self:SetNextPrimaryFire(CurTime() + 0.55)
			end
		end
	end
end

function SWEP:Reload()
	self:SetBurstShotsRemaining(0)
	return BaseClass.Reload(self)
end

function SWEP:SecondaryAttack()
	self:EmitSound("weapons/smg1/switch_single.wav")
	self:SetBurstMode(not self:GetBurstMode())
end

if CLIENT then
	killicon.AddFont("weapon_famas", "css_sweps_killicons", "t", Color(255, 80, 0), 0.4)
end

list.Add("NPCUsableWeapons", {class = "weapon_famas", title = SWEP.PrintName})