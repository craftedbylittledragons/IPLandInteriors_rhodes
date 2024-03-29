---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresYMAPS()         
    --------------------------------  Keane's Saloon 
    if Config.HayBales == true then
        RequestImap(-2083943324) --hay bales and boxes outside Keane's Saloon in valentine 
    end    
    if Config.Unknow == true then
        RequestImap(666617953) -- Something relating to BizTemplate
    end     
    if Config.Debris == true then 
        RequestImap(610256856) -- New Hanover -- Valentine -- Keane's Saloon -- Debris and Remodle next to Liqour
    end 
	--## Hosea ##-- 
	RequestImap(2728487)       -- Campaign -- Hosea -- Tent v1 Supplies 660 -1256 43
	RequestImap(1674800958)    -- Campaign -- Hosea -- Tent v2 Empty 660 -1256 43
	RequestImap(-782359587)    -- Campaign -- Hosea -- Tent v3 Patches
	RequestImap(510052409)     -- Campaign -- Hosea -- Tent v4 Opened at front only
	RequestImap(291770965)     -- Campaign -- Hosea -- Tent v5 closed
	RequestImap(-2143243848)   -- Campaign -- Hosea -- Tent v6 Open on front
	RequestImap(1209017192)    -- Campaign -- Hosea -- Tent v7 open front
	RequestImap(-644575724)    -- Campaign -- Hosea -- Tevt v8 closed
	RequestImap(1700661865)    -- Campaign -- Hosea -- Tent v9 Closed
	RequestImap(-2001921071)   -- Campaign -- Hosea -- Square Rug near round table top
	RequestImap(1210820782)    -- Campaign -- Hosea -- Barrel with Latntern    
end

function EnableResouresINTERIORS(x, y, z)  
    local interior = GetInteriorAtCoords(x, y, z)  
    --[[
        [29698] = {x=-241.58325195313,y=769.90649414063,z=117.54511260986,typeHashId=-565068911,typeHashName="val_saloon2_int",rpf="val_saloon2_int.rpf"},
        29698 	-565068911 	val_saloon2_int 	l_00260edcej   
    --]]
    ActivateInteriorEntitySet(interior, "val_saloon2_int")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "l_00260edcej")         
    end   

end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesYMAPS() 
	--## Hosea ##-- 
	RemoveImap(2728487)       -- Campaign -- Hosea -- Tent v1 Supplies 660 -1256 43
	RemoveImap(1674800958)    -- Campaign -- Hosea -- Tent v2 Empty 660 -1256 43
	RemoveImap(-782359587)    -- Campaign -- Hosea -- Tent v3 Patches
	RemoveImap(510052409)     -- Campaign -- Hosea -- Tent v4 Opened at front only
	RemoveImap(291770965)     -- Campaign -- Hosea -- Tent v5 closed
	RemoveImap(-2143243848)   -- Campaign -- Hosea -- Tent v6 Open on front
	RemoveImap(1209017192)    -- Campaign -- Hosea -- Tent v7 open front
	RemoveImap(-644575724)    -- Campaign -- Hosea -- Tevt v8 closed
	RemoveImap(1700661865)    -- Campaign -- Hosea -- Tent v9 Closed
	RemoveImap(-2001921071)   -- Campaign -- Hosea -- Square Rug near round table top
	RemoveImap(1210820782)    -- Campaign -- Hosea -- Barrel with Latntern 
end

function DisableResourcesINTERIORS(x, y, z)  
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "val_saloon2_int")     
    DeactivateInteriorEntitySet(interior, "l_00260edcej")         
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

 