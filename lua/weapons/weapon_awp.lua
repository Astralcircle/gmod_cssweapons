AddCSLuaFile()

SWEP.Base = "weapon_csbase_scoped"
SWEP.Spawnable = true

SWEP.PrintName = "AWP"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "r"
SWEP.Slot = 3

SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel = "models/weapons/w_snip_awp.mdl"
SWEP.HoldType = "ar2"

SWEP.ScopeZoom = {2.25, 9}
SWEP.UseScope = true
SWEP.Primary.Sound = "Weapon_AWP.Single"
SWEP.Primary.Damage = 115
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 1.5
SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 10
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "XBowBolt"

SWEP.Primary.Cone = 0.001
SWEP.Primary.Recoil = {MinAng = Angle(1, -0.4, 0), Angle(1.5, 0.4, 0)}
SWEP.NPCBurstData = {Min = 1, Max = 1, Delay = SWEP.Primary.Delay}

if CLIENT then
	killicon.AddFont("weapon_awp", "css_sweps_killicons", "r", Color(255, 80, 0), 0.3)
end

list.Add("NPCUsableWeapons", {class = "weapon_awp", title = SWEP.PrintName})