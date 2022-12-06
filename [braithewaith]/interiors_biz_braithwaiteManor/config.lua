Config = {}
Config.Commands = true  -- For testing set to false for live server
Config.TeleportME = true -- For testing set to false for live server

-- imap / ipl 
Config.MansionShell = 1 --- 1 for Not Burnt, 2 for Burnt 
Config.MansionInterior = true   
Config.Fire = false
Config.Shutters = false

Config.Lantern = true
Config.Tools = true
Config.Shurbs = true
Config.Ferns = true
Config.Trees = true


-- interior set 
Config.Cornmill = true 
Config.Stable = true 
Config.Boathouse = true 
Config.Parlor = true 
Config.DiningRoom = true 
Config.Barricades = false 

Config.TreeHouse1 = true 
Config.TreeHouse2 = true  

Config.Windows = 1  ---  1 for Static 2 for Breakable
Config.Mansion = 1  ---  1 for v1 2 for Burnt 
Config.Bedroom = 1  ---  1 for clean 2 for not Clean  

Config.Label = "BizTemplate"
Config.x = -309.288
Config.y = 808.374
Config.z = 119.187   
 
Config.door_hash_v1 = {
    ----Valentine 
}

Config.door_hash_v2 = {
    --[[
    [3798786] = {3798786,-542955242,"p_door04x",-322.7286, 767.2573, 121.7059},  -- "Name": "Room 2A", // Valentine
    [3459074] = {3459074,-542955242,"p_door04x",-321.5221, 762.2973, 121.6815},  -- "Name": "Room 2B", // Valentine
    --]]
}  

--------------------------------------------------
-- Teleport Cofiguration  ---------------------------
--------------------------------------------------
Config.definedkey = { named = "G", hash = 0x760A9C6F }
Config.TeleporterPrompt = "Use Door [~e~"..  Config.definedkey.named  .."~q~]"
Config.TeleportDistance = 0.5
Config.WaitTimer = 1000
Config.FadeTimer = 2

Config.TeleportEnter_On = false
Config.EnterRoom = {x = -306.673, y= 803.274, z=122.175, h = 000.00 } -- upstairs right  - room exist - structure interior missing 
Config.EnterRoom2B = {x = -312.446, y= 802.122, z=122.176, h = 000.00 }  -- upstairs left  - room exist - structure interior missing  

Config.TeleportExit_On = false
Config.ExitRoom = {x = -306.695, y= 801.549, z=121.732 , h = 000.00 }
Config.ExitRoom2B = {x = -312.651, y= 801.041, z=121.730, h = 000.00 }  
 
--[[
    {
      "Id": 72706,
      "InteriorName": "bra_mansion_alt",
      "Name": "Mansion Braithwaite",
      "Price": 5523.50,
      "DoorsStatus": [ 1011.01, -1762.31, 47.63 ],
      "Doors": [
        [ 1012.2030029297, -1762.0412597656, 46.599708557129, 0.0 ], // Puerta Principal 1 Derecha desde dentro | Main Door 1 Right from inside
        [ 1010.0026855469, -1762.0411376953, 46.599704742432, 0.0 ], // Puerta Principal 2 Izquierda desde dentro | Main Door 2 Left from inside
        [ 1022.5345458984, -1765.7020263672, 46.624011993408, 89.790184020996 ],
        [ 1022.5345458984, -1764.3389892578, 46.624011993408, 90.153038024902 ],
        [ 1022.5319213867, -1769.2026367188, 46.623615264893, 89.790184020996 ],
        [ 1022.5319213867, -1767.8389892578, 46.623615264893, 90.365715026855 ],
        [ 1022.5319213867, -1774.5867919922, 46.624011993408, 89.706855773926 ],
        [ 1022.5318603516, -1773.2230224609, 46.62406539917, 89.673362731934 ],
        [ 1022.5319213867, -1777.7064208984, 46.624011993408, 89.808204650879 ],
        [ 1022.5318603516, -1776.3426513672, 46.62406539917, 90.196380615234 ],
        [ 1010.4942016602, -1779.3802490234, 46.609394073486, 0.30729386210442 ],
        [ 1011.8570556641, -1779.3739013672, 46.609394073486, 359.66015625 ],
        [ 1000.0346679688, -1771.8737792969, 46.626728057861, 269.61395263672 ],
        [ 1000.0346679688, -1773.2373046875, 46.626728057861, 270.27258300781 ],
        [ 1000.0394897461, -1767.8391113281, 46.623123168945, 270.43588256836 ],
        [ 1000.0394897461, -1769.2019042969, 46.623123168945, 269.68838500977 ],
        [ 1000.0399169922, -1764.3233642578, 46.62434387207, 269.85296630859 ],
        [ 1000.0399169922, -1765.6871337891, 46.62434387207, 270.44201660156 ]
      ],
      "Inventory": [ 1005.39, -1767.96, 52.04, 1.5 ],
      "MaxWeight": 250
    }
--]]