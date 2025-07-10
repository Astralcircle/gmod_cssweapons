AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "MP5"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "x"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_smg_mp5.mdl"
SWEP.WorldModel = "models/weapons/w_smg_mp5.mdl"
SWEP.HoldType = "smg"

SWEP.Primary.Sound = "Weapon_MP5Navy.Single"
SWEP.Primary.Damage = 26
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.08
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "SMG1"

SWEP.Primary.Cone = 0.020
SWEP.Primary.Recoil = {MinAng = Angle(0.25, -0.15, 0), MaxAng = Angle(0.35, 0.15, 0)}

if CLIENT then
	killicon.AddFont("weapon_mp5navy", "css_sweps_killicons", "x", Color(255, 80, 0), 0.4)
end

list.Add("NPCUsableWeapons", {class = "weapon_mp5navy", title = SWEP.PrintName})