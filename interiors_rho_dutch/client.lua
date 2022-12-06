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
	--## Dutchs tent ##-- 
	RequestImap(-109425099)    -- Campaign -- Dutchs tent -- Tent v1 Empty Open Both ends
	RequestImap(539843907)     -- Campaign -- Dutchs tent -- Tent v2 Empty Right Side Opened
	RequestImap(180356041)     -- Campaign -- Dutchs tent -- Tent v3 Opened Both Ends
	RequestImap(-71508135)     -- Campaign -- Dutchs tent -- Tent v4 Flaps Closed
	RequestImap(40009123)      -- Campaign -- Dutchs tent -- Tent v5 Flaps Closed
	RequestImap(1070723367)    -- Campaign -- Dutchs tent -- Tent v6 Flaps Closed
	RequestImap(-146943962)    -- Campaign -- Dutchs tent -- Tent v7 Open both ends
	RequestImap(1261237250)    -- Campaign -- Dutchs tent -- Tent v8 open front
	RequestImap(-692521236)    -- Campaign -- Dutchs tent -- Tent v9 open on back
	RequestImap(1049842342)    -- Campaign -- Dutchs tent -- Inside Tent Bear Rug Stove Books Barrels and Canopy 
	RequestImap(1034009086)    -- Campaign -- Dutchs tent -- Inside  Tent Boxes, Stove Lanturn, Canopy
	RequestImap(-160392273)    -- Campaign -- Dutchs tent -- Tent Inside Music Box Canopy
	RequestImap(2119205605)    -- Campaign -- Dutchs tent -- Cash Box behind Dutchs Tent 1
	RequestImap(-619637948)    -- Campaign -- Dutchs tent -- Cash box behind Dutchs tent 2
	RequestImap(-1639921686)   -- Campaign -- Dutchs tent -- Tent Flap    
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
	--## Dutchs tent ##-- 
	RemoveImap(-109425099)    -- Campaign -- Dutchs tent -- Tent v1 Empty Open Both ends
	RemoveImap(539843907)     -- Campaign -- Dutchs tent -- Tent v2 Empty Right Side Opened
	RemoveImap(180356041)     -- Campaign -- Dutchs tent -- Tent v3 Opened Both Ends
	RemoveImap(-71508135)     -- Campaign -- Dutchs tent -- Tent v4 Flaps Closed
	RemoveImap(40009123)      -- Campaign -- Dutchs tent -- Tent v5 Flaps Closed
	RemoveImap(1070723367)    -- Campaign -- Dutchs tent -- Tent v6 Flaps Closed
	RemoveImap(-146943962)    -- Campaign -- Dutchs tent -- Tent v7 Open both ends
	RemoveImap(1261237250)    -- Campaign -- Dutchs tent -- Tent v8 open front
	RemoveImap(-692521236)    -- Campaign -- Dutchs tent -- Tent v9 open on back
	RemoveImap(1049842342)    -- Campaign -- Dutchs tent -- Inside Tent Bear Rug Stove Books Barrels and Canopy 
	RemoveImap(1034009086)    -- Campaign -- Dutchs tent -- Inside  Tent Boxes, Stove Lanturn, Canopy
	RemoveImap(-160392273)    -- Campaign -- Dutchs tent -- Tent Inside Music Box Canopy
	RemoveImap(2119205605)    -- Campaign -- Dutchs tent -- Cash Box behind Dutchs Tent 1
	RemoveImap(-619637948)    -- Campaign -- Dutchs tent -- Cash box behind Dutchs tent 2
	RemoveImap(-1639921686)   -- Campaign -- Dutchs tent -- Tent Flap
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

 