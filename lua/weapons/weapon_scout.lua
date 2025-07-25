AddCSLuaFile()

SWEP.Base = "weapon_csbase_scoped"
SWEP.Spawnable = true

SWEP.PrintName = "Steyr Scout"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "n"
SWEP.Slot = 3

SWEP.ViewModel = "models/weapons/cstrike/c_snip_scout.mdl"
SWEP.WorldModel = "models/weapons/w_snip_scout.mdl"
SWEP.HoldType = "ar2"

SWEP.ScopeZoom = {2.25, 9}
SWEP.UseScope = true
SWEP.Primary.Sound = "Weapon_Scout.Single"
SWEP.Primary.Damage = 75
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 1.25
SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 10
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "XBowBolt"

SWEP.Primary.Cone = 0.001
SWEP.Primary.Recoil = {MinAng = Angle(1, -0.4, 0), MaxAng = Angle(1.5, 0.4, 0)}

if CLIENT then
	killicon.AddFont("weapon_scout", "css_sweps_killicons", "n", Color(255, 80, 0), 0.3)
end

list.Add("NPCUsableWeapons", {class = "weapon_scout", title = SWEP.PrintName})