AddCSLuaFile()

SWEP.Base = "weapon_csbase_scoped"
SWEP.Spawnable = true

SWEP.PrintName = "AUG"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "e"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_rif_aug.mdl"
SWEP.WorldModel = "models/weapons/w_rif_aug.mdl"
SWEP.HoldType = "smg"

SWEP.ScopeZoom = {3}
SWEP.UseScope = false
SWEP.Primary.Sound = "Weapon_AUG.Single"
SWEP.Primary.Damage = 32
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 60 / 666
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

SWEP.Primary.Cone = 0.0078
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.5, -0.2, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.6, 0.2, 0)
SWEP.Primary.Recoil.Punch = 0.4

list.Add("NPCUsableWeapons", {class = "weapon_aug", title = SWEP.PrintName})