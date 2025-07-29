AddCSLuaFile()

DEFINE_BASECLASS("weapon_csbase")
SWEP.ScopeZoom = {}

function SWEP:SetupDataTables()
	self:NetworkVar("Int", 0, "ScopeIndex")
end

function SWEP:SecondaryAttack()
	local index = self:GetScopeIndex() + 1
	local scale = self.ScopeZoom[index]

	if scale then
		self:SetScopeIndex(index)
	else
		self:SetScopeIndex(0)
	end

	if self.UseScope then
		self:EmitSound("Default.Zoom")
	end
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
		return self:GetOwner():GetFOV() / fov_desired:GetFloat()
	end

	function SWEP:PreDrawViewModel()
		return self:GetScopeIndex() ~= 0 and self.UseScope
	end

	local scope = Material("gmod/scope")

	function SWEP:DoDrawCrosshair(x, y)
		if self:GetScopeIndex() > 0 and self.UseScope then
			local scrw, scrh = ScrW(), ScrH()
			local midx, midy = scrw * 0.5, scrh * 0.5

			surface.SetMaterial(scope)
			surface.SetDrawColor(0, 0, 0)
			surface.DrawLine(0, midy, scrw, midy)
			surface.DrawLine(midx, 0, midx, scrh)

			local w = (4 / 3) * scrh
			local dw = (scrw - w) * 0.5

			surface.DrawRect(0, 0, dw, scrh)
			surface.DrawRect(w + dw, 0, dw, scrh)
			surface.DrawTexturedRect(dw, 0, w, scrh)

			return true
		end
	end
end
