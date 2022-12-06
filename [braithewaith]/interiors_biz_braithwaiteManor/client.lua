---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresIMAP()    -- RequestImap      
    if Config.Unknow == true then
        --RequestImap(___________________) -- Something relating to BizTemplate--## Braithwaite Manor ##--
    end 
    if Config.MansionShell == 1 then  
        RequestImap(1149195254)   -- Lemoyne -- Braithwaite Manor -- Mansion Interior -- House Shell
        if Config.MansionInterior == true then 
            RequestImap(58066174)     -- Lemoyne -- Braithwaite Manor -- Mansion Interior -- Interior 
        end
    elseif Config.MansionShell == 2 then  
        RequestImap(-1643869063)-- Lemoyne -- Braithwaite Manor -- Mansion Interior -- House Burnt Down
    end

    if Config.Fire == true then 
        RequestImap(1601599776)    -- Lemoyne -- Braithwaite Manor -- Mansion Interior -- House on fire Smoke (Smoke and Burning Sounds Only)
        RequestImap(-437251660)    -- Lemoyne -- Braithwaite Manor -- Mansion Interior -- House of Fire Flames
    end 
    
    if Config.Lantern == true then 
        RequestImap(-880373663)   -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Front Balcony Lantern Added
    end
    if Config.Tools == true then 
        RequestImap(-70021332)    -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Adds Working tools and supplies to upper balcony
    end
    if Config.Shurbs == true then 
        RequestImap(-1220264217)   -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Shurbs and Bushes
    end
    if Config.Ferns == true then 
        RequestImap(-1508467572)   -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Ferns Bushes Weeds Overgrown (Use with Burned Down Version of House)
    end
    if Config.Trees == true then 
        RequestImap(-990258606)    -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Small Trees
    end

    if Config.Shutters == true then 
        RequestImap(1944013855)   -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Add Open Shudders Upstairs Bed Room and Downstairs Library
        RequestImap(-2137633069)   -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Shutters Close Upstairs Bedroom and Downstairs Library
        RequestImap(1164014270)   -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Shutters Close Upstairs Bedroom and Downstairs Library        
    end    
    --[[

------------------------------------- Braithwaite Mansion
--Mansion Interior
RequestImap(1149195254)  --Brathwaite House Shell
-- RequestImap(-1643869063) -- House Burnt Down
RequestImap(58066174)  -- Interior
-- RequestImap(1601599776)  -- House on fire Smoke (Smoke and Burning Sounds Only)
-- RequestImap(-437251660)  -- House of Fire Flames
RequestImap(-1108618313)

-- Mansion Exterior 
-- RequestImap(-1220264217)  -- Shurbs and Bushes
-- RequestImap(-1508467572) -- Ferns Bushes Weeds Overgrown (Use with Burned Down Version of House)
-- RequestImap(-990258606) -- Small Trees
RequestImap(1944013855) -- Add Open Shudders Upstairs Bed Room and Downstairs Library
-- RequestImap(-2137633069)  -- Shudders Close Upstairs Bedroom and Downstairs Library
RequestImap(-880373663)  -- Front Balcony Lantern Added
RequestImap(-70021332)  -- Adds Working tools and supplies to upper balcony
-- RequestImap(-787678727) -- burnt plants outside

-- RequestImap(-1452136643) weeds in field 1189.41, -1638.19, 58.63
-- RequestImap(654746614) -- overgrown grass in crops
-- RequestImap(434145706) -- overgrown grass in crops
-- RequestImap(340621560) -- overgrown grass in crops
-- RequestImap(24859476) -- overgrown grass in crops
-- RequestImap(314111435) -- overgrown grass in crops
-- RequestImap(-64632667) -- overgrown grass in crops
-- RequestImap(-282972514)  -- overgrown grass in crops
-- RequestImap(-665583358)  -- overgrown grass in crops
-- RequestImap(-889100155)  -- overgrown grass in crops
-- RequestImap(-946313953)  -- overgrown grass in crops
-- RequestImap(-1184151355) -- overgrown grass in crops
-- RequestImap(1812999696) -- overgrown grass in crops
-- RequestImap(-1296418825) -- overgrown grass in crops
-- RequestImap((1576931820) -- overgrown grass in crops
-- RequestImap(1891284833) -- overgrown grass in crops
-- RequestImap(-744260705)
-- RequestImap(1424293412)
RequestImap(366542865)
RequestImap(241205019)
RequestImap(1060557512)
-- RequestImap(-362403544)
RequestImap(-592147003)
RequestImap(352816221)
RequestImap(1128622296)
RequestImap(979982112)
RequestImap(1756640181)
RequestImap(1557076971)
RequestImap(1913538153)
RequestImap(1650694835)
RequestImap(1965736001)
RequestImap(1266707689)
RequestImap(-1603329230)
RequestImap(2056145270)
RequestImap(748826019)
RequestImap(-1892843345)
------------------------------------- #### END OF BRAITHWAITE MANSION ####

    --]]
    

end

function EnableResouresINTERIORS(x, y, z)  --- ActivateInteriorEntitySet
    local interior = GetInteriorAtCoords(x, y, z)  

    --[[ on Exterior -- Shudders Close Upstairs Bedroom and Downstairs Library
        72706 	506340962 	bra_mansion_int 	bra_int_bedroom_clean
        72706 	506340962 	bra_mansion_int 	bra_int_bedroom_ransacked
        72706 	506340962 	bra_mansion_int 	bra_int_bra3_barricade
        72706 	506340962 	bra_mansion_int 	bra_mansion_alt
        72706 	506340962 	bra_mansion_int 	bra_mansion_dining_csprops
        72706 	506340962 	bra_mansion_int 	bra_mansion_dining_groups
        72706 	506340962 	bra_mansion_int 	bra_mansion_WindowsBreakable
        72706 	506340962 	bra_mansion_int 	bra_mansion_WindowsStatic
        72706 	506340962 	bra_mansion_int 	bra_man_dining_vfx
        72706 	506340962 	bra_mansion_int 	bra_man_parlor_vfx
        34306 	1129175760 	bra_tre_house_int 	br_tre_house_cheat01 
        [33794] = {x=902.99987792969,y=-1790.0,z=43.000007629395,typeHashId=1164014270,typeHashName="bra_boathouse_int",rpf="bra_boathouse_int.rpf"},
        [16386] = {x=2020.9830322266,y=-775.86383056641,z=42.755302429199,typeHashId=1164014270,typeHashName="bra_boathouse_int",rpf="bra_boathouse_int.rpf"},
        [46850]= {x=979.93585205078,y=-2024.6912841797,z=47.13293838501,typeHashId=1464912910,typeHashName="bra_cornmill_int",rpf="bra_cornmill_int.rpf"},
        [72706] = {x=1011.0,y=-1771.0,z=47.999687194824,typeHashId=506340962,typeHashName="bra_mansion_int",rpf="bra_mansion_int.rpf"},
        [34818] = {x=967.25250244141,y=-1830.8103027344,z=44.809516906738,typeHashId=2029645233,typeHashName="bra_stable_int",rpf="bra_stable_int.rpf"},
        [34306] = {x=1118.0,y=-1987.9978027344,z=55.999977111816,typeHashId=1129175760,typeHashName="bra_tre_house_int",rpf="bra_tre_house_int.rpf"},
    --]]
    if Config.Cornmill == true then  
        ActivateInteriorEntitySet(interior, "bra_cornmill_int")         
    end       
    if Config.Stable == true then  
        ActivateInteriorEntitySet(interior, "bra_stable_int")         
    end       
    if Config.Boathouse == true then  
        ActivateInteriorEntitySet(interior, "bra_boathouse_int")         
    end          

    if Config.Parlor == true then  
        ActivateInteriorEntitySet(interior, "bra_man_parlor_vfx")         
    end    
    if Config.DiningRoom == true then  
        ActivateInteriorEntitySet(interior, "bra_man_dining_vfx")         
    end

    if Config.Barricades == true then  
        ActivateInteriorEntitySet(interior, "bra_int_bra3_barricade")         
    end    
    
    if Config.Mansion == 1 then  
        ActivateInteriorEntitySet(interior, "bra_mansion_int")  
    elseif Config.Mansion == 2 then  
        ActivateInteriorEntitySet(interior, "bra_mansion_alt")         
    end     
     
    if Config.Windows == 1 then  
        ActivateInteriorEntitySet(interior, "bra_mansion_WindowsStatic")  
    elseif Config.Windows == 2 then  
        ActivateInteriorEntitySet(interior, "bra_mansion_WindowsBreakable")         
    end          

    if Config.Bedroom == 1 then  
        ActivateInteriorEntitySet(interior, "bra_int_bedroom_clean")  
    elseif Config.Bedroom == 2 then  
        ActivateInteriorEntitySet(interior, "bra_int_bedroom_ransacked")         
    end    

    ---- tree house? guard house?
    if Config.TreeHouse1 == true then  
        ActivateInteriorEntitySet(interior, "bra_tre_house_int")         
    end       
    if Config.TreeHouse2 == true then  
        ActivateInteriorEntitySet(interior, "br_tre_house_cheat01")         
    end   
end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesIMAPS() --- RemoveImap 
    --RemoveImap(___________________) -- Something relating to BizTemplate   --## Braithwaite Manor ##--
    RemoveImap(1149195254)      -- Lemoyne -- Braithwaite Manor -- Mansion Interior -- House Shell
    RemoveImap(-1643869063)     -- Lemoyne -- Braithwaite Manor -- Mansion Interior -- House Burnt Down
    RemoveImap(58066174)        -- Lemoyne -- Braithwaite Manor -- Mansion Interior -- Interior
    RemoveImap(1601599776)      -- Lemoyne -- Braithwaite Manor -- Mansion Interior -- House on fire Smoke (Smoke and Burning Sounds Only)
    RemoveImap(-437251660)      -- Lemoyne -- Braithwaite Manor -- Mansion Interior -- House of Fire Flames
    RemoveImap(1944013855)      -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Add Open Shudders Upstairs Bed Room and Downstairs Library
    RemoveImap(-880373663)      -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Front Balcony Lantern Added
    RemoveImap(-70021332)       -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Adds Working tools and supplies to upper balcony
    RemoveImap(-1220264217)     -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Shurbs and Bushes
    RemoveImap(-1508467572)     -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Ferns Bushes Weeds Overgrown (Use with Burned Down Version of House)
    RemoveImap(-990258606)      -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Small Trees
    RemoveImap(-2137633069)     -- Lemoyne -- Braithwaite Manor -- Mansion Exterior -- Shudders Close Upstairs Bedroom and Downstairs Library    
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

 