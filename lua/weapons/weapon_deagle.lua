AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "Desert Eagle"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "f"
SWEP.Slot = 1

SWEP.ViewModel = "models/weapons/cstrike/c_pist_deagle.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"
SWEP.HoldType = "revolver"

SWEP.Primary.Sound = "Weapon_DEagle.Single"
SWEP.Primary.Damage = 54
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.225
SWEP.Primary.ClipSize = 7
SWEP.Primary.DefaultClip = 14
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "357"

SWEP.Primary.Cone = 0.0125
SWEP.Primary.Recoil = {MinAng = Angle(1, -0.35, 0), MaxAng = Angle(1.5, 0.35, 0)}
SWEP.NPCBurstData = {Min = 1, Max = 1, Delay = SWEP.Primary.Delay}

if CLIENT then
	killicon.AddFont("weapon_deagle", "css_sweps_killicons", "f", Color(255, 80, 0), 0.5)
end

list.Add("NPCUsableWeapons", {class = "weapon_deagle", title = SWEP.PrintName})