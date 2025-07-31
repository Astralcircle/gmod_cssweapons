AddCSLuaFile()

DEFINE_BASECLASS("weapon_csbase")
SWEP.Spawnable = true

SWEP.PrintName = "USP-S"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "a"
SWEP.Slot = 1

SWEP.ViewModel = "models/weapons/cstrike/c_pist_usp.mdl"
SWEP.WorldModel = "models/weapons/w_pist_usp.mdl"
SWEP.HoldType = "pistol"

SWEP.Primary.Sound = "Weapon_USP.Single"
SWEP.Primary.Damage = 34
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.15
SWEP.Primary.ClipSize = 12
SWEP.Primary.DefaultClip = 24
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Pistol"

SWEP.Primary.Cone = 0.008
SWEP.Primary.Recoil = {MinAng = Angle(0.7, -0.15, 0), MaxAng = Angle(0.9, 0.15, 0)}
SWEP.NPCBurstData = {Min = 1, Max = 1, Delay = SWEP.Primary.Delay}

function SWEP:SetupDataTables()
	self:NetworkVar("Bool", 0, "Silenced")
end

function SWEP:PrimaryAttack()
	local silenced = self:GetSilenced()
	self.Primary.Tracer = silenced and 0 or nil
	self.Primary.Sound = silenced and "Weapon_USP.SilencedShot" or "Weapon_USP.Single"
	return BaseClass.PrimaryAttack(self)
end

function SWEP:SecondaryAttack()
	local silenced = not self:GetSilenced()
	self:SendWeaponAnim(silenced and ACT_VM_ATTACH_SILENCER or ACT_VM_DETACH_SILENCER)
	self:SetSilenced(silenced)

	local time = CurTime() + 3
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
	killicon.AddFont("weapon_usp", "css_sweps_killicons", "a", Color(255, 80, 0), 0.4)

	function SWEP:FireAnimationEvent(pos, ang, event, options)
		if self:GetSilenced() and event == 5001 or event == 5003 then
			return true
		end

		return BaseClass.FireAnimationEvent(self, pos, ang, event, options)
	end

	function SWEP:DrawWorldModel(flags)
		if self:GetSilenced() then self:SetModel("models/weapons/w_pist_usp_silencer.mdl") end
		self:DrawModel(flags)
	end
end

list.Add("NPCUsableWeapons", {class = "weapon_usp", title = SWEP.PrintName})