AddCSLuaFile()

SWEP.Base = "weapon_csbase"
SWEP.Spawnable = true

SWEP.PrintName = "M249"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "z"
SWEP.Slot = 3

SWEP.ViewModel = "models/weapons/cstrike/c_mach_m249para.mdl"
SWEP.WorldModel = "models/weapons/w_mach_m249para.mdl"
SWEP.HoldType = "ar2"

SWEP.Primary.Sound = "Weapon_M249.Single"
SWEP.Primary.Damage = 25
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.08
SWEP.Primary.ClipSize = 100
SWEP.Primary.DefaultClip = 200
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

SWEP.Primary.Cone = 0.03
SWEP.Primary.Recoil = {MinAng = Angle(1.2, -0.6, 0), MaxAng = Angle(1.6, 0.6, 0)}
SWEP.NPCBurstData = {Min = 4, Max = 8, Delay = SWEP.Primary.Delay}

if CLIENT then
	killicon.AddFont("weapon_m249", "css_sweps_killicons", "z", Color(255, 80, 0), 0.4)
end

list.Add("NPCUsableWeapons", {class = "weapon_m249", title = SWEP.PrintName})
