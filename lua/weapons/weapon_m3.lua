AddCSLuaFile()

SWEP.Base = "weapon_csbase_shotgun"
SWEP.Spawnable = true

SWEP.PrintName = "M3 Super 90"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "k"
SWEP.Slot = 3

SWEP.ViewModel = "models/weapons/cstrike/c_shot_m3super90.mdl"
SWEP.WorldModel = "models/weapons/w_shot_m3super90.mdl"
SWEP.HoldType = "shotgun"

SWEP.Primary.Sound = "Weapon_M3.Single"
SWEP.Primary.Damage = 26
SWEP.Primary.NumShots = 9
SWEP.Primary.Delay = 60 / 68
SWEP.Primary.ClipSize = 8
SWEP.Primary.DefaultClip = 32
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Buckshot"

SWEP.Primary.Cone = 0.125
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(1, -0.35, 0)
SWEP.Primary.Recoil.MaxAng = Angle(1.5, 0.35, 0)
SWEP.Primary.Recoil.Punch = 1

list.Add("NPCUsableWeapons", {class = "weapon_m3", title = SWEP.PrintName})