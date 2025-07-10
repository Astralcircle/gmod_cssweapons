AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "Galil"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "v"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_rif_galil.mdl"
SWEP.WorldModel = "models/weapons/w_rif_galil.mdl"
SWEP.HoldType = "ar2"

SWEP.Primary.Sound = "Weapon_Galil.Single"
SWEP.Primary.Damage = 30
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.09
SWEP.Primary.ClipSize = 35
SWEP.Primary.DefaultClip = 90
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

SWEP.Primary.Cone = 0.0125
SWEP.Primary.Recoil = {MinAng = Angle(0.5, -0.15, 0), MaxAng = Angle(0.6, 0.15, 0)}

if CLIENT then
	killicon.AddFont("weapon_galil", "css_sweps_killicons", "v", Color(255, 80, 0), 0.3)
end

list.Add("NPCUsableWeapons", {class = "weapon_galil", title = SWEP.PrintName})