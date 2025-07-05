AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "MAC-10"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "l"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_smg_mac10.mdl"
SWEP.WorldModel = "models/weapons/w_smg_mac10.mdl"
SWEP.HoldType = "pistol"

SWEP.Primary.Sound = "Weapon_MAC10.Single"
SWEP.Primary.Damage = 29
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 60 / 857
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "SMG1"

SWEP.Primary.Cone = 0.025
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.25, -0.2, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.35, 0.2, 0)
SWEP.Primary.Recoil.Punch = 0.8

if CLIENT then
	killicon.AddFont("weapon_mac10", "css_sweps_killicons", "l", Color(255, 80, 0), 0.5)
end

list.Add("NPCUsableWeapons", {class = "weapon_mac10", title = SWEP.PrintName})