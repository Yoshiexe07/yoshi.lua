local Admins = {"FakeNameHereSoNoStalkers"}

function Kill(Players)
    for i,Player in ipairs(Players) do
        if Player.Character then
            Player.Character:BreakJoints()
        end
    end
end

function IsAdmin(Player)
    for i,AdminName in ipairs(Admins) do
        if Player.Name:lower() == AdminName:lower() then return true end
    end
    return false
end

function GetPlayers(Player,Msg)
    local Targets = {}
    local Players = Game.Players:GetPlayers()

    if Msg:lower() == "me" then
        Targets = { Player }
    elseif Msg:lower() == "all" then
        Targets = Players
    elseif Msg:lower() == "others" then
        for i,Plr in ipairs(Players) do
            if Plr ~= Player then
                table.insert(Targets,Plr)
            end
        end
    else
        for i,Plr in ipairs(Players) do
            if Plr.Name:lower():sub(1,Msg:len()) == Msg then
                table.insert(Targets,Plr)
            end
        end
    end
    return Targets
end

Game.Players.PlayerAdded:connect(function(Player)
    if IsAdmin(Player) then
        Player.Chatted:connect(function(Msg)
            if Msg:lower():sub(1,6) == ":kill " then
                Kill(GetPlayers(Player,Msg:sub(7)))
            end
        end)
    end
end)
