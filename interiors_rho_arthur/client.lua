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
	--## Arthurs Wagon ##--
	RequestImap(2072112547)    -- Campaign -- Arthurs Wagon -- Wagon v1 with Canopy
	RequestImap(-2016771661)   -- Campaign -- Arthurs Wagon -- Wagon v2
	RequestImap(202127432)     -- Campaign -- Arthurs Wagon -- Wagon v3 with Shevles Tools
	RequestImap(1601820048)    -- Campaign -- Arthurs Wagon -- Hide Rug 
	RequestImap(2025485344)    -- Campaign -- Arthurs Wagon -- Table Top 
	RequestImap(901520480)     -- Campaign -- Arthurs Wagon -- Table 
	RequestImap(-1999465365)   -- Campaign -- Arthurs Wagon -- Arthurs Wagon -- Right Skull  Wagon
	RequestImap(853723410)     -- Campaign -- Arthurs Wagon -- Left Alligator Skull  Wagon
	RequestImap(-1774140220)   -- Campaign -- Arthurs Wagon -- Chest v1
	RequestImap(-262271608)    -- Campaign -- Arthurs Wagon -- Chest v2 Striped Shirt
	RequestImap(102652153)     -- Campaign -- Arthurs Wagon -- Shaving Kit
	RequestImap(-1434077648)   -- Campaign -- Arthurs Wagon -- Small Containers 
	RequestImap(-1728638189)   -- Campaign -- Arthurs Wagon -- Bigger boxes v1 
	RequestImap(93121605)      -- Campaign -- Arthurs Wagon -- Bigger Boxes v2 
	RequestImap(-205043526)    -- Campaign -- Arthurs Wagon -- Bigger Boxes v3 
	RequestImap(1027586707)    -- Campaign -- Arthurs Wagon -- Bigger Boxes v4 
	RequestImap(-1570232590)   -- Campaign -- Arthurs Wagon -- Open Flipped Small Box 
	RequestImap(648514907)     -- Campaign -- Arthurs Wagon -- Open Box Flipped
	RequestImap(1351016737)    -- Campaign -- Arthurs Wagon -- Little Box inside Flipped Box
	RequestImap(721720861)     -- Campaign -- Arthurs Wagon -- Small Box on Ground
	RequestImap(1620317782)    -- Campaign -- Arthurs Wagon -- v1 Mixture of Boxes 
	RequestImap(1952267752)    -- Campaign -- Arthurs Wagon -- v2 Mixture of Boxes 
	RequestImap(-1739164071)   -- Campaign -- Arthurs Wagon -- Book on Small Table 
	RequestImap(-1331617405)   -- Campaign -- Arthurs Wagon -- Book
	RequestImap(-959814975)    -- Campaign -- Arthurs Wagon -- Box by Book v1
	RequestImap(-1676997321)   -- Campaign -- Arthurs Wagon -- Box by book v2
	RequestImap(1096093290)    -- Campaign -- Arthurs Wagon -- Quiver on Ground
	RequestImap(626928579)     -- Campaign -- Arthurs Wagon -- Picktures on Ground
	RequestImap(313722477)     -- Campaign -- Arthurs Wagon -- Tools no wagon
	RequestImap(976082270)     -- Campaign -- Arthurs Wagon -- Tools, painting, guns
	RequestImap(153759048)     -- Campaign -- Arthurs Wagon -- Chair
	RequestImap(-1147256587)   -- Campaign -- Arthurs Wagon -- Map
	RequestImap(1676971154)    -- Campaign -- Arthurs Wagon -- Photo    
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
	-- ## Arthurs Wagon ##--
	RemoveImap(2072112547)    -- Campaign -- Arthurs Wagon -- Wagon v1 with Canopy
	RemoveImap(-2016771661)   -- Campaign -- Arthurs Wagon -- Wagon v2
	RemoveImap(202127432)     -- Campaign -- Arthurs Wagon -- Wagon v3 with Shevles Tools
	RemoveImap(1601820048)    -- Campaign -- Arthurs Wagon -- Hide Rug 
	RemoveImap(2025485344)    -- Campaign -- Arthurs Wagon -- Table Top 
	RemoveImap(901520480)     -- Campaign -- Arthurs Wagon -- Table 
	RemoveImap(-1999465365)   -- Campaign -- Arthurs Wagon -- Arthurs Wagon -- Right Skull  Wagon
	RemoveImap(853723410)     -- Campaign -- Arthurs Wagon -- Left Alligator Skull  Wagon
	RemoveImap(-1774140220)   -- Campaign -- Arthurs Wagon -- Chest v1
	RemoveImap(-262271608)    -- Campaign -- Arthurs Wagon -- Chest v2 Striped Shirt
	RemoveImap(102652153)     -- Campaign -- Arthurs Wagon -- Shaving Kit
	RemoveImap(-1434077648)   -- Campaign -- Arthurs Wagon -- Small Containers 
	RemoveImap(-1728638189)   -- Campaign -- Arthurs Wagon -- Bigger boxes v1 
	RemoveImap(93121605)      -- Campaign -- Arthurs Wagon -- Bigger Boxes v2 
	RemoveImap(-205043526)    -- Campaign -- Arthurs Wagon -- Bigger Boxes v3 
	RemoveImap(1027586707)    -- Campaign -- Arthurs Wagon -- Bigger Boxes v4 
	RemoveImap(-1570232590)   -- Campaign -- Arthurs Wagon -- Open Flipped Small Box 
	RemoveImap(648514907)     -- Campaign -- Arthurs Wagon -- Open Box Flipped
	RemoveImap(1351016737)    -- Campaign -- Arthurs Wagon -- Little Box inside Flipped Box
	RemoveImap(721720861)     -- Campaign -- Arthurs Wagon -- Small Box on Ground
	RemoveImap(1620317782)    -- Campaign -- Arthurs Wagon -- v1 Mixture of Boxes 
	RemoveImap(1952267752)    -- Campaign -- Arthurs Wagon -- v2 Mixture of Boxes 
	RemoveImap(-1739164071)   -- Campaign -- Arthurs Wagon -- Book on Small Table 
	RemoveImap(-1331617405)   -- Campaign -- Arthurs Wagon -- Book
	RemoveImap(-959814975)    -- Campaign -- Arthurs Wagon -- Box by Book v1
	RemoveImap(-1676997321)   -- Campaign -- Arthurs Wagon -- Box by book v2
	RemoveImap(1096093290)    -- Campaign -- Arthurs Wagon -- Quiver on Ground
	RemoveImap(626928579)     -- Campaign -- Arthurs Wagon -- Picktures on Ground
	RemoveImap(313722477)     -- Campaign -- Arthurs Wagon -- Tools no wagon
	RemoveImap(976082270)     -- Campaign -- Arthurs Wagon -- Tools, painting, guns
	RemoveImap(153759048)     -- Campaign -- Arthurs Wagon -- Chair
	RemoveImap(-1147256587)   -- Campaign -- Arthurs Wagon -- Map
	RemoveImap(1676971154)    -- Campaign -- Arthurs Wagon -- Photo
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

 