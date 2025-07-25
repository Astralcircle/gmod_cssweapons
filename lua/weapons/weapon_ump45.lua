AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "UMP-45"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "q"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_smg_ump45.mdl"
SWEP.WorldModel = "models/weapons/w_smg_ump45.mdl"
SWEP.HoldType = "smg"

SWEP.Primary.Sound = "Weapon_UMP45.Single"
SWEP.Primary.Damage = 30
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.105
SWEP.Primary.ClipSize = 25
SWEP.Primary.DefaultClip = 100
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "SMG1"

SWEP.Primary.Cone = 0.013
SWEP.Primary.Recoil = {MinAng = Angle(0.25, -0.15, 0), MaxAng = Angle(0.35, 0.15, 0)}

if CLIENT then
	killicon.AddFont("weapon_ump45", "css_sweps_killicons", "q", Color(255, 80, 0), 0.4)
end

list.Add("NPCUsableWeapons", {class = "weapon_ump45", title = SWEP.PrintName})