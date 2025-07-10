AddCSLuaFile()

DEFINE_BASECLASS("weapon_csbase")
SWEP.Spawnable = true

SWEP.PrintName = "Glock-18"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "c"
SWEP.Slot = 1

SWEP.ViewModel = "models/weapons/cstrike/c_pist_glock18.mdl"
SWEP.WorldModel = "models/weapons/w_pist_glock18.mdl"
SWEP.HoldType = "pistol"

SWEP.Primary.Sound = "Weapon_Glock.Single"
SWEP.Primary.Damage = 25
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.15
SWEP.Primary.ClipSize = 20
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Pistol"

SWEP.Primary.Cone = 0.0167
SWEP.Primary.Recoil = {MinAng = Angle(0.45, -0.15, 0), MaxAng = Angle(0.5, 0.15, 0)}

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
	self.Primary.Delay = burst and 60 / 1200 or 60 / 400
	self.Primary.Automatic = burst
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
	killicon.AddFont("weapon_glock", "css_sweps_killicons", "c", Color(255, 80, 0), 0.5)
end

list.Add("NPCUsableWeapons", {class = "weapon_glock", title = SWEP.PrintName})