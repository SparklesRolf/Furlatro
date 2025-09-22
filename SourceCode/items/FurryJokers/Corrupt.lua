local furry_mod = SMODS.current_mod
local config = SMODS.current_mod.config

local corruptangel_lines = { -- CuriousAngel (Corrupt)
    normal = {
        '"What the fuck is your luck?"',
        '"Have you consider going outside?"',
        '"How did you find me.."',
        '"Can this run end faster so i can go back to sleep"',
        '"Stop hovering over me.. it tickles"',
    },
    toggle = {
        '',
    }
}
if Talisman then
    SMODS.Joker {
        key = 'talismancorruptcuriousangel',
        config = {extra = { emult = 5, gain = 5 }},
        atlas = 'corruptfurryjokers',
        pos = { x = 0, y = 0 },
        soul_pos = { x = 1, y = 0 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["corruptfurries"] = true,
        },
        cost = 50,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = false,
        effect = nil,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            local joker = context.other_joker
            local playingcard = context.other_card

            if context.individual and context.cardarea == G.play then
                if not (playingcard.edition or {}).negative then
                    G.E_MANAGER:add_event(Event({
    			        func = function()
    			    	    playingcard:set_edition({negative = true}, true)
    			    	    return true
    			        end
    			    }))

                    return {
                        message = localize("fur_angelnegated"), 
                        colour = G.C.DARK_EDITION
                    }
                else
                    if not context.blueprint then
                        card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.gain

                        return {
                            focus = card,
                            message = localize('k_upgrade_ex'),
                            colour = G.C.FILTER
                        }
                    end
                end
            end

            if context.other_joker and not (joker.edition or {}).negative then
                if context.other_joker.config.center.key ~= "j_fur_talismancorruptcuriousangel" then
                    if context.other_joker.config.center.key ~= "j_fur_talismancorruptsparkles" then
                        G.E_MANAGER:add_event(Event({
    		                func = function()
    			                joker:set_edition({negative = true}, true)
    			                return true
    		                end
    		            }))

                        return {
                            extra = {message = localize("fur_angelnegated"), card = context.other_joker, colour = G.C.DARK_EDITION}
                        }
                    end
                end
            end

            if context.joker_main and context.cardarea == G.jokers then
                if card.ability.extra.emult ~= 1 then
                    return {
                        mult = mod_mult(mult ^ card.ability.extra.emult),
                        remove_default_message = true,
                        message = '^' .. card.ability.extra.emult .. ' Mult',
                        sound = 'fur_emult',
                        colour = G.C.DARK_EDITION
                    }
                end
            end
        end,

        loc_vars = function(self, info_queue, card)
            if not (card.edition or {}).negative then
                info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
            end

            if config.joker_lines then
                return {vars = {card.ability.extra.emult, card.ability.extra.gain, corruptangel_lines.normal[math.random(#corruptangel_lines.normal)], localize('negative', 'labels')}}
            else
                return {vars = {card.ability.extra.emult, card.ability.extra.gain, corruptangel_lines.toggle[math.random(#corruptangel_lines.toggle)], localize('negative', 'labels')}}
            end
        end,

        set_badges = function(self, card, badges)
            if card.config.center.discovered then
                badges[#badges+1] = create_badge(localize("fur_corrupt", 'labels'), G.C.FUR_CORRUPT, G.C.WHITE, 1)
            end
        end
    }
else
    SMODS.Joker {
        key = 'corruptcuriousangel',
        config = {extra = { xmult = 5, gain = 5 }},
        atlas = 'corruptfurryjokers',
        pos = { x = 0, y = 0 },
        soul_pos = { x = 1, y = 0 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["corruptfurries"] = true,
        },
        cost = 50,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = false,
        effect = nil,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end
            local joker = context.other_joker
            local playingcard = context.other_card

            if context.individual and context.cardarea == G.play then
                if not (playingcard.edition or {}).negative then
                    G.E_MANAGER:add_event(Event({
    			        func = function()
    			    	    playingcard:set_edition({negative = true}, true)
    			    	    return true
    			        end
    			    }))

                    return {
                        message = localize("fur_angelnegated"), 
                        colour = G.C.DARK_EDITION
                    }
                else
                    if not context.blueprint then
                        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

                        return {
                            focus = card,
                            message = localize('k_upgrade_ex'),
                            colour = G.C.FILTER
                        }
                    end
                end
            end

            if context.other_joker and not (joker.edition or {}).negative then
                if context.other_joker.config.center.key ~= "j_fur_corruptcuriousangel" then
                    if context.other_joker.config.center.key ~= "j_fur_corruptsparkles" then
                        G.E_MANAGER:add_event(Event({
    		                func = function()
    			                joker:set_edition({negative = true}, true)
    			                return true
    		                end
    		            }))

                        return {
                            extra = {message = localize("fur_angelnegated"), card = context.other_joker, colour = G.C.DARK_EDITION}
                        }
                    end
                end
            end

            if context.joker_main and context.cardarea == G.jokers then
                return {
                    xmult = card.ability.extra.xmult,
                    colour = G.C.MULT
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            if not (card.edition or {}).negative then
                info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
            end

            if config.joker_lines then
                return {vars = {card.ability.extra.xmult, card.ability.extra.gain, corruptangel_lines.normal[math.random(#corruptangel_lines.normal)], localize('negative', 'labels')}}
            else
                return {vars = {card.ability.extra.xmult, card.ability.extra.gain, corruptangel_lines.toggle[math.random(#corruptangel_lines.toggle)], localize('negative', 'labels')}}
            end
        end,

        set_badges = function(self, card, badges)
            if card.config.center.discovered then
                badges[#badges+1] = create_badge(localize("fur_corrupt", 'labels'), G.C.FUR_CORRUPT, G.C.WHITE, 1)
            end
        end
    }
end

local corruptsparkles_lines = { -- SparklesRolf (Hate)
    normal = {
        '=)',
        "Let's turn these cards into dust...",
        "Moreee....MOREEEEEEEE",
        "Let's erase this save once and for all",
        "Determination.",
    },
    toggle = {
        '',
    }
}
if Talisman then
    SMODS.Joker {
        key = 'talismancorruptsparkles',
        config = {extra = { emult = 9.99, levelupamount = 1 }},
        atlas = 'corruptfurryjokers',
        pos = { x = 2, y = 0 },
        soul_pos = { x = 3, y = 0 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["corruptfurries"] = true,
        },
        cost = 50,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = false,
        effect = nil,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end

            if context.destroy_card and context.destroy_card:is_suit("Hearts") and context.cardarea == G.play then
                return {
                    remove = true,
                    mult = mod_mult(mult ^ card.ability.extra.emult),
                    level_up = card.ability.extra.levelupamount,
                    remove_default_message = true,
                    message = '^' .. card.ability.extra.emult .. ' Mult',
                    sound = 'fur_emult',
                    colour = G.C.DARK_EDITION
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return {vars = {card.ability.extra.emult, card.ability.extra.levelupamount, corruptsparkles_lines.normal[math.random(#corruptsparkles_lines.normal)], localize('Hearts', 'suits_plural'), colours = {HEX("FF0000")}}}
            else
                return {vars = {card.ability.extra.emult, card.ability.extra.levelupamount, corruptsparkles_lines.toggle[math.random(#corruptsparkles_lines.toggle)], localize('Hearts', 'suits_plural'), colours = {HEX("FF0000")}}}
            end
        end,

        set_badges = function(self, card, badges)
            if card.config.center.discovered then
                badges[#badges+1] = create_badge(localize("fur_corrupt", 'labels'), G.C.FUR_CORRUPT, G.C.WHITE, 1)
            end
        end
    }
else
    SMODS.Joker {
        key = 'corruptsparkles',
        config = {extra = { xmult = 9.99, levelupamount = 1 }},
        atlas = 'corruptfurryjokers',
        pos = { x = 2, y = 0 },
        soul_pos = { x = 3, y = 0 },
        rarity = 'fur_rarityfurry',
        pools = {
            ["corruptfurries"] = true,
        },
        cost = 50,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = false,
        effect = nil,
        saracrossing = true,

        calculate = function(self, card, context)
            if card.debuff then return nil end

            if context.destroy_card and context.destroy_card:is_suit("Hearts") and context.cardarea == G.play then
                return {
                    remove = true,
                    xmult = card.ability.extra.xmult,
                    level_up = card.ability.extra.levelupamount,
                    colour = G.C.MULT
                }
            end
        end,

        loc_vars = function(self, info_queue, card)
            if config.joker_lines then
                return {vars = {card.ability.extra.xmult, card.ability.extra.levelupamount, corruptsparkles_lines.normal[math.random(#corruptsparkles_lines.normal)], localize('Hearts', 'suits_plural'), colours = {HEX("FF0000")}}}
            else
                return {vars = {card.ability.extra.xmult, card.ability.extra.levelupamount, corruptsparkles_lines.toggle[math.random(#corruptsparkles_lines.toggle)], localize('Hearts', 'suits_plural'), colours = {HEX("FF0000")}}}
            end
        end,

        set_badges = function(self, card, badges)
            if card.config.center.discovered then
                badges[#badges+1] = create_badge(localize("fur_corrupt", 'labels'), G.C.FUR_CORRUPT, G.C.WHITE, 1)
            end
        end
    }
end