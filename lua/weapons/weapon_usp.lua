AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "USP-S"
SWEP.Category = "Counter-Strike: Source2"
SWEP.Slot = 1

SWEP.ViewModel = "models/weapons/cstrike/c_pist_usp.mdl"
SWEP.WorldModel = "models/weapons/w_pist_usp.mdl"
SWEP.HoldType = "pistol"
SWEP.UseHands = true

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

list.Add("NPCUsableWeapons", {class = "weapon_usp", title = SWEP.PrintName})