---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 


----------- turn on the bar ------
function EnableResouresYMAPS()  -- RequestImap  
    --[[
    if Config.Unknow == true then
        --RequestImap(________________) -- Something relating to BizTemplate
        -- Rhodes Camp --     
    end 
    --]]   
    if Config.Camp == true then 
        RequestImap(-159557995)    -- Lemoyne -- Rhodes Camp -- Two Tents, Wagon, Chairs
        RequestImap(1313890873)    -- Lemoyne -- Rhodes Camp -- Small Camp in the Woods Just North of Dutch's Rhodes Base
    end      
end

function EnableResouresINTERIORS(x, y, z)  --- ActivateInteriorEntitySet
    --[[
    local interior = GetInteriorAtCoords(x, y, z)        
    if Config.Unknow == true then  
        --ActivateInteriorEntitySet(interior, "________________")         
    end   
	ActivateInteriorEntitySets(69122, "Trelawny caravan", {
		"rho_slum_player_trelawny01_stage_01"
	})

    --]]   
end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesYMAPS()  -- RemoveImap
    --[[
    --RemoveImap(________________) -- Something relating to BizTemplate    
    --]]   
    -- Rhodes Camp --
    RemoveImap(-159557995)    -- Lemoyne -- Rhodes Camp -- Two Tents, Wagon, Chairs
    RemoveImap(1313890873)    -- Lemoyne -- Rhodes Camp -- Small Camp in the Woods Just North of Dutch's Rhodes Base    
end

function DisableResourcesINTERIORS(x, y, z)  -- DeactivateInteriorEntitySet
    --[[
    local interior = GetInteriorAtCoords(x, y, z)    
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

 