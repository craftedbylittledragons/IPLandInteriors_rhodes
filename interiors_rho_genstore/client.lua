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
end

function EnableResouresINTERIORS(x, y, z)  
    local interior = GetInteriorAtCoords(x, y, z)  
    --[[

	ActivateInteriorEntitySets(258, "Rhodes general store", {
		"_FIN2_EXT_P19_FRAMES_ON",
		"_p_apple01x_dressing",
		"_p_apple01x_group",
		"_p_bread06x_dressing",
		"_p_bread06x_group",
		"_p_cigar02x_dressing",
		"_p_cigar02x_group",
		"_p_cigarettebox01x_dressing",
		"_p_cigarettebox01x_group",
		"_p_corn02x_dressing",
		"_p_corn02x_group",
		"_p_tin_pomade01x_dressing",
		"_p_tin_pomade01x_group",
		"_s_beardTonic01x_dressing",
		"_s_beardTonic01x_group",
		"_s_biscuits01x_dressing",
		"_s_biscuits01x_group",
		"_s_brandy01x_group",
		"_s_candyBag01x_red_group",
		"_s_canPeas01x_dressing",
		"_s_canPeas01x_group",
		"_s_canPineapple01x_dressing",
		"_s_canPineapple01x_group",
		"_s_canStrawberries01x_dressing",
		"_s_canStrawberries01x_group",
		"_s_cheeseWedge1x_dressing",
		"_s_cheeseWedge1x_group",
		"_s_chocolateBar02x_dressing",
		"_s_chocolateBar02x_group",
		"_s_coffeeTin01x_dressing",
		"_s_coffeeTin01x_group",
		"_s_cornedBeef01x_dressing",
		"_s_cornedBeef01x_group",
		"_s_inv_horsePills01x_dressing",
		"_s_inv_horsePills01x_group",
		"_s_inv_rum01x_dressing",
		"_s_inv_rum01x_group",
		"_s_inv_tabacco01x_dressing",
		"_s_inv_tabacco01x_group",
		"_s_inv_whiskey01x_dressing",
		"_s_inv_whiskey01x_group",
		"_s_oatcakes01x_dressing",
		"_s_oatcakes01x_group",
		"_s_peach01x_dressing",
		"_s_peach01x_group",
		"_s_saltedbeef01x_group",
		"_s_saltedbeef02x_group"
	})

    --]]
    ActivateInteriorEntitySet(interior, "val_saloon2_int")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "l_00260edcej")         
    end   

end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesYMAPS() 
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

 