_addon.version = '0.0.2'
_addon.name = 'aafilter'
_addon.author = 'yyoshisaur'
_addon.commands = {'aafilter'}

require('sets')

filters = S{
            windower.to_shift_jis('*の攻撃*'),
            windower.to_shift_jis('追加ダメージ*'),
        }

filter_mode = S{20,21,25,26,32,33,40,41,163,164,185,186,}
--[[
    20:自身の攻撃
    21:自身の攻撃失敗
    25:PTメンバーの攻撃
    26:PTメンバーの攻撃失敗
    28:自身への攻撃
    29:自身への攻撃失敗
    32:PTメンバーへの攻撃
    33:PTメンバーへの攻撃失敗
    40:他PC/NPCの攻撃
    41:他PC/NPCの攻撃失敗
    163:アライアンスメンバーの攻撃
    164:アライアンスメンバーの攻撃失敗
    185:アライアンスメンバーへの攻撃
    186:アライアンスメンバーへの攻撃失敗
]]

windower.register_event("incoming text", function(original, modified, original_mode, modified_mode, blocked)

    if filter_mode:contains(original_mode) then
        for filter in filters:it() do
            if windower.wc_match(original, filter) then
                blocked = true
                return blocked
            end
        end
    end
end)