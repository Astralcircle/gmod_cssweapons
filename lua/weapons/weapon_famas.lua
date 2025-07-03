AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "FAMAS"
SWEP.Category = "Counter-Strike: Source"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_rif_famas.mdl"
SWEP.WorldModel = "models/weapons/w_rif_famas.mdl"
SWEP.HoldType = "ar2"
SWEP.UseHands = true

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

list.Add("NPCUsableWeapons", {class = "weapon_famas", title = SWEP.PrintName})