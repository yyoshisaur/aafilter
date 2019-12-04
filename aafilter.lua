_addon.version = '0.0.1'
_addon.name = 'aafilter'
_addon.author = 'yyoshisaur'
_addon.commands = {'aafilter'}

filters = {
            windower.to_shift_jis('*の攻撃*'),
            windower.to_shift_jis('追加ダメージ*'),
        }

windower.register_event("incoming text", function(original, modified, original_mode, modified_mode, blocked)
    for i, filter in pairs(filters) do
        if windower.wc_match(original, filter) then
            blocked = true
            return blocked
        end
    end
end)