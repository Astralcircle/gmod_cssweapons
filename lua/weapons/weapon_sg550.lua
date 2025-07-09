AddCSLuaFile()

SWEP.Base = "weapon_csbase_scoped"
SWEP.Spawnable = true

SWEP.PrintName = "SG 550"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "o"
SWEP.Slot = 3

SWEP.ViewModel = "models/weapons/cstrike/c_snip_sg550.mdl"
SWEP.WorldModel = "models/weapons/w_snip_sg550.mdl"
SWEP.HoldType = "ar2"

SWEP.ScopeZoom = {2.25, 6}
SWEP.UseScope = true
SWEP.Primary.Sound = "Weapon_SG550.Single"
SWEP.Primary.Damage = 60
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.25
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "XBowBolt"

SWEP.Primary.Cone = 0.004
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(1, -0.3, 0)
SWEP.Primary.Recoil.MaxAng = Angle(1.5, 0.3, 0)
SWEP.Primary.Recoil.Punch = 0.8

if CLIENT then
	killicon.AddFont("weapon_sg550", "css_sweps_killicons", "o", Color(255, 80, 0), 0.3)
end

list.Add("NPCUsableWeapons", {class = "weapon_sg550", title = SWEP.PrintName})