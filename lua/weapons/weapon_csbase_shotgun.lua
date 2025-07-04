SWEP.Base = "weapon_csbase"
DEFINE_BASECLASS("weapon_csbase")

function SWEP:SetupDataTables()
    self:NetworkVar("Float", 0, "ReloadTime")
end

function SWEP:Think()
    local owner = self:GetOwner()
    if not owner:IsValid() or not owner:IsPlayer() then return end

    local reloadtime = self:GetReloadTime()

    if reloadtime ~= 0 and reloadtime < CurTime() then
        if self:Clip1() < self:GetMaxClip1() and self:Ammo1() > 0 then
            self:SendWeaponAnim(ACT_VM_RELOAD)
            self:SetReloadTime(CurTime() + self:SequenceDuration())
            owner:RemoveAmmo(1, self:GetPrimaryAmmoType())
            self:SetClip1(self:Clip1() + 1)
        else
            self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
            self:SetNextPrimaryFire(CurTime() + self:SequenceDuration())
            self:SetReloadTime(0)
        end
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

    owner:SetAnimation(PLAYER_RELOAD)

    if self:Clip1() < self:GetMaxClip1() and self:Ammo1() > 0 and self:GetReloadTime() == 0 then
        self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)

        local time = CurTime() + self:SequenceDuration()
        self:SetNextPrimaryFire(time)
        self:SetReloadTime(time)
    end
end