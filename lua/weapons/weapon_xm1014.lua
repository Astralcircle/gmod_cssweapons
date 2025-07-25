AddCSLuaFile()

SWEP.Base = "weapon_csbase_shotgun"
SWEP.Spawnable = true

SWEP.PrintName = "XM1014"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "B"
SWEP.Slot = 3

SWEP.ViewModel = "models/weapons/cstrike/c_shot_xm1014.mdl"
SWEP.WorldModel = "models/weapons/w_shot_xm1014.mdl"
SWEP.HoldType = "shotgun"

SWEP.Primary.Sound = "Weapon_XM1014.Single"
SWEP.Primary.Damage = 22
SWEP.Primary.NumShots = 6
SWEP.Primary.Delay = 0.25
SWEP.Primary.ClipSize = 7
SWEP.Primary.DefaultClip = 32
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "Buckshot"

SWEP.Primary.Cone = 0.062
SWEP.Primary.Recoil = {MinAng = Angle(1, -0.35, 0), MaxAng = Angle(1.5, 0.35, 0)}

if CLIENT then
	killicon.AddFont("weapon_xm1014", "css_sweps_killicons", "B", Color(255, 80, 0), 0.3)
end

list.Add("NPCUsableWeapons", {class = "weapon_xm1014", title = SWEP.PrintName})