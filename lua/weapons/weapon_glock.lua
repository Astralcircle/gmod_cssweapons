AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "Glock-18"
SWEP.Category = "Counter-Strike: Source2"
SWEP.Slot = 1

SWEP.ViewModel = "models/weapons/cstrike/c_pist_glock18.mdl"
SWEP.WorldModel = "models/weapons/w_pist_glock18.mdl"
SWEP.HoldType = "pistol"
SWEP.UseHands = true

SWEP.Primary.Sound = "Weapon_Glock.Single"
SWEP.Primary.Damage = 25
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 60 / 400
SWEP.Primary.ClipSize = 20
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Pistol"

SWEP.Primary.Cone = 0.0167
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.45, -0.15, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.5, 0.15, 0)
SWEP.Primary.Recoil.Punch = 0.8

list.Add("NPCUsableWeapons", {class = "weapon_glock", title = SWEP.PrintName})