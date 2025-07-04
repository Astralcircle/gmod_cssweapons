AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "TMP"
SWEP.Category = "Counter-Strike: Source"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_smg_tmp.mdl"
SWEP.WorldModel = "models/weapons/w_smg_tmp.mdl"
SWEP.HoldType = "smg"


SWEP.Primary.Sound = "Weapon_TMP.Single"
SWEP.Primary.Damage = 26
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 60 / 857
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "SMG1"

SWEP.Primary.Cone = 0.02
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.25, -0.15, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.35, 0.15, 0)
SWEP.Primary.Recoil.Punch = 0.8

list.Add("NPCUsableWeapons", {class = "weapon_tmp", title = SWEP.PrintName})