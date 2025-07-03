SWEP.PrintName = "Knife"
SWEP.Category = "Counter-Strike: Source"
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

    local trace = util.TraceLine({
        start = eyepos,
        endpos = eyepos + owner:GetAimVector() * 48,
        filter = owner
    })

    owner:LagCompensation(false)
    owner:SetAnimation(PLAYER_ATTACK1)

    if not trace.Hit then
        self:EmitSound("Weapon_Knife.Slash")
        self:SendWeaponAnim(ACT_VM_MISSCENTER)
    else
        local ent = trace.Entity

        if IsFirstTimePredicted() then
            local effect = EffectData()
            effect:SetEntity(ent)
            effect:SetOrigin(trace.HitPos)
            effect:SetStart(trace.StartPos)
            effect:SetSurfaceProp(trace.SurfaceProps)
            effect:SetHitBox(trace.HitBox)
            effect:SetDamageType(DMG_SLASH)
            util.Effect("Impact", effect, false)
        end

        if IsValid(ent) then
            local damage = secondary and 65 or 20

            if ent:IsPlayer() or ent:IsNPC() then
                self:EmitSound(secondary and "Weapon_Knife.Stab" or "Weapon_Knife.Hit")
                self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

                if secondary and SERVER then
                    local eyeangles = owner:EyeAngles()
                    eyeangles.p = 0

                    local eyeangles2 = ent:EyeAngles()
                    eyeangles2.p = 0

                    if eyeangles:Forward():Dot(eyeangles2:Forward()) >= 0.7 then
                        damage = damage * 3
                    end
                end
            else
                self:EmitSound("Weapon_Knife.HitWall")
                self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
            end

            if SERVER then
                local dmg = DamageInfo()
                dmg:SetDamage(damage)
                dmg:SetDamageType(DMG_CLUB)
                dmg:SetDamageForce(trace.Normal * 10000)
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

    local time = CurTime() + (secondary and 1 or 0.4)
    self:SetNextPrimaryFire(time)
    self:SetNextSecondaryFire(time)
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