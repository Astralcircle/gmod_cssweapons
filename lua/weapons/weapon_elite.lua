AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "Dual Elites"
SWEP.Category = "Counter-Strike: Source"
SWEP.Slot = 1

SWEP.ViewModel = "models/weapons/cstrike/c_pist_elite.mdl"
SWEP.WorldModel = "models/weapons/w_pist_elite.mdl"
SWEP.HoldType = "duel"
SWEP.UseHands = true

SWEP.Primary.Sound = "Weapon_ELITE.Single"
SWEP.Primary.Damage = 45
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 60 / 375
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Pistol"

SWEP.Primary.Cone = 0.018
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.7, -0.4, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.9, 0.4, 0)
SWEP.Primary.Recoil.Punch = 0.6

function SWEP:SetupDataTables()
    self:NetworkVar("Bool", 0, "AltGun")
end

function SWEP:ShootEffects()
	local owner = self:GetOwner()
	self:SendWeaponAnim(self:GetAltGun() and ACT_VM_SECONDARYATTACK or ACT_VM_PRIMARYATTACK)
    self:SetAltGun(not self:GetAltGun())

	owner:MuzzleFlash()
	owner:SetAnimation(PLAYER_ATTACK1)
end

list.Add("NPCUsableWeapons", {class = "weapon_elite", title = SWEP.PrintName})