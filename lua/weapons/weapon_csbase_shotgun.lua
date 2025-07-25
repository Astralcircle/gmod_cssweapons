AddCSLuaFile()

DEFINE_BASECLASS("weapon_csbase")

function SWEP:SetupDataTables()
	self:NetworkVar("Float", 0, "ReloadTime")
end

function SWEP:Think()
	local reloadtime = self:GetReloadTime()
	if reloadtime == 0 or reloadtime > CurTime() then return end

	if self:Clip1() < self:GetMaxClip1() and self:Ammo1() > 0 then
		self:SendWeaponAnim(ACT_VM_RELOAD)
		self:SetReloadTime(CurTime() + 0.5)
		self:GetOwner():RemoveAmmo(1, self:GetPrimaryAmmoType())
		self:SetClip1(self:Clip1() + 1)
	else
		self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
		self:SetReloadTime(0)
	end
end

function SWEP:Deploy()
	self:SetReloadTime(0)
	return BaseClass.Deploy(self)
end

function SWEP:PrimaryAttack()
	self:SetReloadTime(0)
	return BaseClass.PrimaryAttack(self)
end

function SWEP:Reload()
	local owner = self:GetOwner()

	if owner:IsNPC() then
		self:DefaultReload(ACT_VM_RELOAD)
		return
	end

	if self:GetNextPrimaryFire() <= CurTime() and self:Clip1() < self:GetMaxClip1() and self:Ammo1() > 0 and self:GetReloadTime() == 0 then
		self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)
		owner:SetAnimation(PLAYER_RELOAD)

		local time = CurTime() + 0.5
		self:SetNextPrimaryFire(time)
		self:SetReloadTime(time)
	end
end