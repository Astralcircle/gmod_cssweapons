AddCSLuaFile()

DEFINE_BASECLASS("weapon_csbase")
SWEP.Spawnable = true

SWEP.PrintName = "Glock-18"
SWEP.Category = "Counter-Strike: Source"
SWEP.IconSymbol = "c"
SWEP.Slot = 1

SWEP.ViewModel = "models/weapons/cstrike/c_pist_glock18.mdl"
SWEP.WorldModel = "models/weapons/w_pist_glock18.mdl"
SWEP.HoldType = "pistol"

SWEP.Primary.Sound = "Weapon_Glock.Single"
SWEP.Primary.Damage = 25
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.15
SWEP.Primary.ClipSize = 20
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Pistol"

SWEP.Primary.Cone = 0.0167
SWEP.Primary.Recoil = {MinAng = Angle(0.45, -0.15, 0), MaxAng = Angle(0.5, 0.15, 0)}
SWEP.NPCBurstData = {Min = 1, Max = 1, Delay = SWEP.Primary.Delay}

function SWEP:SetupDataTables()
	self:NetworkVar("Bool", 0, "BurstMode")
	self:NetworkVar("Int", 0, "BurstShotsRemaining")
end

function SWEP:PrimaryAttack()
	if self:GetBurstMode() then
		self.Primary.Delay = 0.06
		self:SetBurstShotsRemaining(2)
	else
		self.Primary.Delay = 0.15
	end

	BaseClass.PrimaryAttack(self)
end

function SWEP:Think()
	if self:GetBurstMode() then
		local shotsremaining = self:GetBurstShotsRemaining()

		if shotsremaining > 0 and self:GetNextPrimaryFire() <= CurTime() then
			shotsremaining = shotsremaining - 1
			self:SetBurstShotsRemaining(shotsremaining)
			BaseClass.PrimaryAttack(self)

			if shotsremaining == 0 then
				self:SetNextPrimaryFire(CurTime() + 0.38)
			end
		end
	end
end

function SWEP:Deploy()
	self:SetBurstShotsRemaining(0)
	return BaseClass.Deploy(self)
end

function SWEP:Reload()
	self:SetBurstShotsRemaining(0)
	return BaseClass.Reload(self)
end

function SWEP:SecondaryAttack()
	self:EmitSound("weapons/smg1/switch_single.wav")
	self:SetBurstMode(not self:GetBurstMode())
end

if CLIENT then
	killicon.AddFont("weapon_glock", "css_sweps_killicons", "c", Color(255, 80, 0), 0.5)
end

list.Add("NPCUsableWeapons", {class = "weapon_glock", title = SWEP.PrintName})