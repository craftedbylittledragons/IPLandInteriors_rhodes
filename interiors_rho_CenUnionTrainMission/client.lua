---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresIMAP()    -- RequestImap      
    if Config.Unknow == true then
        --RequestImap(___________________) -- Something relating to BizTemplate--## Central Union Train Mission ##-- CenUnionTrainMission
        RequestImap(2077623691)   -- Railroad -- Central Union Train Mission -- Track Bed - Full Legnth
        RequestImap(-555736180)   -- Railroad -- Central Union Train Mission -- Crossing 1818
        RequestImap(-693812694)   -- Railroad -- Central Union Train Mission -- Section 1 1875
        RequestImap(-1386614896)  -- Railroad -- Central Union Train Mission -- Section 2 Track at 2070
        RequestImap(2080640229)   -- Railroad -- Central Union Train Mission -- Section 3 2156
        RequestImap(-805522215)   -- Railroad -- Central Union Train Mission -- Section 4 2177
        RequestImap(499044444)    -- Railroad -- Central Union Train Mission -- Section 5
        RequestImap(-196117122)   -- Railroad -- Central Union Train Mission -- Section 6 2184
        RequestImap(-1022518533)  -- Railroad -- Central Union Train Mission -- Section 7 2201
        RequestImap(691955519)    -- Railroad -- Central Union Train Mission -- Section 8 with bridge 2203
        RequestImap(-142900294)   -- Railroad -- Central Union Train Mission -- Section 9 2229.82
    end      
end

function EnableResouresINTERIORS(x, y, z)  --- ActivateInteriorEntitySet
    local interior = GetInteriorAtCoords(x, y, z)  
    --[[ 
    --]]
    ActivateInteriorEntitySet(interior, "___________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "___________________")         
    end   

end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesIMAPS() --- RemoveImap 
    --RemoveImap(___________________) -- Something relating to BizTemplate    
    --## Central Union Train Mission ##-- CenUnionTrainMission
    RemoveImap(2077623691)   -- Railroad -- Central Union Train Mission -- Track Bed - Full Legnth
    RemoveImap(-555736180)   -- Railroad -- Central Union Train Mission -- Crossing 1818
    RemoveImap(-693812694)   -- Railroad -- Central Union Train Mission -- Section 1 1875
    RemoveImap(-1386614896)  -- Railroad -- Central Union Train Mission -- Section 2 Track at 2070
    RemoveImap(2080640229)   -- Railroad -- Central Union Train Mission -- Section 3 2156
    RemoveImap(-805522215)   -- Railroad -- Central Union Train Mission -- Section 4 2177
    RemoveImap(499044444)    -- Railroad -- Central Union Train Mission -- Section 5
    RemoveImap(-196117122)   -- Railroad -- Central Union Train Mission -- Section 6 2184
    RemoveImap(-1022518533)  -- Railroad -- Central Union Train Mission -- Section 7 2201
    RemoveImap(691955519)    -- Railroad -- Central Union Train Mission -- Section 8 with bridge 2203
    RemoveImap(-142900294)   -- Railroad -- Central Union Train Mission -- Section 9 2229.82    
end

function DisableResourcesINTERIORS(x, y, z)  --- DeactivateInteriorEntitySet
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "___________________")     
    DeactivateInteriorEntitySet(interior, "___________________")         
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

 