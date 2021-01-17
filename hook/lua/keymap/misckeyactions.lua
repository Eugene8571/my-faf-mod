local KeyMapper = import('/lua/keymap/keymapper.lua')

L = import("/mods/my-faf-mod/modules/boo.lua")

function say_hi(S)
    print(S)
end

smart_engi = import("/mods/my-faf-mod/modules/smart_engi.lua")
--------HOTKEYS-----------

--Default
KeyMapper.SetUserKeyAction('Castom', {action = "UI_Lua import('/lua/keymap/misckeyactions.lua').say_hi('F')", category = 'M y op', order = 75})
KeyMapper.SetUserKeyAction('smart_engi', {action = "UI_Lua import('/lua/keymap/misckeyactions.lua').smart_engi.smart_engi()", category = 'M y op', order = 85})

