local KeyMapper = import('/lua/keymap/keymapper.lua')

L = import("/mods/my-faf-mod/modules/boo.lua")

function say_hi(S)
    print(S)
end

function groot()
    L.boo()
end

--------HOTKEYS-----------

--Default
KeyMapper.SetUserKeyAction('Castom', {action = "UI_Lua import('/lua/keymap/misckeyactions.lua').say_hi('F')", category = 'M y op', order = 75})
KeyMapper.SetUserKeyAction('import 13', {action = "UI_Lua import('/lua/keymap/misckeyactions.lua').groot()", category = 'M y op', order = 85})
KeyMapper.SetUserKeyAction('import 14', {action = "UI_Lua import('/lua/keymap/misckeyactions.lua').L.boo()", category = 'M y op', order = 88})

