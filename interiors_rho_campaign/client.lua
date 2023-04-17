---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on ------
function EnableResouresYMAPS()            
    --[[
    if Config.Unknow == true then
        RequestImap(666617953) -- Something relating to BizTemplate
    end 
    --]]    
    if Config.BackWagons == true then 
        --## Back Wagons ##-- 
        RequestImap(1084869405)    -- Campaign -- Back Wagons -- Two Wagons v1 Supplies 674 -1267 43
        RequestImap(1636281938)    -- Campaign -- Back Wagons -- Two Wagons v2 Empty 674 -1267 43
        RequestImap(-1642249622)   -- Campaign -- Back Wagons -- Two wagons v3 empty Canopy
    end  
    --## Rhodes Story Campaign ##--     
    if Config.Camp == true then
        RequestImap(1802272784)    -- Campaign -- Base -- Camp Extras (MUST LOAD FOR NORMAL SETUP)
        RequestImap(2108368013)    -- Campaign -- Base -- Tent frames for Dutch, Hosea and Arthurs Bed (Must Load for Normal Setup)
        if Config.CampVer == 1 then        
            RequestImap(1402472902)    -- Campaign -- Base -- Setting Up Camp v1
        elseif Config.CampVer == 2 then     
            RequestImap(-1458944281)   -- Campaign -- Base -- Setting Up Camp v2
        end 
    end    
    if Config.Barrels == true then
        RequestImap(1691578074)    -- Campaign -- Base -- Log Fire Pit Trash Broken Barrels
        RequestImap(810684093)     -- Campaign -- Base -- Blue Trash Barrels on Beach 
        RequestImap(-385999832)    -- Campaign -- Base -- Blue Trash Barrels on Beach
    end    
    if Config.BeachTable == true then
        RequestImap(321594819)     -- Campaign -- Base -- Broken Table on Beach
    end     
    if Config.BarrelTable == true then
        RequestImap(-809371454)    -- Campaign -- Base -- Small barrel and table to Banjo
    end     
    if Config.ShootGallery == true then
        RequestImap(-1656481590)   -- Campaign -- Base -- Target Shooting on Beach (Missing what hanging targets are tied to)
    end    
    if Config.RoundTable == true then
        RequestImap(1706275010)    -- Campaign -- Base -- Round Table
        RequestImap(-792944828)    -- Campaign -- Base -- Round Table Top
        RequestImap(-1836870707)   -- Campaign -- Base -- Round Table Seats no light
    end    
    if Config.SeatwtihLights == 1 then
        RequestImap(1290371072)    -- Campaign -- Base -- Seats and light for round table        
    elseif Config.SeatwtihLights == 2 then
        RequestImap(-1836870707)   -- Campaign -- Base -- Round Table Seats no light
    end    

    if Config.Campfire == true then
        RequestImap(-1880340209)   -- Campaign -- Base -- Camp Fire, 3 stools, 2 sleeping bags beside Arthurs site
    end    
    if Config.ChickenCoop == true then
        RequestImap(-2000080725)   -- Campaign -- Base -- Chicken Coop
    end     
    if Config.Antlers == true then
        RequestImap(-989202374)    -- Campaign -- Base -- Antlers on Big Center Tree
    end      
    if Config.Chest == true then
        RequestImap(-1247551347)   -- Campaign -- Base -- Broken Chest
    end    
    if Config.LeanToos == true then
        RequestImap(1717489303)    -- Campaign -- Base -- Three Lean Tos
        if Config.LTSupplies == true then
            RequestImap(-1010466481)   -- Campaign -- Base -- Supplies in Lean Tos
        end    
    end    
    if Config.LanternGame == true then
        RequestImap(1692451176)    -- Campaign -- Base -- Lantern Game Table on a Post
        RequestImap(220566669)     -- Campaign -- Base -- Lantern Game Table
        if Config.Chairs == true then
            RequestImap(719147410)     -- Campaign -- Base -- Blue Chair and Stool for gaming table
        end    
    end    
    if Config.Rugs == true then
        RequestImap(-1045282549)   -- Campaign -- Base -- White Animal Skin Rugs near sitting rock
    end    
    if Config.FirePit == true then
        RequestImap(2123887232)    -- Campaign -- Base -- Fire pit near white skins
    end     
    if Config.Papers == true then
        RequestImap(-436009554)    -- Campaign -- Base -- Piece of Paper near Banjo
        RequestImap(1997423854)    -- Campaign -- Base -- Map near Paper
    end    
    if Config.DreamCatcher == true then
        RequestImap(157361403)     -- Campaign -- Base -- Large Dream Catcher
    end    
    if Config.Fishing == true then
        RequestImap(-814821283)    -- Campaign -- Base -- Fishing Stuff
    end     
end

function EnableResouresINTERIORS(x, y, z)  
    local interior = GetInteriorAtCoords(x, y, z)  
    --[[  
    ActivateInteriorEntitySet(interior, "________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "________________")         
    end   
    --]]

end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesYMAPS() 
	--## Back Wagons ##-- 
	RemoveImap(1084869405)    -- Campaign -- Back Wagons -- Two Wagons v1 Supplies 674 -1267 43
	RemoveImap(1636281938)    -- Campaign -- Back Wagons -- Two Wagons v2 Empty 674 -1267 43
	RemoveImap(-1642249622)   -- Campaign -- Back Wagons -- Two wagons v3 empty Canopy
    --## Rhodes Story Campaign ##--    
    --## Base ##--
    RemoveImap(1802272784)    -- Campaign -- Base -- Camp Extras (MUST LOAD FOR NORMAL SETUP)
    RemoveImap(2108368013)    -- Campaign -- Base -- Tent frames for Dutch, Hosea and Arthurs Bed (Must Load for Normal Setup)
    RemoveImap(1402472902)    -- Campaign -- Base -- Setting Up Camp v1
    RemoveImap(-1458944281)   -- Campaign -- Base -- Setting Up Camp v2
    RemoveImap(1691578074)    -- Campaign -- Base -- Log Fire Pit Trash Broken Barrels
    RemoveImap(810684093)     -- Campaign -- Base -- Blue Trash Barrels on Beach
    RemoveImap(321594819)     -- Campaign -- Base -- Broken Table on Beach
    RemoveImap(-385999832)    -- Campaign -- Base -- Blue Trash Barrels on Beach
    RemoveImap(-1656481590)   -- Campaign -- Base -- Target Shooting on Beach (Missing what hanging targets are tied to)
    RemoveImap(1706275010)    -- Campaign -- Base -- Round Table
    RemoveImap(-792944828)    -- Campaign -- Base -- Round Table Top
    RemoveImap(-1836870707)   -- Campaign -- Base -- Round Table Seats no light
    RemoveImap(1290371072)    -- Campaign -- Base -- Seats and light for round table
    RemoveImap(-1880340209)   -- Campaign -- Base -- Camp Fire, 3 stools, 2 sleeping bags beside Arthurs site
    RemoveImap(-2000080725)   -- Campaign -- Base -- Chicken Coop
    RemoveImap(719147410)     -- Campaign -- Base -- Blue Chair and Stool for gaming table
    RemoveImap(-989202374)    -- Campaign -- Base -- Antlers on Big Center Tree
    RemoveImap(-1010466481)   -- Campaign -- Base -- Supplies in Lean Tos
    RemoveImap(-1247551347)   -- Campaign -- Base -- Broken Chest
    RemoveImap(1717489303)    -- Campaign -- Base -- Three Lean Tos
    RemoveImap(1692451176)    -- Campaign -- Base -- Lantern Game Table on a Post
    RemoveImap(220566669)     -- Campaign -- Base -- Lantern Game Table
    RemoveImap(-1045282549)   -- Campaign -- Base -- White Animal Skin Rugs near sitting rock
    RemoveImap(2123887232)    -- Campaign -- Base -- Fire pit near white skins
    RemoveImap(-809371454)    -- Campaign -- Base -- Small barrel and table to Banjo
    RemoveImap(-436009554)    -- Campaign -- Base -- Piece of Paper near Banjo
    RemoveImap(1997423854)    -- Campaign -- Base -- Map near Paper
    RemoveImap(157361403)     -- Campaign -- Base -- Large Dream Catcher
    RemoveImap(-814821283)    -- Campaign -- Base -- Fishing Stuff
    
end

function DisableResourcesINTERIORS(x, y, z)  
    --[[  
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "________________")     
    DeactivateInteriorEntitySet(interior, "________________")   
    --]]      
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

 