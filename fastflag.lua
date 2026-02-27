-- ╔═══════════════════════════════════════════════════════════╗
-- ║  PERFECT FINAL GRAPHICS - Último ajuste                 ║
-- ║  Delta Executor Mobile                                   ║
-- ╚═══════════════════════════════════════════════════════════╝

local lighting = game:GetService("Lighting")
local workspace = game.Workspace

-- ═══════════════════════════════════════════════════════════
-- 🎨 CONFIGURAÇÃO PERFEITA
-- ═══════════════════════════════════════════════════════════

-- Remover Atmosphere
local atm = lighting:FindFirstChild("Atmosphere")
if atm then 
    atm:Destroy() 
end

lighting.GlobalShadows = false

-- ⚠️ ÚLTIMO AJUSTE
lighting.Brightness = 0.5  -- Era 0.6, agora 0.5 (1% menos)
lighting.Ambient = Color3.fromRGB(72, 62, 52)  -- Um pouco mais escuro
lighting.OutdoorAmbient = Color3.fromRGB(72, 62, 52)
lighting.ClockTime = 16

print("✓ Iluminação ajustada")

-- ═══════════════════════════════════════════════════════════
-- 🔦 DESABILITAR SOMBRAS
-- ═══════════════════════════════════════════════════════════

local function disableShadows(obj)
    for _, child in pairs(obj:GetChildren()) do
        if child:IsA("PointLight") or child:IsA("SpotLight") or child:IsA("SurfaceLight") then
            child.Shadows = false
            child.Brightness = child.Brightness * 0.5
        end
        disableShadows(child)
    end
end

disableShadows(workspace)
print("✓ Sombras removidas")

-- ═══════════════════════════════════════════════════════════
-- 🌈 BOOST CORES LEVE
-- ═══════════════════════════════════════════════════════════

local function naturalBoost(obj)
    for _, child in pairs(obj:GetChildren()) do
        if child:IsA("BasePart") then
            pcall(function()
                if child.Color then
                    local r, g, b = child.Color.R, child.Color.G, child.Color.B
                    local avgBrightness = (r + g + b) / 3
                    local factor = 1.05
                    
                    local newR = math.min(avgBrightness + (r - avgBrightness) * factor, 1)
                    local newG = math.min(avgBrightness + (g - avgBrightness) * factor, 1)
                    local newB = math.min(avgBrightness + (b - avgBrightness) * factor, 1)
                    
                    child.Color = Color3.new(newR, newG, newB)
                end
            end)
        end
        naturalBoost(child)
    end
end

naturalBoost(workspace)
print("✓ Cores ajustadas")

-- ═══════════════════════════════════════════════════════════
-- 🎪 REMOVER EFEITOS
-- ═══════════════════════════════════════════════════════════

for _, obj in pairs(lighting:GetChildren()) do
    if obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Fire") then
        obj.Enabled = false
    end
end

print("✓ Efeitos removidos")

-- ═══════════════════════════════════════════════════════════
-- ✅ PERFEITO
-- ═══════════════════════════════════════════════════════════

print("╔════════════════════════════════════════════╗")
print("║  ✨ PERFECT FINAL GRAPHICS ATIVADO         ║")
print("║  Ajuste exato - Pronto para jogar!         ║")
print("╚════════════════════════════════════════════╝")
