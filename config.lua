Config = {
    Gztka = {
        ["gzetkaone"] = {
            location = {x = -268.3, y = -956.24, z = 30.22}, -- SPAWN (DO ZMIANY COORDSY)
            diameter = (20 * 3.14159), 
            visabilitydistance = 100.0, 
            color = {r = 255, g = 0, b = 0, a = 20}, 
            restrictions = {
            blockattack = true, 
            },
            
            customrestrictions = {
            enabled = true,               
            loop = false,
            run = function(zone)
            end,           
            stop = function(zone)
            end,
            },
        },
        ["gzetkatwo"] = {
            location = {x = -268.3, y = -956.24, z = 30.22}, -- SZPITAL (DO ZMIANY COORDSY)
            diameter = (20 * 3.14159), 
            visabilitydistance = 100.0, 
            color = {r = 255, g = 0, b = 0, a = 20}, 
            restrictions = {
            blockattack = true, 
            },
            
            customrestrictions = {
            enabled = true,               
            loop = false,
            run = function(zone)
            end,           
            stop = function(zone)
            end,
            },
        },
        ["gzetkathree"] = {
            location = {x = -268.3, y = -956.24, z = 30.22}, -- MECHANIK (DO ZMIANY COORDSY)
            diameter = (20 * 3.14159), 
            visabilitydistance = 100.0, 
            color = {r = 255, g = 0, b = 0, a = 20}, 
            restrictions = {
            blockattack = true, 
            },
            
            customrestrictions = {
            enabled = true,               
            loop = false,
            run = function(zone)
            end,           
            stop = function(zone)
            end,
            },
        },
    },
}