local KeyMapper = import('/lua/keymap/keymapper.lua')


function say_hi()
    print('ogogog')
end

--------HOTKEYS-----------

--Default
KeyMapper.SetUserKeyAction('Castom', {action = 'UI_Lua import("/lua/keymap/misckeyactions.lua").say_hi()', category = 'M y op', order = 75})

