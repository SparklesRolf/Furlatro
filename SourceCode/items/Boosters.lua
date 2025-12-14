local furry_mod = SMODS.current_mod

SMODS.Booster { -- Mini Uncommon
    key = 'miniuncommon',
    atlas = 'boosters',
    pos = { x = 0, y = 0 },
    pixel_size = { w = 71, h = 51 },
    config = { extra = 1, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 4,
    weight = 0.9,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('35BD86'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {"Mini Furry Pack"}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.RARITY.Uncommon, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.RARITY.Uncommon, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local card = create_card("uncommonfurries", G.pack_cards, nil, nil, true, true, nil, 'uncommon')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Uncommon
    key = 'uncommon',
    atlas = 'boosters',
    pos = { x = 0, y = 1 },
    config = { extra = 2, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 7,
    weight = 0.85,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('35BD86'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {"Furry Pack"}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.RARITY.Uncommon, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.RARITY.Uncommon, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local card = create_card("uncommonfurries", G.pack_cards, nil, nil, true, true, nil, 'uncommon')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Jumbo Uncommon
    key = 'jumbouncommon',
    atlas = 'boosters',
    pos = { x = 0, y = 2 },
    config = { extra = 3, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 11,
    weight = 0.7,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('35BD86'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {"Jumbo Furry Pack"}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.RARITY.Uncommon, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.RARITY.Uncommon, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local card = create_card("uncommonfurries", G.pack_cards, nil, nil, true, true, nil, 'uncommon')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Special Uncommon
    key = 'specialuncommon',
    atlas = 'boosters',
    pos = { x = 0, y = 3 },
    config = { extra = 4, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 14,
    weight = 0.65,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('35BD86'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Special Furry Pack'}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.RARITY.Uncommon, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.RARITY.Uncommon, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card)
        local edition = poll_edition('standard_edition'..G.GAME.round_resets.ante, 2, false, true)
        local card = create_card('uncommonfurries', G.pack_cards, nil, nil, nil, nil, nil, 'uncommon')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

		card:set_edition(edition, true)
        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Mini Rare
    key = 'minirare',
    atlas = 'boosters',
    pos = { x = 1, y = 0 },
    pixel_size = { w = 71, h = 51 },
    config = { extra = 1, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 5,
    weight = 0.8,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('FF4C40'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {"Mini Furry Pack"}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.RARITY.Rare, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.RARITY.Rare, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local card = create_card("rarefurries", G.pack_cards, nil, nil, true, true, nil, 'rare')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Rare
    key = 'rare',
    atlas = 'boosters',
    pos = { x = 1, y = 1 },
    config = { extra = 2, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 10,
    weight = 0.65,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('FF4C40'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {"Furry Pack"}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.RARITY.Rare, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.RARITY.Rare, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local card = create_card("rarefurries", G.pack_cards, nil, nil, true, true, nil, 'rare')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Jumbo Rare
    key = 'jumborare',
    atlas = 'boosters',
    pos = { x = 1, y = 2 },
    config = { extra = 3, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 15,
    weight = 0.4,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('FF4C40'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {"Jumbo Furry Pack"}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.RARITY.Rare, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.RARITY.Rare, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local card = create_card("rarefurries", G.pack_cards, nil, nil, true, true, nil, 'rare')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Special Rare
    key = 'specialrare',
    atlas = 'boosters',
    pos = { x = 1, y = 3 },
    config = { extra = 4, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 20,
    weight = 0.2,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('FF4C40'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Special Furry Pack'}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.RARITY.Rare, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.RARITY.Rare, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card)
        local edition = poll_edition('standard_edition'..G.GAME.round_resets.ante, 2, false, true)
        local card = create_card('rarefurries', G.pack_cards, nil, nil, nil, nil, nil, 'rare')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

		card:set_edition(edition, true)
        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Mini Legendary
    key = 'minilegendary',
    atlas = 'boosters',
    pos = { x = 2, y = 0 },
    pixel_size = { w = 71, h = 51 },
    config = { extra = 1, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 8,
    weight = 0.35,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('AB5BB5'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {"Mini Furry Pack"}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.RARITY.Legendary, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.RARITY.Legendary, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local card = create_card("legendaryfurries", G.pack_cards, nil, nil, true, true, nil, 'legendary')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Legendary
    key = 'legendary',
    atlas = 'boosters',
    pos = { x = 2, y = 1 },
    config = { extra = 2, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 15,
    weight = 0.25,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('AB5BB5'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {"Furry Pack"}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.RARITY.Legendary, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.RARITY.Legendary, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local card = create_card("legendaryfurries", G.pack_cards, nil, nil, true, true, nil, 'legendary')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Jumbo Legendary
    key = 'jumbolegendary',
    atlas = 'boosters',
    pos = { x = 2, y = 2 },
    config = { extra = 3, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 23,
    weight = 0.15,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('AB5BB5'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {"Jumbo Furry Pack"}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.RARITY.Legendary, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.RARITY.Legendary, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local card = create_card("legendaryfurries", G.pack_cards, nil, nil, true, true, nil, 'legendary')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Special Legendary
    key = 'speciallegendary',
    atlas = 'boosters',
    pos = { x = 2, y = 3 },
    config = { extra = 4, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 30,
    weight = 0.1,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('AB5BB5'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Special Furry Pack'}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.RARITY.Legendary, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.RARITY.Legendary, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card)
        local edition = poll_edition('standard_edition'..G.GAME.round_resets.ante, 2, false, true)
        local card = create_card('legendaryfurries', G.pack_cards, nil, nil, nil, nil, nil, 'legendary')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

		card:set_edition(edition, true)
        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Mini Mythic
    key = 'minimythic',
    atlas = 'boosters',
    pos = { x = 3, y = 0 },
    pixel_size = { w = 71, h = 51 },
    config = { extra = 1, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 13,
    weight = 0.2,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('24FFF6'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {"Mini Furry Pack"}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.FUR_MYTHIC, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.FUR_MYTHIC, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local card = create_card("mythicfurries", G.pack_cards, nil, nil, true, true, nil, 'mythic')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Mythic
    key = 'mythic',
    atlas = 'boosters',
    pos = { x = 3, y = 1 },
    config = { extra = 2, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 25,
    weight = 0.1,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('24FFF6'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {"Furry Pack"}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.FUR_MYTHIC, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.FUR_MYTHIC, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local card = create_card("mythicfurries", G.pack_cards, nil, nil, true, true, nil, 'mythic')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Jumbo Mythic
    key = 'jumbomythic',
    atlas = 'boosters',
    pos = { x = 3, y = 2 },
    config = { extra = 3, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 38,
    weight = 0.07,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('24FFF6'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {"Jumbo Furry Pack"}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.FUR_MYTHIC, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.FUR_MYTHIC, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card, i)
        local card = create_card("mythicfurries", G.pack_cards, nil, nil, true, true, nil, 'mythic')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}

SMODS.Booster { -- Special Mythic
    key = 'specialmythic',
    atlas = 'boosters',
    pos = { x = 3, y = 3 },
    config = { extra = 4, choose = 1 },
    group_key = 'furry',
    pools = {
        ["skipspacks"] = true,
    },
    cost = 50,
    weight = 0.05,
    discovered = true,
    draw_hand = false,
    kind = 'furrypacks',

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('14588E'), special_colour = HEX('24FFF6'), contrast = 5} end,
    create_UIBox = function(self)
        local _size = SMODS.OPENED_BOOSTER.ability.extra
        G.pack_cards = CardArea(
            G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
            math.max(1,math.min(_size,5))*G.CARD_W*1.1,
            1.05*G.CARD_H, 
            {card_limit = _size, type = 'consumeable', highlight_limit = 1})

        local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                        {n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
            {n=G.UIT.R, config={align = "cm"}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Special Furry Pack'}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {'Choose '}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.DARK_EDITION},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                    }),}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
        return t
    end,

    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.FUR_MYTHIC, G.C.DARK_EDITION, darken(G.C.DARK_EDITION, 0.2), darken(G.C.FUR_MYTHIC, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

    create_card = function(self, card)
        local edition = poll_edition('standard_edition'..G.GAME.round_resets.ante, 2, false, true)
        local card = create_card('mythicfurries', G.pack_cards, nil, nil, nil, nil, nil, 'mythic')
        local eternal_perishable_poll = pseudorandom((G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
        if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
            card:set_eternal(true)
        elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
            card:set_perishable(true)
        end
        if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
            card:set_rental(true)
        end

		card:set_edition(edition, true)
        return card
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra, card.ability.choose}}
    end
}