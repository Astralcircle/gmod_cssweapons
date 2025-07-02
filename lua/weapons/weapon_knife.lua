SWEP.PrintName = "Knife"
SWEP.Category = "Counter-Strike: Source2"
SWEP.Spawnable = true
SWEP.ViewModel = "models/weapons/cstrike/c_knife_t.mdl"
SWEP.WorldModel = "models/weapons/w_knife_t.mdl"
SWEP.UseHands = true

function SWEP:Initialize()
    self:SetHoldType("knife")
end

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

function SWEP:DoHit(secondary)
    local owner = self:GetOwner()
    owner:LagCompensation(true)

    local eyepos = owner:EyePos()
    local aimvector = owner:GetAimVector()

    local trace = util.TraceLine({
        start = eyepos,
        endpos = eyepos + aimvector * 48,
        filter = owner
    })

    owner:LagCompensation(false)
    owner:SetAnimation(PLAYER_ATTACK1)

    if not trace.Hit then
        self:EmitSound("Weapon_Knife.Slash")
        self:SendWeaponAnim(ACT_VM_MISSCENTER)
    else
        local ent = trace.Entity

        local effect = EffectData()
        effect:SetEntity(ent)
        effect:SetOrigin(trace.HitPos)
        effect:SetStart(trace.StartPos)
        effect:SetSurfaceProp(trace.SurfaceProps)
        effect:SetHitBox(trace.HitBox)
        effect:SetDamageType(DMG_SLASH)
        util.Effect("Impact", effect, false)

        if IsValid(ent) then
            if ent:IsPlayer() or ent:IsNPC() then
                self:EmitSound(secondary and "Weapon_Knife.Stab" or "Weapon_Knife.Hit")
                self:SendWeaponAnim(secondary and ACT_VM_SECONDARYATTACK or ACT_VM_PRIMARYATTACK)
            else
                self:EmitSound("Weapon_Knife.HitWall")
                self:SendWeaponAnim(secondary and ACT_VM_SECONDARYATTACK or ACT_VM_PRIMARYATTACK)
            end

            if SERVER then
                local dmg = DamageInfo()
                dmg:SetDamage(secondary and 50 or 25)
                dmg:SetDamageType(DMG_SLASH)
                dmg:SetDamageForce(trace.Normal * 1000)
                dmg:SetDamagePosition(trace.HitPos)
                dmg:SetAttacker(owner)
                dmg:SetInflictor(ent)
                dmg:SetWeapon(self)
                ent:DispatchTraceAttack(dmg, trace)
            end
        else
            self:EmitSound("Weapon_Knife.HitWall")
            self:SendWeaponAnim(ACT_VM_MISSCENTER)
        end
    end

    if secondary then
        self:SetNextPrimaryFire(CurTime() + 1)
        self:SetNextSecondaryFire(CurTime() + 1)
    else
        self:SetNextPrimaryFire(CurTime() + 0.4)
        self:SetNextSecondaryFire(CurTime() + 0.4)
    end
end

function SWEP:PrimaryAttack()
    self:DoHit(false)
end

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.m_WeaponDeploySpeed = 1

function SWEP:SecondaryAttack()
    self:DoHit(true)
end