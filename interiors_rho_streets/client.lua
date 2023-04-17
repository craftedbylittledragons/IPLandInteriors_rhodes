---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresYMAPS()     --- RequestImap     
    if Config.Unknow == true then
        RequestImap(_________________) -- Something relating to BizTemplate
        RemoveImap(-759698431)    -- Lemoyne -- Rhodes -- Streets -- Fast Travel
        RemoveImap(945502524)     -- Lemoyne -- Rhodes -- Streets -- Stump Seat
        RemoveImap(1033721560)    -- Lemoyne -- Rhodes -- Streets -- Props (barrels, Cart, Crates, Fuit boxes)
        RemoveImap(1989074279)    -- Lemoyne -- Rhodes -- Streets -- Props (boxes & barrels)
    end      
    --## Hole Near Rhodes - Woman's Rights Mission Start ##--
    RemoveImap(1277540472) -- 1433 -1591 69
end

function EnableResouresINTERIORS(x, y, z)  -- ActivateInteriorEntitySet
    local interior = GetInteriorAtCoords(x, y, z)   
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesYMAPS()  --- RemoveImap
    RemoveImap(_________________) -- Something relating to BizTemplate    
    RemoveImap(-759698431)    -- Lemoyne -- Rhodes -- Streets -- Fast Travel
    RemoveImap(945502524)     -- Lemoyne -- Rhodes -- Streets -- Stump Seat
    RemoveImap(1033721560)    -- Lemoyne -- Rhodes -- Streets -- Props (barrels, Cart, Crates, Fuit boxes)
    RemoveImap(1989074279)    -- Lemoyne -- Rhodes -- Streets -- Props (boxes & barrels)
end

function DisableResourcesINTERIORS(x, y, z)  -- DeactivateInteriorEntitySet
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "_________________")     
    DeactivateInteriorEntitySet(interior, "_________________")         
end    
 
 
-----------------------------------------------------
---remove all on resource stop---
-----------------------------------------------------
AddEventHandler('onResourceStop', function(resource) 
    if resource == GetCurrentResourceName() then     
        -- when resource stops disable them, admin is restarting the script
        DisableResourcesYMAPS() 
        DisableResourcesINTERIORS(Config.x, Config.y, Config.z)
    end
end)

-----------------------------------------------------
--- clear all on resource start ---
-----------------------------------------------------
AddEventHandler('onResourceStart', function(resource) 
    if resource == GetCurrentResourceName() then         
        Citizen.Wait(3000)
        -- interiors loads all of these, so we need to disable them 
        DisableResourcesYMAPS() 
        DisableResourcesINTERIORS(Config.x, Config.y, Config.z)
        Citizen.Wait(3000)        
        -- because the character is already logged in on resource "re"start
        character_selected = true
    end
end)
 

-----------------------------------------------------
-- Trigger when character is selected
-----------------------------------------------------
RegisterNetEvent("vorp:SelectedCharacter") -- NPC loads after selecting character
AddEventHandler("vorp:SelectedCharacter", function(charid) 
	character_selected = true
end)
  
-----------------------------------------------------
-- Main thread that controls the script
-----------------------------------------------------
Citizen.CreateThread(function()
    while character_selected == false do 
        Citizen.Wait(1000)
    end 
    if character_selected == true and interiorsActive == false then 
        --- cleanup any previous scripts loading content
        DisableResourcesYMAPS() 
        DisableResourcesINTERIORS(Config.x, Config.y, Config.z)

        -- basically run once after character has loadded in  
        EnableResouresYMAPS() 
        EnableResouresINTERIORS(Config.x, Config.y, Config.z)
        interiorsActive = true
        unlockDoors()  
    end
end)

 