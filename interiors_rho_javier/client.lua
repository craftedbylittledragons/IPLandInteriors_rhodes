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
    --## Javiers Tent ##-- 
	RequestImap(-347518940)    -- Campaign -- Javiers Tent -- Skull near Banjo
	RequestImap(-1887167048)   -- Campaign -- Javiers Tent -- Banjo
	RequestImap(530288130)     -- Campaign -- Javiers Tent -- Cushion Top near log
	RequestImap(1538837441)    -- Campaign -- Javiers Tent -- Fur seat for Log near Banjo
	RequestImap(-1999825729)   -- Campaign -- Javiers Tent -- Brown Cow Hide near Banjo
 
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
    --## Javiers Tent ##-- 
   RemoveImap(-347518940)    -- Campaign -- Javiers Tent -- Skull near Banjo
   RemoveImap(-1887167048)   -- Campaign -- Javiers Tent -- Banjo
   RemoveImap(530288130)     -- Campaign -- Javiers Tent -- Cushion Top near log
   RemoveImap(1538837441)    -- Campaign -- Javiers Tent -- Fur seat for Log near Banjo
   RemoveImap(-1999825729)   -- Campaign -- Javiers Tent -- Brown Cow Hide near Banjo

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

 