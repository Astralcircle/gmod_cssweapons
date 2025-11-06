AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "Dual Elites"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "s"
SWEP.Slot = 1

SWEP.ViewModel = "models/weapons/cstrike/c_pist_elite.mdl"
SWEP.WorldModel = "models/weapons/w_pist_elite.mdl"
SWEP.HoldType = "duel"

SWEP.Primary.Sound = "Weapon_ELITE.Single"
SWEP.Primary.Damage = 28
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.12
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Pistol"

SWEP.Primary.Cone = 0.018
SWEP.Primary.Recoil = {MinAng = Angle(0.7, -0.4, 0), MaxAng = Angle(1.0, 0.5, 0)}
SWEP.NPCBurstData = {Min = 2, Max = 2, Delay = SWEP.Primary.Delay * 2}

function SWEP:ShootEffects()
	local owner = self:GetOwner()
	self:SendWeaponAnim(self:Clip1() % 2 == 0 and ACT_VM_SECONDARYATTACK or ACT_VM_PRIMARYATTACK)

	owner:MuzzleFlash()
	owner:SetAnimation(PLAYER_ATTACK1)
end

if CLIENT then
	killicon.AddFont("weapon_elite", "css_sweps_killicons", "s", Color(255, 80, 0), 0.4)
end

list.Add("NPCUsableWeapons", {class = "weapon_elite", title = SWEP.PrintName})
