AddCSLuaFile()

SWEP.Base = "weapon_csbase_shotgun"
SWEP.Spawnable = true

SWEP.PrintName = "M3 Super 90"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "k"
SWEP.Slot = 3

SWEP.ViewModel = "models/weapons/cstrike/c_shot_m3super90.mdl"
SWEP.WorldModel = "models/weapons/w_shot_m3super90.mdl"
SWEP.HoldType = "shotgun"

SWEP.Primary.Sound = "Weapon_M3.Single"
SWEP.Primary.Damage = 26
SWEP.Primary.NumShots = 9
SWEP.Primary.Delay = 0.88
SWEP.Primary.ClipSize = 8
SWEP.Primary.DefaultClip = 32
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "Buckshot"

SWEP.Primary.Cone = 0.125
SWEP.Primary.Recoil = {Angle(1, -0.35, 0), Angle(1.5, 0.35, 0)}
SWEP.NPCBurstData = {Min = 1, Max = 1, Delay = SWEP.Primary.Delay}

if CLIENT then
	killicon.AddFont("weapon_m3", "css_sweps_killicons", "k", Color(255, 80, 0), 0.2)
end

list.Add("NPCUsableWeapons", {class = "weapon_m3", title = SWEP.PrintName})