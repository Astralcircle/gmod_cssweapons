AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "UMP-45"
SWEP.Category = "Counter-Strike: Source"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_smg_ump45.mdl"
SWEP.WorldModel = "models/weapons/w_smg_ump45.mdl"
SWEP.HoldType = "smg"

SWEP.Primary.Sound = "Weapon_UMP45.Single"
SWEP.Primary.Damage = 30
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 60 / 571
SWEP.Primary.ClipSize = 25
SWEP.Primary.DefaultClip = 100
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "SMG1"

SWEP.Primary.Cone = 0.013
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.25, -0.15, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.35, 0.15, 0)
SWEP.Primary.Recoil.Punch = 0.8

list.Add("NPCUsableWeapons", {class = "weapon_ump", title = SWEP.PrintName})