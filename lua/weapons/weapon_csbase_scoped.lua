AddCSLuaFile()

DEFINE_BASECLASS("weapon_csbase")
SWEP.ScopeZoom = {}

function SWEP:SetupDataTables()
	self:NetworkVar("Int", 0, "ScopeIndex")
end

function SWEP:SecondaryAttack()
	local owner = self:GetOwner()
	local index = self:GetScopeIndex() + 1
	local scale = self.ScopeZoom[index]

	if scale then
		self:SetScopeIndex(index)
	else
		self:SetScopeIndex(0)
	end

	self:EmitSound("Default.Zoom")
end

function SWEP:Deploy()
	self:SetScopeIndex(0)
	return BaseClass.Deploy(self)
end

function SWEP:Reload()
	self:SetScopeIndex(0)
	return BaseClass.Reload(self)
end

function SWEP:TranslateFOV(fov)
	return fov / (self.ScopeZoom[self:GetScopeIndex()] or 1)
end

if CLIENT then
	local fov_desired = GetConVar("fov_desired")

	function SWEP:AdjustMouseSensitivity()
		local owner = self:GetOwner()
		return owner:GetFOV() / fov_desired:GetFloat()
	end

	function SWEP:PreDrawViewModel()
		return self:GetScopeIndex() ~= 0 and self.UseScope
	end

	local scope = Material("gmod/scope")

	function SWEP:DoDrawCrosshair(x, y)
		if self:GetScopeIndex() > 0 and self.UseScope then
			local screenW = ScrW()
			local screenH = ScrH()

			local h = screenH
			local w = (4 / 3) * h

			local dw = (screenW - w) * 0.5

			local midX = screenW * 0.5
			local midY = screenH * 0.5

			surface.SetMaterial(scope)
			surface.SetDrawColor(0, 0, 0)

			surface.DrawLine(0, midY, screenW, midY)
			surface.DrawLine(midX, 0, midX, screenH)

			surface.DrawRect(0, 0, dw, h)
			surface.DrawRect(w + dw, 0, dw, h)

			surface.DrawTexturedRect(dw, 0, w, h)
			return true
		end
	end
end