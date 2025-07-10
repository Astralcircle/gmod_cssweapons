AddCSLuaFile()

DEFINE_BASECLASS("weapon_csbase")
SWEP.Spawnable = true

SWEP.PrintName = "M4A1"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "w"
SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.HoldType = "ar2"

SWEP.Primary.Sound = "Weapon_M4A1.Single"
SWEP.Primary.Damage = 33
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.09
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

SWEP.Primary.Cone = 0.01
SWEP.Primary.Recoil = {MinAng = Angle(0.5, -0.15, 0), MaxAng = Angle(0.65, 0.15, 0)}

function SWEP:SetupDataTables()
	self:NetworkVar("Bool", 0, "Silenced")
end

function SWEP:SecondaryAttack()
	local silenced = not self:GetSilenced()
	self.Primary.Tracer = silenced and 0 or nil
	self.Primary.Sound = silenced and "Weapon_M4A1.Silenced" or "Weapon_M4A1.Single"
	self:SendWeaponAnim(silenced and ACT_VM_ATTACH_SILENCER or ACT_VM_DETACH_SILENCER)
	self:SetSilenced(silenced)

	local time = CurTime() + self:SequenceDuration()
	self:SetNextPrimaryFire(time)
	self:SetNextSecondaryFire(time)
end

function SWEP:ShootEffects()
	local owner = self:GetOwner()

	if self:GetSilenced() then
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK_SILENCED)
	else
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
		owner:MuzzleFlash()
	end

	owner:SetAnimation(PLAYER_ATTACK1)
end

function SWEP:Reload()
	self:DefaultReload(self:GetSilenced() and ACT_VM_RELOAD_SILENCED or ACT_VM_RELOAD)
end

function SWEP:Deploy()
	if self:GetSilenced() then self:SendWeaponAnim(ACT_VM_DRAW_SILENCED) end
	return BaseClass.Deploy(self)
end

if CLIENT then
	killicon.AddFont("weapon_m4a1", "css_sweps_killicons", "w", Color(255, 80, 0), 0.4)

	function SWEP:FireAnimationEvent(pos, ang, event, options)
		if self:GetSilenced() and event == 5001 or event == 5003 then
			return true
		end

		return BaseClass.FireAnimationEvent(self, pos, ang, event, options)
	end

	function SWEP:DrawWorldModel(flags)
		if self:GetSilenced() then self:SetModel("models/weapons/w_rif_m4a1_silencer.mdl") end
		self:DrawModel(flags)
	end
end

list.Add("NPCUsableWeapons", {class = "weapon_m4a1", title = SWEP.PrintName})