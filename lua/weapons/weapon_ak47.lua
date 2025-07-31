AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "AK-47"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "b"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.HoldType = "ar2"

SWEP.Primary.Sound = "Weapon_AK47.Single"
SWEP.Primary.Damage = 36
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.1
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

SWEP.Primary.Cone = 0.0125
SWEP.Primary.Recoil = {MinAng = Angle(0.55, -0.25, 0), MaxAng = Angle(0.65, 0.25, 0)}
SWEP.NPCBurstData = {Min = 2, Max = 5, Delay = SWEP.Primary.Delay}

if CLIENT then
	killicon.AddFont("weapon_ak47", "css_sweps_killicons", "b", Color(255, 80, 0), 0.3)
end

list.Add("NPCUsableWeapons", {class = "weapon_ak47", title = SWEP.PrintName})