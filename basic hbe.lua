--//more than 5 on headsize will break characters collision on your client
--//meaning you'll see the players frozen, while they're moving
local headsize = 5
local disabled = true

local et = game:GetService('Players')
local etc = et.LocalPlayer

game:GetService('RunService').RenderStepped:Connect(function()
    if disabled then
        for _, player in next, et:GetPlayers() do
            if player.Name ~= etc.Name then
                pcall(function()
                    local charhead = player.Character and player.Character:FindFirstChild('Head')
                    if charhead then
                        charhead.Size = Vector3.new(headsize, headsize, headsize)
                        charhead.Transparency = 0.7
                        charhead.CanCollide = false
                    end
                end)
            end
        end
    end
end)
