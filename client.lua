local inside_zone = false

local greenzones = Config.Gztka

local function ShowInfo(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(true, false)
end

Citizen.CreateThread(function()
  while true do
    local playerPed = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(playerPed, false)
    for k, v in pairs(greenzones) do
      local location = vector3(v.location.x, v.location.y, v.location.z)
      if #(plyCoords - location) < (v.diameter) - (v.diameter / 150) then
        if (not inside_zone) then
          local temp_append = ""
          inside_zone = true
          if (v.customrestrictions.enabled and v.customrestrictions.loop == false) then
            Config.Gztka[k].customrestrictions.run(v)
          end
        end
        if (v.restrictions.blockattack) then
          SetEntityCanBeDamaged(playerPed, false)
          SetPlayerCanDoDriveBy(playerPed, false)
          DisablePlayerFiring(playerPed, true)
          DisableControlAction(0, 140) -- R
        end
        if (v.restrictions.speedlimit ~= nil and tonumber(v.restrictions.speedlimit)) then
          SetEntityMaxSpeed(GetVehiclePedIsIn(playerPed, false), tonumber(v.restrictions.speedlimit) / 2.237)
        end
        if (v.customrestrictions.enabled and v.customrestrictions.loop == true) then
          Config.Gztka[k].customrestrictions.run(v)
        end
      elseif (inside_zone) then

        SetEntityCanBeDamaged(playerPed, true)
        SetEntityMaxSpeed(GetVehiclePedIsIn(playerPed, false), 99999.9)

        Config.Gztka[k].customrestrictions.stop(v)

        inside_zone = false

      end
    end
    Citizen.Wait(0)
  end
end)

Citizen.CreateThread(function()
  while true do
    local playerPed = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(playerPed, false)
    for k, v in pairs(greenzones) do
      local location = vector3(v.location.x, v.location.y, v.location.z)
      if #(plyCoords - location) < (v.diameter) - (v.diameter / 150) then
        DrawMarker(28, v.location.x, v.location.y, v.location.z, 0, 0, 0, 0, 0, 0, v.diameter + 0.0, v.diameter + 0.0, v.diameter + 0.0, v.color.r, v.color.g, v.color.b, 0, 0, 0, 0, 0)
      elseif (#(plyCoords - location) < (v.diameter) - (v.diameter / 150) + v.visabilitydistance) then
        DrawMarker(28, v.location.x, v.location.y, v.location.z, 0, 0, 0, 0, 0, 0, v.diameter + 0.0, v.diameter + 0.0, v.diameter + 0.0, v.color.r, v.color.g, v.color.b, v.color.a, 0, 0, 0, 0)
      end
    end
    Citizen.Wait(0)
  end
end)

Citizen.CreateThread(function() -- ANTI VDM`
  while true do
      N_0x4757f00bc6323cfe(-1553120962, 0.0) 
      Wait(0)
  end
end)