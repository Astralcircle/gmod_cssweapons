AddCSLuaFile()

SWEP.Base = "weapon_csbase_scoped"
SWEP.Spawnable = true

SWEP.PrintName = "SG 552"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "A"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_rif_sg552.mdl"
SWEP.WorldModel = "models/weapons/w_rif_sg552.mdl"
SWEP.HoldType = "ar2"

SWEP.ScopeZoom = {3}
SWEP.UseScope = false
SWEP.Primary.Sound = "Weapon_SG552.Single"
SWEP.Primary.Damage = 33
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.09
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

SWEP.Primary.Cone = 0.0078
SWEP.Primary.Recoil = {MinAng = Angle(0.5, -0.2, 0), MaxAng = Angle(0.6, 0.2, 0)}

if CLIENT then
	killicon.AddFont("weapon_sg552", "css_sweps_killicons", "A", Color(255, 80, 0), 0.4)
end

list.Add("NPCUsableWeapons", {class = "weapon_sg552", title = SWEP.PrintName})