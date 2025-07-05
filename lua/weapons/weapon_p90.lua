AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "P90"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "m"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_smg_p90.mdl"
SWEP.WorldModel = "models/weapons/w_smg_p90.mdl"
SWEP.HoldType = "smg"

SWEP.Primary.Sound = "Weapon_P90.Single"
SWEP.Primary.Damage = 26
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 60 / 857
SWEP.Primary.ClipSize = 50
SWEP.Primary.DefaultClip = 100
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "SMG1"

SWEP.Primary.Cone = 0.025
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.25, -0.25, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.35, 0.25, 0)
SWEP.Primary.Recoil.Punch = 0.8

if CLIENT then
	killicon.AddFont("weapon_p90", "css_sweps_killicons", "m", Color(255, 80, 0), 0.5)
end

list.Add("NPCUsableWeapons", {class = "weapon_p90", title = SWEP.PrintName})