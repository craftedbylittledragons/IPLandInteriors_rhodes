---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresIMAP()         
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
    --## Bills Sleeping Area ##-- 
	RequestImap(-1292493167)   -- Campaign -- Bills Sleeping Area -- Rope and Boxes near Dream Catcher
	RequestImap(-1451784475)   -- Campaign -- Bills Sleeping Area -- v1 Canopy inbetween bucket and blue chairs
	RequestImap(1028224932)    -- Campaign -- Bills Sleeping Area -- v2 Canopy inbetween bucket and blue chairs
	RequestImap(1128417383)    -- Campaign -- Bills Sleeping Area -- v3 Canopy with Candle
	RequestImap(292845400)     -- Campaign -- Bills Sleeping Area -- Skull and bucket Near Rope and Boxes
	RequestImap(1609975546)    -- Campaign -- Bills Sleeping Area -- Crates and Gun Table
	RequestImap(-948006506)    -- Campaign -- Bills Sleeping Area -- Blue Towel Dynamite
	RequestImap(1700045179)    -- Campaign -- Bills Sleeping Area -- Dynamite
	RequestImap(-1045678888)   -- Campaign -- Bills Sleeping Area -- Small Tables
	RequestImap(-1663177928)   -- Campaign -- Bills Sleeping Area -- Lure Kit
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
function DisableResourcesIMAPS() 
	--## Bills Sleeping Area ##-- 
	RemoveImap(-1292493167)   -- Campaign -- Bills Sleeping Area -- Rope and Boxes near Dream Catcher
	RemoveImap(-1451784475)   -- Campaign -- Bills Sleeping Area -- v1 Canopy inbetween bucket and blue chairs
	RemoveImap(1028224932)    -- Campaign -- Bills Sleeping Area -- v2 Canopy inbetween bucket and blue chairs
	RemoveImap(1128417383)    -- Campaign -- Bills Sleeping Area -- v3 Canopy with Candle
	RemoveImap(292845400)     -- Campaign -- Bills Sleeping Area -- Skull and bucket Near Rope and Boxes
	RemoveImap(1609975546)    -- Campaign -- Bills Sleeping Area -- Crates and Gun Table
	RemoveImap(-948006506)    -- Campaign -- Bills Sleeping Area -- Blue Towel Dynamite
	RemoveImap(1700045179)    -- Campaign -- Bills Sleeping Area -- Dynamite
	RemoveImap(-1045678888)   -- Campaign -- Bills Sleeping Area -- Small Tables
	RemoveImap(-1663177928)   -- Campaign -- Bills Sleeping Area -- Lure Kit   
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

 