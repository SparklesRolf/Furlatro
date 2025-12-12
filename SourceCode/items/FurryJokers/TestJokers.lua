local furry_mod = SMODS.current_mod
local config = furry_mod.config

SMODS.Joker {
    key = 'xchipstest',
    loc_txt = {
        name = 'XChips Test Joker',
        text = {
            '{X:chips,C:white}X#1#{} chips'
        },
    },
    config = { extra = { xchips = 2 }},
    atlas = 'testjokers',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips,
                colour = G.C.CHIPS
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips }}
    end
}

SMODS.Joker {
    key = 'echipstest',
    loc_txt = {
        name = 'eChips Test Joker',
        text = {
            '{X:dark_edition,C:white}^#1#{} chips'
        },
    },
    config = { extra = { echips = 2 }},
    atlas = 'testjokers',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = mod_chips((hand_chips ^ card.ability.extra.echips) - hand_chips),
                remove_default_message = true,
                message = '^' .. card.ability.extra.echips .. ' Chips',
                sound = 'fur_echip',
                colour = G.C.DARK_EDITION
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.echips }}
    end
}

SMODS.Joker {
    key = 'eechipstest',
    loc_txt = {
        name = 'eeChips Test Joker',
        text = {
            '{X:dark_edition,C:white}^^#1#{} chips'
        },
    },
    config = { extra = { eechips = 2 }},
    atlas = 'testjokers',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = mod_chips((hand_chips:arrow(2, card.ability.extra.eeechips)) - hand_chips),
                remove_default_message = true,
                message = '^^' .. card.ability.extra.eechips .. ' Chips',
                sound = 'fur_eechip',
                colour = G.C.DARK_EDITION
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.eechips }}
    end
}

SMODS.Joker {
    key = 'eeechipstest',
    loc_txt = {
        name = 'eeeChips Test Joker',
        text = {
            '{X:dark_edition,C:white}^^^#1#{} chips'
        },
    },
    config = { extra = { eeechips = 2 }},
    atlas = 'testjokers',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = mod_chips((hand_chips:arrow(3, card.ability.extra.eeechips)) - hand_chips),
                remove_default_message = true,
                message = '^^^' .. card.ability.extra.eeechips .. ' Chips',
                sound = 'fur_eeechip',
                colour = G.C.DARK_EDITION
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.eeechips }}
    end
}

SMODS.Joker {
    key = 'emulttest',
    loc_txt = {
        name = 'eMult Test Joker',
        text = {
            '{X:dark_edition,C:white}^#1#{} Mult'
        },
    },
    config = { extra = { emult = 2 }},
    atlas = 'testjokers',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                mult = mod_mult((mult ^ card.ability.extra.emult) - mult),
                remove_default_message = true,
                message = '^' .. card.ability.extra.emult .. ' Mult',
                sound = 'fur_emult',
                colour = G.C.DARK_EDITION
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.emult }}
    end
}

SMODS.Joker {
    key = 'eemulttest',
    loc_txt = {
        name = 'eeMult Test Joker',
        text = {
            '{X:dark_edition,C:white}^^#1#{} Mult'
        },
    },
    config = { extra = { eemult = 2 }},
    atlas = 'testjokers',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                mult = mod_mult((mult:arrow(2, card.ability.extra.eemult)) - mult),
                remove_default_message = true,
                message = '^^' .. card.ability.extra.eemult .. ' Mult',
                sound = 'fur_eemult',
                colour = G.C.DARK_EDITION
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.eemult }}
    end
}

SMODS.Joker {
    key = 'eeemulttest',
    loc_txt = {
        name = 'eeeMult Test Joker',
        text = {
            '{X:dark_edition,C:white}^^^#1#{} Mult'
        },
    },
    config = { extra = { eeemult = 2 }},
    atlas = 'testjokers',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if card.debuff then return nil end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                mult = mod_mult((mult:arrow(3, card.ability.extra.eeemult)) - mult),
                remove_default_message = true,
                message = '^^^' .. card.ability.extra.eeemult .. ' Mult',
                sound = 'fur_eeemult',
                colour = G.C.DARK_EDITION
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.eeemult }}
    end
}