AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "M4A1"
SWEP.Category = "Counter-Strike: Source"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.HoldType = "ar2"


SWEP.Primary.Sound = "Weapon_M4A1.Single"
SWEP.Primary.Damage = 33
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 60 / 666
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

SWEP.Primary.Cone = 0.01
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.5, -0.15, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.65, 0.15, 0)
SWEP.Primary.Recoil.Punch = 0.8

function SWEP:SetupDataTables()
    self:NetworkVar("Bool", 0, "Silenced")
end

function SWEP:SecondaryAttack()
    local silenced = self:GetSilenced()

    if silenced then
        self.Primary.Sound = "Weapon_M4A1.Single"
        self:SendWeaponAnim(ACT_VM_DETACH_SILENCER)
        self:SetSilenced(false)
    else
        self.Primary.Sound = "Weapon_M4A1.Silenced"
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
        if self:GetSilenced() then self:SetModel("models/weapons/w_rif_m4a1_silencer.mdl") end
        self:DrawModel(flags)
    end
end

list.Add("NPCUsableWeapons", {class = "weapon_m4a1", title = SWEP.PrintName})