AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "M4A1"
SWEP.Category = "Counter-Strike: Source"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.HoldType = "ar2"
SWEP.UseHands = true

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

list.Add("NPCUsableWeapons", {class = "weapon_m4a1", title = SWEP.PrintName})