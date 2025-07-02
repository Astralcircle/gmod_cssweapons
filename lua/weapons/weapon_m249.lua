AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "M249"
SWEP.Category = "Counter-Strike: Source2"
SWEP.Slot = 3

SWEP.ViewModel = "models/weapons/cstrike/c_mach_m249para.mdl"
SWEP.WorldModel = "models/weapons/w_mach_m249para.mdl"
SWEP.HoldType = "ar2"
SWEP.UseHands = true

SWEP.Primary.Sound = "Weapon_M249.Single"
SWEP.Primary.Damage = 35
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 60 / 750
SWEP.Primary.ClipSize = 100
SWEP.Primary.DefaultClip = 200
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

SWEP.Primary.Cone = 0.018
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.25, -0.2, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.35, 0.2, 0)
SWEP.Primary.Recoil.Punch = 0.8

list.Add("NPCUsableWeapons", {class = "weapon_m249", title = SWEP.PrintName})