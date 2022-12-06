---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresIMAP()    -- RequestImap      
    --[[
    if Config.Unknow == true then
        RequestImap(___________________) -- Something relating to BizTemplate
    end 
    --]]  
    --## Grey Estates ##--
    if Config.Barn == true then  
        RequestImap(-677977650)   -- Lemoyne -- Caliga Hall -- Grey Estates -- Normal Barn Frame
        RequestImap(702350293)    -- Lemoyne -- Caliga Hall -- Grey Estates -- Barn Interior
    end   
    if Config.Plants == true then  
        RequestImap(1426715569)   -- Lemoyne -- Caliga Hall -- Grey Estates -- Adds Field Props
        RequestImap(26815048)     -- Lemoyne -- Caliga Hall -- Grey Estates -- Normal Fields
        RequestImap(-1229109520)  -- Lemoyne -- Caliga Hall -- Grey Estates -- Green Plants
    end     
    if Config.Fire == true then  
        RequestImap(1284656212)    -- Lemoyne -- Caliga Hall -- Grey Estates -- Burning Structure 
        RequestImap(-1162161651)   -- Lemoyne -- Caliga Hall -- Grey Estates -- Fields on fire
    end  
    if Config.BurnedBarn == true then  
        RequestImap(419559004)     -- Lemoyne -- Caliga Hall -- Grey Estates -- Burnt Barn Frame 1 
    end   
    if Config.BurnedPlants == true then  
        RequestImap(557212279)     -- Lemoyne -- Caliga Hall -- Grey Estates -- Burnt Plants
        RequestImap(1786931635)    -- Lemoyne -- Caliga Hall -- Grey Estates -- Burnt out fields
    end       
end

function EnableResouresINTERIORS(x, y, z)  --- ActivateInteriorEntitySet
    local interior = GetInteriorAtCoords(x, y, z)  
    --[[  
    ActivateInteriorEntitySet(interior, "___________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "___________________")         
    end   
    --]]

end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesIMAPS() --- RemoveImap 
    --[[  
    RemoveImap(___________________) -- Something relating to BizTemplate    
    --]]
    --## Grey Estates ##--
    RemoveImap(-677977650)   -- Lemoyne -- Caliga Hall -- Grey Estates -- Normal Barn Frame
    RemoveImap(702350293)    -- Lemoyne -- Caliga Hall -- Grey Estates -- Barn Interior
    RemoveImap(1426715569)   -- Lemoyne -- Caliga Hall -- Grey Estates -- Adds Field Props
    RemoveImap(26815048)     -- Lemoyne -- Caliga Hall -- Grey Estates -- Normal Fields
    RemoveImap(-1229109520)  -- Lemoyne -- Caliga Hall -- Grey Estates -- Green Plants
    RemoveImap(419559004)     -- Lemoyne -- Caliga Hall -- Grey Estates -- Burnt Barn Frame 1
    RemoveImap(1284656212)    -- Lemoyne -- Caliga Hall -- Grey Estates -- Burning Structure
    RemoveImap(-1162161651)   -- Lemoyne -- Caliga Hall -- Grey Estates -- Fields on fire
    RemoveImap(557212279)     -- Lemoyne -- Caliga Hall -- Grey Estates -- Burnt Plants
    RemoveImap(1786931635)    -- Lemoyne -- Caliga Hall -- Grey Estates -- Burnt out fields
    --#### End of Lemoyne ####--
end

function DisableResourcesINTERIORS(x, y, z)  --- DeactivateInteriorEntitySet
    --[[  
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "___________________")      
    --]]      
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

 