AddCSLuaFile()

SWEP.Base = "weapon_csbase_scoped"
SWEP.Spawnable = true

SWEP.PrintName = "SG 552"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "A"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_rif_sg552.mdl"
SWEP.WorldModel = "models/weapons/w_rif_sg552.mdl"
SWEP.HoldType = "ar2"

SWEP.ScopeZoom = {3}
SWEP.UseScope = false
SWEP.Primary.Sound = "Weapon_SG552.Single"
SWEP.Primary.Damage = 33
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 60 / 666
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

SWEP.Primary.Cone = 0.0078
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.5, -0.2, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.6, 0.2, 0)
SWEP.Primary.Recoil.Punch = 0.4

list.Add("NPCUsableWeapons", {class = "weapon_sg552", title = SWEP.PrintName})