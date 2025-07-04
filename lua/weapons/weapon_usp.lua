AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "USP-S"
SWEP.Category = "Counter-Strike: Source"
SWEP.Slot = 1

SWEP.ViewModel = "models/weapons/cstrike/c_pist_usp.mdl"
SWEP.WorldModel = "models/weapons/w_pist_usp.mdl"
SWEP.HoldType = "pistol"

SWEP.Primary.Sound = "Weapon_USP.Single"
SWEP.Primary.Damage = 34
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 60 / 400
SWEP.Primary.ClipSize = 12
SWEP.Primary.DefaultClip = 24
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Pistol"

SWEP.Primary.Cone = 0.008
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.7, -0.15, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.9, 0.15, 0)
SWEP.Primary.Recoil.Punch = 0.6

function SWEP:SetupDataTables()
	self:NetworkVar("Bool", 0, "Silenced")
end

function SWEP:SecondaryAttack()
	local silenced = self:GetSilenced()

	if silenced then
		self.Primary.Sound = "Weapon_USP.Single"
		self:SendWeaponAnim(ACT_VM_DETACH_SILENCER)
		self:SetSilenced(false)
	else
		self.Primary.Sound = "Weapon_USP.SilencedShot"
		self:SendWeaponAnim(ACT_VM_ATTACH_SILENCER)
		self:SetSilenced(true)
	end

	local time = CurTime() + self:SequenceDuration()
	self:SetNextPrimaryFire(time)
	self:SetNextSecondaryFire(time)
end

function SWEP:ShootEffects()
	local owner = self:GetOwner()
	self:SendWeaponAnim(self:GetSilenced() and ACT_VM_PRIMARYATTACK_SILENCED or ACT_VM_PRIMARYATTACK)
	owner:MuzzleFlash()
	owner:SetAnimation(PLAYER_ATTACK1)
end

function SWEP:Reload()
	self:DefaultReload(self:GetSilenced() and ACT_VM_RELOAD_SILENCED or ACT_VM_RELOAD)
end

function SWEP:Deploy()
	if self:GetSilenced() then self:SendWeaponAnim(ACT_VM_DRAW_SILENCED) end
	return true
end

if CLIENT then
	function SWEP:DrawWorldModel(flags)
		if self:GetSilenced() then self:SetModel("models/weapons/w_pist_usp_silencer.mdl") end
		self:DrawModel(flags)
	end
end

list.Add("NPCUsableWeapons", {class = "weapon_usp", title = SWEP.PrintName})