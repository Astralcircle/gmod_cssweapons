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
SWEP.Primary.Delay = 60 / 666
SWEP.Primary.ClipSize = 25
SWEP.Primary.DefaultClip = 50
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

SWEP.Primary.Cone = 0.0125
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.275, -0.125, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.325, 0.125, 0)
SWEP.Primary.Recoil.Punch = 0.8

function SWEP:SetupDataTables()
	self:NetworkVar("Int", 0, "BurstIndex")
end

function SWEP:PrimaryAttack()
	BaseClass.PrimaryAttack(self)

	local burstindex = self:GetBurstIndex()

	if burstindex > 0 then
		burstindex = burstindex + 1

		if burstindex > 3 then
			self:SetNextPrimaryFire(CurTime() + 0.4)
			burstindex = 1
		end

		self:SetBurstIndex(burstindex)
	end
end

function SWEP:SecondaryAttack()
	local burst = self:GetBurstIndex() == 0
	self:EmitSound("weapons/smg1/switch_single.wav")
	self.Primary.Delay = burst and 60 / 888 or 60 / 666
	self:SetBurstIndex(burst and 1 or 0)
end

function SWEP:Deploy()
	self:SetBurstIndex(self:GetBurstIndex() > 0 and 1 or 0)
	return BaseClass.Deploy(self)
end

function SWEP:Reload()
	self:SetBurstIndex(self:GetBurstIndex() > 0 and 1 or 0)
	return BaseClass.Reload(self)
end

if CLIENT then
	killicon.AddFont("weapon_famas", "css_sweps_killicons", "t", Color(255, 80, 0), 0.4)
end

list.Add("NPCUsableWeapons", {class = "weapon_famas", title = SWEP.PrintName})