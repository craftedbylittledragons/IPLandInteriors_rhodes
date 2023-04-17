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

    --## Pearsons Wagon ##--
    RequestImap(764763647)     -- Campaign -- Pearsons Wagon -- Provisions Wagon v1
    RequestImap(1742990618)    -- Campaign -- Pearsons Wagon -- Provisions Wagon v2
    RequestImap(-751959361)    -- Campaign -- Pearsons Wagon -- Provisons Wagon v3
    RequestImap(-1279618207)   -- Campaign -- Pearsons Wagon -- Provisions Wagon v4 Empty
    RequestImap(-492479795)    -- Campaign -- Pearsons Wagon -- Skull Provisions Wagon
    RequestImap(-320577790)    -- Campaign -- Pearsons Wagon -- Barrel with Lantern
    RequestImap(1246210400)    -- Campaign -- Pearsons Wagon -- Provision Boxes Large
    RequestImap(-172246728)    -- Campaign -- Pearsons Wagon -- Table - Cutting Board - Barrel of Salt v1
    RequestImap(-850189983)    -- Campaign -- Pearsons Wagon -- Table - Cutting Board - Barrel of Salt v2
    RequestImap(126970802)     -- Campaign -- Pearsons Wagon -- Two Boxes Provisions
    RequestImap(715730031)     -- Campaign -- Pearsons Wagon -- Pans and Blue Table Cloth for Table v1
    RequestImap(349896400)     -- Campaign -- Pearsons Wagon -- Pans and Table Cloth for Table v2
    RequestImap(110400393)     -- Campaign -- Pearsons Wagon -- Provisions, keg, rope for Table v1 (will work with v2 as well but clips)
    RequestImap(482931525)     -- Campaign -- Pearsons Wagon -- Provisions, Fruits, Milk, red cloth
    RequestImap(-1291679096)   -- Campaign -- Pearsons Wagon -- Potato Bags for Wagon v3
    RequestImap(-387018143)    -- Campaign -- Pearsons Wagon -- Two Barrels
    RequestImap(5585502)       -- Campaign -- Pearsons Wagon -- Red Cloth v2 watermelons, pumpkins flour
    RequestImap(1309652195)    -- Campaign -- Pearsons Wagon -- Water and Dishes
    RequestImap(-112364237)    -- Campaign -- Pearsons Wagon -- Ammo Tools
    RequestImap(-1983416665)   -- Campaign -- Pearsons Wagon -- Spilled Flour
    RequestImap(438624963)     -- Campaign -- Pearsons Wagon -- Supplies
    RequestImap(82769080)      -- Campaign -- Pearsons Wagon -- Plate and Spilled Flour
    RequestImap(1125807846)    -- Campaign -- Pearsons Wagon -- Bag of Flour
    RequestImap(-1894946791)   -- Campaign -- Pearsons Wagon -- Plate
    RequestImap(-1362716862)   -- Campaign -- Pearsons Wagon -- red cloth v3 provisions
    RequestImap(-624219879)    -- Campaign -- Pearsons Wagon -- Pans open can ammo for v1 table
    RequestImap(977061573)     -- Campaign -- Pearsons Wagon -- Pans open can ammo for v2 table
    RequestImap(1729014506)    -- Campaign -- Pearsons Wagon -- Provisions for table v1
    RequestImap(-916538063)    -- Campaign -- Pearsons Wagon -- Provisions for table v2
    RequestImap(1886481528)    -- Campaign -- Pearsons Wagon -- Spilled flour
    RequestImap(-1507376753)   -- Campaign -- Pearsons Wagon -- Bag of Flour
    RequestImap(-1370620659)   -- Campaign -- Pearsons Wagon -- Pans for table v1
    RequestImap(1074130180)    -- Campaign -- Pearsons Wagon -- Pans for table v2
    RequestImap(652735549)     -- Campaign -- Pearsons Wagon -- Provisions for table v1    
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
    --## Pearsons Wagon ##--
    RemoveImap(764763647)     -- Campaign -- Pearsons Wagon -- Provisions Wagon v1
    RemoveImap(1742990618)    -- Campaign -- Pearsons Wagon -- Provisions Wagon v2
    RemoveImap(-751959361)    -- Campaign -- Pearsons Wagon -- Provisons Wagon v3
    RemoveImap(-1279618207)   -- Campaign -- Pearsons Wagon -- Provisions Wagon v4 Empty
    RemoveImap(-492479795)    -- Campaign -- Pearsons Wagon -- Skull Provisions Wagon
    RemoveImap(-320577790)    -- Campaign -- Pearsons Wagon -- Barrel with Lantern
    RemoveImap(1246210400)    -- Campaign -- Pearsons Wagon -- Provision Boxes Large
    RemoveImap(-172246728)    -- Campaign -- Pearsons Wagon -- Table - Cutting Board - Barrel of Salt v1
    RemoveImap(-850189983)    -- Campaign -- Pearsons Wagon -- Table - Cutting Board - Barrel of Salt v2
    RemoveImap(126970802)     -- Campaign -- Pearsons Wagon -- Two Boxes Provisions
    RemoveImap(715730031)     -- Campaign -- Pearsons Wagon -- Pans and Blue Table Cloth for Table v1
    RemoveImap(349896400)     -- Campaign -- Pearsons Wagon -- Pans and Table Cloth for Table v2
    RemoveImap(110400393)     -- Campaign -- Pearsons Wagon -- Provisions, keg, rope for Table v1 (will work with v2 as well but clips)
    RemoveImap(482931525)     -- Campaign -- Pearsons Wagon -- Provisions, Fruits, Milk, red cloth
    RemoveImap(-1291679096)   -- Campaign -- Pearsons Wagon -- Potato Bags for Wagon v3
    RemoveImap(-387018143)    -- Campaign -- Pearsons Wagon -- Two Barrels
    RemoveImap(5585502)       -- Campaign -- Pearsons Wagon -- Red Cloth v2 watermelons, pumpkins flour
    RemoveImap(1309652195)    -- Campaign -- Pearsons Wagon -- Water and Dishes
    RemoveImap(-112364237)    -- Campaign -- Pearsons Wagon -- Ammo Tools
    RemoveImap(-1983416665)   -- Campaign -- Pearsons Wagon -- Spilled Flour
    RemoveImap(438624963)     -- Campaign -- Pearsons Wagon -- Supplies
    RemoveImap(82769080)      -- Campaign -- Pearsons Wagon -- Plate and Spilled Flour
    RemoveImap(1125807846)    -- Campaign -- Pearsons Wagon -- Bag of Flour
    RemoveImap(-1894946791)   -- Campaign -- Pearsons Wagon -- Plate
    RemoveImap(-1362716862)   -- Campaign -- Pearsons Wagon -- red cloth v3 provisions
    RemoveImap(-624219879)    -- Campaign -- Pearsons Wagon -- Pans open can ammo for v1 table
    RemoveImap(977061573)     -- Campaign -- Pearsons Wagon -- Pans open can ammo for v2 table
    RemoveImap(1729014506)    -- Campaign -- Pearsons Wagon -- Provisions for table v1
    RemoveImap(-916538063)    -- Campaign -- Pearsons Wagon -- Provisions for table v2
    RemoveImap(1886481528)    -- Campaign -- Pearsons Wagon -- Spilled flour
    RemoveImap(-1507376753)   -- Campaign -- Pearsons Wagon -- Bag of Flour
    RemoveImap(-1370620659)   -- Campaign -- Pearsons Wagon -- Pans for table v1
    RemoveImap(1074130180)    -- Campaign -- Pearsons Wagon -- Pans for table v2
    RemoveImap(652735549)     -- Campaign -- Pearsons Wagon -- Provisions for table v1
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

 