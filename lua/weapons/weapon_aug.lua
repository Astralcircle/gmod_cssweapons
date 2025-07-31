AddCSLuaFile()

SWEP.Base = "weapon_csbase_scoped"
SWEP.Spawnable = true

SWEP.PrintName = "AUG"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "e"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_rif_aug.mdl"
SWEP.WorldModel = "models/weapons/w_rif_aug.mdl"
SWEP.HoldType = "smg"

SWEP.ScopeZoom = {1.63}
SWEP.UseScope = false
SWEP.Primary.Sound = "Weapon_AUG.Single"
SWEP.Primary.Damage = 32
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.09
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

SWEP.Primary.Cone = 0.0078
SWEP.Primary.Recoil = {MinAng = Angle(0.5, -0.2, 0), MaxAng = Angle(0.6, 0.2, 0)}
SWEP.NPCBurstData = {Min = 2, Max = 5, Delay = SWEP.Primary.Delay}

if CLIENT then
	killicon.AddFont("weapon_aug", "css_sweps_killicons", "e", Color(255, 80, 0), 0.4)
end

list.Add("NPCUsableWeapons", {class = "weapon_aug", title = SWEP.PrintName})