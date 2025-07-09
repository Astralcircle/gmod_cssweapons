AddCSLuaFile()

DEFINE_BASECLASS("weapon_csbase")
SWEP.Spawnable = true

SWEP.PrintName = "TMP"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "d"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_smg_tmp.mdl"
SWEP.WorldModel = "models/weapons/w_smg_tmp.mdl"
SWEP.HoldType = "smg"

SWEP.Primary.Sound = "Weapon_TMP.Single"
SWEP.Primary.Damage = 26
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.07
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Tracer = 0

SWEP.Primary.Cone = 0.02
SWEP.Primary.Recoil = {}
SWEP.Primary.Recoil.MinAng = Angle(0.25, -0.15, 0)
SWEP.Primary.Recoil.MaxAng = Angle(0.35, 0.15, 0)
SWEP.Primary.Recoil.Punch = 0.8

function SWEP:ShootEffects()
	local owner = self:GetOwner()
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	owner:SetAnimation(PLAYER_ATTACK1)
end

if CLIENT then
	killicon.AddFont("weapon_tmp", "css_sweps_killicons", "d", Color(255, 80, 0), 0.5)

	function SWEP:FireAnimationEvent(pos, ang, event, options)
		if event == 5001 or event == 5003 then
			return true
		end

		return BaseClass.FireAnimationEvent(self, pos, ang, event, options)
	end
end

list.Add("NPCUsableWeapons", {class = "weapon_tmp", title = SWEP.PrintName})