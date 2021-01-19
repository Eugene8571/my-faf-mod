local KeyMapper = import('/lua/keymap/keymapper.lua')

smart_engi = import("/mods/my-faf-mod/modules/smart_engi.lua")

--------HOTKEYS-----------

KeyMapper.SetUserKeyAction('test', 
    {action = "UI_Lua import('/lua/keymap/misckeyactions.lua').smart_engi.testMove()", category = 'Smart Engi', order = 85})

-- KeyMapper.SetUserKeyAction('Move to mass deposits', 
--     {action = "UI_Lua import('/lua/keymap/misckeyactions.lua').smart_engi.to_mass_deposits()", category = 'Smart Engi', order = 85})

-- KeyMapper.SetUserKeyAction('Build MEX', 
--     {action = "UI_Lua import('/lua/keymap/misckeyactions.lua').smart_engi.build_mex()", category = 'Smart Engi', order = 85})

-- KeyMapper.SetUserKeyAction('make AttackMove random', 
--     {action = "UI_Lua import('/lua/keymap/misckeyactions.lua').smart_engi.attack_move_random()", category = 'Smart Engi', order = 85})

-- KeyMapper.SetUserKeyAction('make Move random', 
--     {action = "UI_Lua import('/lua/keymap/misckeyactions.lua').smart_engi.plan_move_random()", category = 'Smart Engi', order = 85})

-- KeyMapper.SetUserKeyAction('All custom moves in Chain', 
--     {action = "UI_Lua import('/lua/keymap/misckeyactions.lua').smart_engi.chain_moves()", category = 'Smart Engi', order = 85})

