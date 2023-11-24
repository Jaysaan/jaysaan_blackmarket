lib.locale()

weapons = {}
weaponscomponents = {}
others = {}

RegisterNetEvent('jaysaan:openbm', function ()
    lib.registerContext({
        id = 'jaysaan_bm',
        title = locale('bm'),
        options = {
            {
                title = locale('weapons'),
                icon = 'gun',
                description = locale('weapons_desc'),
                event = 'jaysaan:openbmweapons',
                arrow = 'true'
            },
            {
                title = locale('weapons_comp'),
                icon = 'link',
                description = locale('weapons_comp_desc'),
                event = 'jaysaan:openbmweaponscomp',
                arrow = 'true'
            },
            {
                title = locale('others'),
                icon = 'tags',
                description = locale('others_desc'),
                event = 'jaysaan:openbmothers',
                arrow = 'true'
            }
        }
    })
    lib.showContext('jaysaan_bm')
end)

RegisterNetEvent('jaysaan:openbmweapons', function ()
    lib.registerContext({
        id = 'jaysaan_bmweapons',
        title = locale('weapons_title'),
        menu = 'jaysaan_bm',
        options = weapons
    })
    lib.showContext('jaysaan_bmweapons')
end)

RegisterNetEvent('jaysaan:openbmweaponscomp', function ()
    lib.registerContext({
        id = 'jaysaan_bmweaponscomp',
        title = locale('weapons_comp_title'),
        menu = 'jaysaan_bm',
        options = weaponscomponents
    })
    lib.showContext('jaysaan_bmweaponscomp')
end)

RegisterNetEvent('jaysaan:openbmothers', function ()
    lib.registerContext({
        id = 'jaysaan_bmothers',
        title = locale('others_title'),
        menu = 'jaysaan_bm',
        options = others
    })
    lib.showContext('jaysaan_bmothers')
end)

for k, v in pairs(Config.Weapons) do 
    table.insert(weapons, {
        title = v.label,
        icon = v.icon,
        iconColor = '#B964A3',
        description = locale('price'):format(v.price.."$"),
        onSelect = function ()
            local itemName = v.item
            local itemPrice = v.price
            TriggerServerEvent('Jaysaan:buyItem', itemName, itemPrice)
        end
    })
end

for k, v in pairs(Config.WeaponsComponents) do 
    table.insert(weaponscomponents, {
        title = v.label,
        icon = v.icon,
        iconColor = '#B964A3',
        description = locale('price'):format(v.price.."$"),
        onSelect = function ()
            local itemName = v.item
            local itemPrice = v.price
            TriggerServerEvent('Jaysaan:buyItem', itemName, itemPrice)
        end
    })
end

for k, v in pairs(Config.Others) do 
    table.insert(others, {
        title = v.label,
        icon = v.icon,
        iconColor = '#B964A3',
        description = locale('price'):format(v.price.."$"),
        onSelect = function ()
            local itemName = v.item
            local itemPrice = v.price
            TriggerServerEvent('Jaysaan:buyItem', itemName, itemPrice)
        end
    })
end

local BlackMarketPed = {
    Ped = {
        {hash = "u_m_m_jewelsec_01" , coords = vector4(-52.919, -2523.829, 6.401, 52.098)},
        -- If you want to add another ped, just copy it and change the coords
    }
}

Citizen.CreateThread(function ()
    for _, v in pairs(BlackMarketPed.Ped) do 
        local hash = GetHashKey(v.hash)
        while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
        end
        ped = CreatePed("Jaysaan", v.hash, v.coords, false, true)
        exports.ox_target:addLocalEntity(ped, {
            {
                name = 'jaysan:targetbm',
                event = 'jaysaan:openbm',
                icon = 'fa-solid fa-person-rifle',
                label = locale('talk'),
            }
        })
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
    end
end)