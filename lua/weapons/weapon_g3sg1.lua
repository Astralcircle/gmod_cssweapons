AddCSLuaFile()

SWEP.Base = "weapon_csbase_scoped"
SWEP.Spawnable = true

SWEP.PrintName = "G3SG1"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "i"
SWEP.Slot = 3

SWEP.ViewModel = "models/weapons/cstrike/c_snip_g3sg1.mdl"
SWEP.WorldModel = "models/weapons/w_snip_g3sg1.mdl"
SWEP.HoldType = "ar2"

SWEP.ScopeZoom = {2.25, 6}
SWEP.UseScope = true
SWEP.Primary.Sound = "Weapon_G3SG1.Single"
SWEP.Primary.Damage = 60
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.25
SWEP.Primary.ClipSize = 20
SWEP.Primary.DefaultClip = 20
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "XBowBolt"

SWEP.Primary.Cone = 0.004
SWEP.Primary.Recoil = {MinAng = Angle(1, -0.3, 0), MaxAng = Angle(1.5, 0.3, 0)}

if CLIENT then
	killicon.AddFont("weapon_g3sg1", "css_sweps_killicons", "i", Color(255, 80, 0), 0.4)
end

list.Add("NPCUsableWeapons", {class = "weapon_g3sg1", title = SWEP.PrintName})