---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 


----------- turn on the bar ------
function EnableResouresIMAP()  -- RequestImap  
    if Config.Unknow == true then
        --RequestImap(________________) -- Something relating to BizTemplate--## Rhodes ##-- 
        RequestImap(-2144587490)  -- Lemoyne -- Rhodes -- Cemetery -- Covers small plot hole with mound of dirt
        RequestImap(-1366431554)  -- Lemoyne -- Rhodes -- Cemetery -- Covers Large hole with grass patch
        RequestImap(-158824350)    -- Lemoyne -- Rhodes -- Cemetery -- Dirt in Small Plot (visually can't see it)
        ------------------------------------- Rhodes Cemetery
        RequestImap(-1366431554) -- Covers Large hole with grass patch
        RequestImap(-2144587490) -- Covers small plot hole with mound of dirt
        -- RequestImap(-158824350) -- Dirt in Small Plot (visually can't see it)
        -- RequestImap(146746575)
        -- RequestImap(-960136064)
        ------------------------------------- #### END OF RHODES CEMETERY ####
    end      
end

function EnableResouresINTERIORS(x, y, z)  --- ActivateInteriorEntitySet
    local interior = GetInteriorAtCoords(x, y, z)   
    --ActivateInteriorEntitySet(interior, "________________")       
    if Config.Unknow == true then  
        --ActivateInteriorEntitySet(interior, "________________")         
    end   

end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesIMAPS()  -- RemoveImap
    --RemoveImap(________________) -- Something relating to BizTemplate   --## Rhodes ##-- 
    RemoveImap(-2144587490)  -- Lemoyne -- Rhodes -- Cemetery -- Covers small plot hole with mound of dirt
    RemoveImap(-1366431554)  -- Lemoyne -- Rhodes -- Cemetery -- Covers Large hole with grass patch
    RemoveImap(-158824350)    -- Lemoyne -- Rhodes -- Cemetery -- Dirt in Small Plot (visually can't see it)
 
end

function DisableResourcesINTERIORS(x, y, z)  -- DeactivateInteriorEntitySet
    local interior = GetInteriorAtCoords(x, y, z)    
    --DeactivateInteriorEntitySet(interior, "________________")     
    --DeactivateInteriorEntitySet(interior, "________________")         
end    
 

----------- turn off the bar ------
function DisableResourcesIMAPS() 
    RemoveImap(-2083943324) -- New Hanover -- Valentine -- Keane's Saloon -- Debris Infront of Liqour
    RemoveImap(610256856) -- New Hanover -- Valentine -- Keane's Saloon -- Debris and Remodle next to Liqour 
    RemoveImap(666617953) -- Something relating to BizTemplate    
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
        DisableResourcesIMAPS() 
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
        DisableResourcesIMAPS() 
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
        DisableResourcesIMAPS() 
        DisableResourcesINTERIORS(Config.x, Config.y, Config.z)

        -- basically run once after character has loadded in  
        EnableResouresIMAP() 
        EnableResouresINTERIORS(Config.x, Config.y, Config.z)
        interiorsActive = true
        unlockDoors()  
    end
end)

 