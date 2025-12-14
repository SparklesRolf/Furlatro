local furry_mod = SMODS.current_mod
local config = furry_mod.config

local exoplanet = function(self, card, badges) -- Planet Badge, From SixSuits
    badges[#badges + 1] = create_badge('Exoplanet', get_type_colour(self or card.config, card), nil, 1.2)
end

local nemzbow = function(self, card, badges) -- Nemz's Bow Badge, From SixSuits
    badges[#badges+1] = create_badge("Nemz\'s Bow", G.C.FUR_NEMZATA, G.C.WHITE, 1)
end

local thevoid = function(self, card, badges) -- ???, From SixSuits
    badges[#badges + 1] = create_badge('???', G.C.FUR_CORRUPT, nil, 1.2)
end

-- Tarots
SMODS.Consumable { -- Falling Star
    key = 'fallingstar',
    set = 'Tarot',
    atlas = 'consumables',
    pos = { x = 0, y = 0 },
    config = { extra = { suit_conv = "fur_stars", amount = 3 }},
    cost = 3,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.1, func = function() G.hand.highlighted[i]:change_suit("fur_stars");return true end }))
        end
        delay ( 0.5 )
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
        end
        G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.2, func = function() G.hand:unhighlight_all(); return true end }))
        delay( 0.5 )
    end,
    
    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.amount, localize('fur_stars', 'suits_plural')}}
    end

}

SMODS.Consumable { -- Playing Socks
    key = 'playingsocks',
    set = 'Tarot',
    atlas = 'consumables',
    pos = { x = 2, y = 0 },
    config = { extra = { mod_conv = 'm_fur_sockcard', amount = 2 }},
    cost = 3,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.1, func = function() G.hand.highlighted[i]:set_ability(G.P_CENTERS[card.ability.extra.mod_conv]);return true end }))
        end
        delay ( 0.5 )
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
            card:set_sprites(self)
        end
        G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.2, func = function() G.hand:unhighlight_all(); return true end }))
        delay( 0.5 )
    end,
    
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_sockcard
        return { vars = {center.ability.extra.amount}}
    end
}

SMODS.Consumable { -- Treasure Chest
    key = 'treasurechest',
    set = 'Tarot',
    atlas = 'consumables',
    pos = { x = 3, y = 0 },
    config = { extra = { mod_conv = 'm_fur_silvercard', amount = 3 }},
    cost = 3,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.1, func = function() G.hand.highlighted[i]:set_ability(G.P_CENTERS[card.ability.extra.mod_conv]);return true end }))
        end
        delay( 0.5 )
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
            card:set_sprites(self)
        end
        G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.2, func = function() G.hand:unhighlight_all(); return true end }))
        delay( 0.5 )
    end,

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_fur_silvercard
        return { vars = {center.ability.extra.amount}}
    end
}

SMODS.Consumable { -- Nemz's Bow
    key = 'nemzsbow',
    set = 'jokerconsumables',
    atlas = 'consumables',
    pos = { x = 1, y = 0 },
    config = { partnersynergizetrigger = false, extra = { amount = 1, ammo = 3, ammocap = 3 }},
    cost = 0,
    eternal_compat = true,
    discovered = true,
    set_card_type_badge = nemzbow,

    calculate = function(self, card, context)
        if G.GAME.selected_partner == "pnr_fur_nemzatapartner" then
            if not card.ability.partnersynergizetrigger or card.ability.extra.ammocap == 3 then
                card.ability.partnersynergizetrigger = true
                card.ability.extra.ammo = card.ability.extra.ammo + 2
                card.ability.extra.ammocap = card.ability.extra.ammocap + 2
            end
        end

        if context.setting_blind then
            card.ability.extra.ammo = card.ability.extra.ammocap
        end
    end,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.amount and card.ability.extra.ammo > 0 then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        card.ability.extra.ammo = card.ability.extra.ammo - 1

        if SMODS.pseudorandom_probability(card, "c_fur_nemzsbow", 1, 3, "fur_nemzsbow") then
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function() 
                for i = #G.hand.highlighted, 1, -1 do
                    local card = G.hand.highlighted[i]
                    card:start_dissolve(nil, i == #G.hand.highlighted)
                end
                attention_text({
                    text = localize("fur_elim"),
                    major = card,
                    backdrop_colour = G.C.MONEY
                })
                return true 
            end}))
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                play_sound('whoosh2');
                return true 
            end}))
            card:juice_up(0.3, 0.5)
        else
            G.E_MANAGER:add_event(Event({ 
            trigger = 'after', 
            delay = 0.2,
            func = function() 
                G.hand:unhighlight_all();
                attention_text({
                    text = localize("k_nope_ex"),
                    major = card,
                    backdrop_colour = G.C.SECONDARY_SET.Tarot
                })
                return true 
            end}))
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                play_sound('tarot2', 0.76, 0.4);
                return true 
            end}))
            play_sound('tarot2', 1, 0.4)
            card:juice_up(0.3, 0.5)
        end
    end,

    keep_on_use = function(self, card)
        return true
    end,

    add_to_deck = function(self, card, from_debuff)
        if not (card.edition and card.edition.negative) then
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if not (card.edition and card.edition.negative) then
            G.consumeables.config.card_limit = G.consumeables.config.card_limit - 1
        end
    end,

    update = function(self, card, dt)
        if not next(SMODS.find_card("j_fur_nemzata")) then
            if SMODS.is_eternal(card) then
                card.ability.eternal = nil
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        card:start_dissolve()
                    return true
                end)}))
            end
        end
    end,

    loc_vars = function(self, info_queue, center)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 3, 'fur_nemzsbow')

        if center.ability.cry_rigged then
            return { vars = { denominator, denominator, center.ability.extra.amount, center.ability.extra.ammo, center.ability.extra.ammocap }}
        else
            return { vars = { numerator, denominator, center.ability.extra.amount, center.ability.extra.ammo, center.ability.extra.ammocap }}
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

-- Spectrals
SMODS.Consumable { -- King Me!
    key = 'kingme',
    set = 'Spectral',
    atlas = 'consumables',
    pos = { x = 0, y = 1 },
    soul_pos = { x = 0, y = 3 },
    config = { extra = { amount = 5 }},
    cost = 4,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local card = G.hand.highlighted[i]
            if card.base.suit == 'Hearts' then
                local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
                G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
                G.E_MANAGER:add_event( Event ({ func = function()
                    local _suit = 'H_'
                    card:set_base( G.P_CARDS[ _suit..'K' ])
                return true end }))
            elseif card.base.suit == 'Spades' then
                local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
                G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
                G.E_MANAGER:add_event( Event ({ func = function()
                    local _suit = 'S_'
                    card:set_base( G.P_CARDS[ _suit..'K' ])
                return true end }))
            elseif card.base.suit == 'Diamonds' then
                local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
                G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
                G.E_MANAGER:add_event( Event ({ func = function()
                    local _suit = 'D_'
                    card:set_base( G.P_CARDS[ _suit..'K' ])
                return true end }))
            elseif card.base.suit == 'Clubs' then
                local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
                G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
                G.E_MANAGER:add_event( Event ({ func = function()
                    local _suit = 'C_'
                    card:set_base( G.P_CARDS[ _suit..'K' ])
                return true end }))
            else
                local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
                G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot1', percent, 1); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
                G.E_MANAGER:add_event( Event ({ func = function()
                    local _suit = 'fur_Stars_'
                    card:set_base( G.P_CARDS[ _suit..'K' ])
                return true end }))
            end            
        end
        delay ( 1.0 )
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + ( i-0.999 ) / ( #G.hand.highlighted-0.998 ) * 0.3
            G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.15, func = function() G.hand.highlighted[i]:flip(); play_sound( 'tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end }))
        end
        G.E_MANAGER:add_event( Event ({ trigger = 'after', delay = 0.2, func = function() G.hand:unhighlight_all(); return true end }))
        delay( 0.5 )
    end,

    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.amount}}
    end

}

SMODS.Consumable { -- Floofball
    key = 'floofball',
    set = 'Spectral',
    atlas = 'consumables',
    pos = { x = 1, y = 1 },
    soul_pos = { x = 1, y = 3 },
    cost = 4,
    discovered = true,

    can_use = function(self, card)
        if #G.jokers.cards < G.jokers.config.card_limit then
            return true
        end
        return false
    end,

    use = function(self, card, area, copier)
        play_sound('timpani')
        local new_card = create_card("furry", G.jokers, nil, nil, nil, nil, nil, 'floofball')
        new_card:add_to_deck()
        G.jokers:emplace(new_card)
        if G.GAME.dollars ~= 0 then
            ease_dollars(- G.GAME.dollars, true)
        end
    end
}

SMODS.Consumable { -- Notary Stamp (Red)
    key = 'rednotarystamp',
    set = 'Spectral',
    atlas = 'consumables',
    pos = { x = 2, y = 1 },
    soul_pos = { x = 2, y = 3 },
    config = { extra = { amount = 1 }},
    cost = 4,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('tarot1')
                G.hand.highlighted[i]:juice_up(0.3, 0.5)
                return true end }))
        
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                conv_card:set_seal('fur_redpawseal', nil, true)
                return true end }))
        
            delay(0.5)
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        end
    end,

    in_pool = function(self, args)
        if G.GAME.round_resets.ante >= 3 then
            return true
        else 
            return false
        end
    end,

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_SEALS.fur_redpawseal
        return { vars = {center.ability.extra.amount}}
    end
}

SMODS.Consumable { -- Notary Stamp (Blue)
    key = 'bluenotarystamp',
    set = 'Spectral',
    atlas = 'consumables',
    pos = { x = 3, y = 1 },
    soul_pos = { x = 3, y = 3 },
    config = { extra = { amount = 1 }},
    cost = 4,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('tarot1')
                G.hand.highlighted[i]:juice_up(0.3, 0.5)
                return true end }))
        
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                conv_card:set_seal('fur_bluepawseal', nil, true)
                return true end }))
        
            delay(0.5)
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        end
    end,

    in_pool = function(self, args)
        if G.GAME.round_resets.ante >= 3 then
            return true
        else 
            return false
        end
    end,

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_SEALS.fur_bluepawseal
        return { vars = {center.ability.extra.amount}}
    end
}

SMODS.Consumable { -- Notary Stamp (Orange)
    key = 'orangenotarystamp',
    set = 'Spectral',
    atlas = 'consumables',
    pos = { x = 4, y = 1 },
    soul_pos = { x = 4, y = 3 },
    config = { extra = { amount = 1 }},
    cost = 4,
    discovered = true,

    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.amount then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('tarot1')
                G.hand.highlighted[i]:juice_up(0.3, 0.5)
                return true end }))
        
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                conv_card:set_seal('fur_orangepawseal', nil, true)
                return true end }))
        
            delay(0.5)
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        end
    end,

    in_pool = function(self, args)
        if G.GAME.round_resets.ante >= 6 then
            return true
        else 
            return false
        end
    end,

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_SEALS.fur_orangepawseal
        return { vars = {center.ability.extra.amount}}
    end
}

-- Planets
if not (next(SMODS.find_mod("SixSuits")) or next(SMODS.find_mod("Bunco")) or next(SMODS.find_mod("SpectrumFramework")) or next(SMODS.find_mod("Multiplayer"))) then
    if Talisman then
        if config.poker_hands then 
            SMODS.Consumable { -- Kepler-62e
                key = 'kepler62e',
                set = 'Planet',
                atlas = 'consumables',
                pos = { x = 0, y = 2 },
                config = { hand_type = 'fur_spectrum' },
                cost = 3,
                discovered = true,
                set_card_type_badge = exoplanet,
        
                can_use = function(self, card)
        		    return true
        	    end,
            
                loc_vars = function(self, info_queue, center)
                    return { vars = {
                        number_format(G.GAME.hands["fur_spectrum"].level), 
                        colours = {(
        				    to_number(G.GAME.hands["fur_spectrum"].level) == 1 and G.C.UI.TEXT_DARK
        					or G.C.HAND_LEVELS[to_number(math.min(7, G.GAME.hands["fur_spectrum"].level))]
        			    )},
                    }}
                end
            }
        
            SMODS.Consumable { -- Kepler-62f
                key = 'kepler62f',
                set = 'Planet',
                atlas = 'consumables',
                pos = { x = 1, y = 2 },
                config = { hand_type = 'fur_straightspectrum' },
                cost = 3,
                discovered = true,
                set_card_type_badge = exoplanet,
        
                can_use = function(self, card)
        		    return true
        	    end,
            
                loc_vars = function(self, info_queue, center)
                    return { vars = {
                        number_format(G.GAME.hands["fur_straightspectrum"].level), 
                        colours = {(
        				    to_number(G.GAME.hands["fur_straightspectrum"].level) == 1 and G.C.UI.TEXT_DARK
        				    or G.C.HAND_LEVELS[to_number(math.min(7, G.GAME.hands["fur_straightspectrum"].level))]
        			    )},
                    }}
                end
            }
        
            SMODS.Consumable { -- Kepler-22b
                key = 'kepler22b',
                set = 'Planet',
                atlas = 'consumables',
                pos = { x = 2, y = 2 },
                config = { hand_type = 'fur_spectrumhouse', softlock = true },
                softlock = true,
                cost = 3,
                discovered = true,
                set_card_type_badge = exoplanet,
        
                can_use = function(self, card)
        		    return true
        	    end,
            
                loc_vars = function(self, info_queue, center)
                    return { vars = {
                        number_format(G.GAME.hands["fur_spectrumhouse"].level), 
                        colours = {(
        				    to_number(G.GAME.hands["fur_spectrumhouse"].level) == 1 and G.C.UI.TEXT_DARK
        				    or G.C.HAND_LEVELS[to_number(math.min(7, G.GAME.hands["fur_spectrumhouse"].level))]
        			    )},
                    }}
                end
            }
        
            SMODS.Consumable { -- Kepler-20e
                key = 'kepler20e',
                set = 'Planet',
                atlas = 'consumables',
                pos = { x = 3, y = 2 },
                config = { hand_type = 'fur_spectrumfive', softlock = true },
                softlock = true,
                cost = 3,
                discovered = true,
                set_card_type_badge = exoplanet,
        
                can_use = function(self, card)
        		    return true
        	    end,
            
                loc_vars = function(self, info_queue, center)
                    return { vars = {
                        number_format(G.GAME.hands["fur_spectrumfive"].level),
                        colours = {(
        				    to_number(G.GAME.hands["fur_spectrumfive"].level) == 1 and G.C.UI.TEXT_DARK
        				    or G.C.HAND_LEVELS[to_number(math.min(7, G.GAME.hands["fur_spectrumfive"].level))]
        			    )},
                    }}
                end
            }
        end
    else
        if config.poker_hands then 
            SMODS.Consumable { -- Kepler-62e
                key = 'kepler62e',
                set = 'Planet',
                atlas = 'consumables',
                pos = { x = 0, y = 2 },
                config = { hand_type = 'fur_spectrum' },
                cost = 3,
                discovered = true,
                set_card_type_badge = exoplanet,
        
                can_use = function(self, card)
        		    return true
        	    end,
            
                loc_vars = function(self, info_queue, center)
                    return { vars = {
                        number_format(G.GAME.hands["fur_spectrum"].level), 
                        colours = {(
        				    G.GAME.hands["fur_spectrum"].level == 1 and G.C.UI.TEXT_DARK
        					or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["fur_spectrum"].level)]
        			    )},
                    }}
                end
            }
        
            SMODS.Consumable { -- Kepler-62f
                key = 'kepler62f',
                set = 'Planet',
                atlas = 'consumables',
                pos = { x = 1, y = 2 },
                config = { hand_type = 'fur_straightspectrum' },
                cost = 3,
                discovered = true,
                set_card_type_badge = exoplanet,
        
                can_use = function(self, card)
        		    return true
        	    end,
            
                loc_vars = function(self, info_queue, center)
                    return { vars = {
                        number_format(G.GAME.hands["fur_straightspectrum"].level), 
                        colours = {(
        				    G.GAME.hands["fur_straightspectrum"].level == 1 and G.C.UI.TEXT_DARK
        				    or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["fur_straightspectrum"].level)]
        			    )},
                    }}
                end
            }
        
            SMODS.Consumable { -- Kepler-22b
                key = 'kepler22b',
                set = 'Planet',
                atlas = 'consumables',
                pos = { x = 2, y = 2 },
                config = { hand_type = 'fur_spectrumhouse', softlock = true },
                softlock = true,
                cost = 3,
                discovered = true,
                set_card_type_badge = exoplanet,
        
                can_use = function(self, card)
        		    return true
        	    end,
            
                loc_vars = function(self, info_queue, center)
                    return { vars = {
                        number_format(G.GAME.hands["fur_spectrumhouse"].level), 
                        colours = {(
        				    G.GAME.hands["fur_spectrumhouse"].level == 1 and G.C.UI.TEXT_DARK
        				    or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["fur_spectrumhouse"].level)]
        			    )},
                    }}
                end
            }
        
            SMODS.Consumable { -- Kepler-20e
                key = 'kepler20e',
                set = 'Planet',
                atlas = 'consumables',
                pos = { x = 3, y = 2 },
                config = { hand_type = 'fur_spectrumfive', softlock = true },
                softlock = true,
                cost = 3,
                discovered = true,
                set_card_type_badge = exoplanet,
        
                can_use = function(self, card)
        		    return true
        	    end,
            
                loc_vars = function(self, info_queue, center)
                    return { vars = {
                        number_format(G.GAME.hands["fur_spectrumfive"].level),
                        colours = {(
        				    G.GAME.hands["fur_spectrumfive"].level == 1 and G.C.UI.TEXT_DARK
        				    or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["fur_spectrumfive"].level)]
        			    )},
                    }}
                end
            }
        end
    end
end

-- Corrupt Cards
SMODS.Consumable { -- ???
    key = 'thedarknessconsumesyou',
    set = 'thedarkness',
    atlas = 'consumables',
    pos = { x = 4, y = 2 },
    config = { selectedjoker = "None" },
    hidden = {
        soul_set = { "Tarot", "Spectral", "Planet" },
        soul_rate = 0.95,
        can_repeat_soul = false,
    },
    cost = 50,
    discovered = false,
    set_card_type_badge = thevoid,

    can_use = function(self, card)
        if #G.jokers.highlighted == 1 then
            for i = 1, #G.jokers.highlighted do
                if G.jokers.highlighted[i].config.center.key == "j_fur_curiousangel" then
                    card.ability.selectedjoker = "j_fur_curiousangel"
                    return true
                elseif G.jokers.highlighted[i].config.center.key == "j_fur_sparkles" then
                    card.ability.selectedjoker = "j_fur_sparkles"
                    return true
                elseif G.jokers.highlighted[i].config.center.key == "j_fur_danny" or G.jokers.highlighted[i].config.center.key == "j_fur_talismandanny" then
                    card.ability.selectedjoker = "j_fur_danny"
                    return true
                elseif G.jokers.highlighted[i].config.center.key == "j_fur_sephirapaws" or G.jokers.highlighted[i].config.center.key == "j_fur_talismansephirapaws" then
                    card.ability.selectedjoker = "j_fur_sephirapaws"
                    return true
                else
                   return false
                end
            end
        end
    end,

    use = function(self, card, area, copier)
        if card.ability.selectedjoker == "j_fur_curiousangel" then
            if Talisman then
                local corruptcard = SMODS.create_card{set = "Jokers", area = G.jokers, skip_materialize = false, key = "j_fur_talismancorruptcuriousangel", no_edition = true }
                G.E_MANAGER:add_event(Event({
                    func = function()
                        corruptcard:start_materialize()
                        G.jokers:emplace(corruptcard)
                        corruptcard:juice_up()
                        save_run()
                    return true
                end}))
            else
                local corruptcard = SMODS.create_card{set = "Jokers", area = G.jokers, skip_materialize = false, key = "j_fur_corruptcuriousangel", no_edition = true }
                G.E_MANAGER:add_event(Event({
                    func = function()
                        corruptcard:start_materialize()
                        G.jokers:emplace(corruptcard)
                        corruptcard:juice_up()
                        save_run()
                    return true
                end}))
            end
        elseif card.ability.selectedjoker == "j_fur_sparkles" then
            if Talisman then
                local corruptcard = SMODS.create_card{set = "Jokers", area = G.jokers, skip_materialize = false, key = "j_fur_talismancorruptsparkles", no_edition = true }
                G.E_MANAGER:add_event(Event({
                    func = function()
                        corruptcard:start_materialize()
                        G.jokers:emplace(corruptcard)
                        corruptcard:juice_up()
                        save_run()
                    return true
                end}))
            else
                local corruptcard = SMODS.create_card{set = "Jokers", area = G.jokers, skip_materialize = false, key = "j_fur_corruptsparkles", no_edition = true }
                G.E_MANAGER:add_event(Event({
                    func = function()
                        corruptcard:start_materialize()
                        G.jokers:emplace(corruptcard)
                        corruptcard:juice_up()
                        save_run()
                    return true
                end}))
            end
        elseif card.ability.selectedjoker == "j_fur_danny" then
            if Talisman then
                local corruptcard = SMODS.create_card{set = "Jokers", area = G.jokers, skip_materialize = false, key = "j_fur_talismancorruptdanny", no_edition = true }
                G.E_MANAGER:add_event(Event({
                    func = function()
                        corruptcard:start_materialize()
                        G.jokers:emplace(corruptcard)
                        corruptcard:juice_up()
                        save_run()
                    return true
                end}))
            else
                local corruptcard = SMODS.create_card{set = "Jokers", area = G.jokers, skip_materialize = false, key = "j_fur_corruptdanny", no_edition = true }
                G.E_MANAGER:add_event(Event({
                    func = function()
                        corruptcard:start_materialize()
                        G.jokers:emplace(corruptcard)
                        corruptcard:juice_up()
                        save_run()
                    return true
                end}))
            end
        elseif card.ability.selectedjoker == "j_fur_sephirapaws" then
            if Talisman then
                local corruptcard = SMODS.create_card{set = "Jokers", area = G.jokers, skip_materialize = false, key = "j_fur_talismancorruptsephirapaws", no_edition = true }
                G.E_MANAGER:add_event(Event({
                    func = function()
                        corruptcard:start_materialize()
                        G.jokers:emplace(corruptcard)
                        corruptcard:juice_up()
                        save_run()
                    return true
                end}))
            else
                local corruptcard = SMODS.create_card{set = "Jokers", area = G.jokers, skip_materialize = false, key = "j_fur_corruptsephirapaws", no_edition = true }
                G.E_MANAGER:add_event(Event({
                    func = function()
                        corruptcard:start_materialize()
                        G.jokers:emplace(corruptcard)
                        corruptcard:juice_up()
                        save_run()
                    return true
                end}))
            end
        end

        local corruptjokers = {}
        for i = 1, #G.jokers.highlighted do
            if G.jokers.highlighted[i].config.center.key == "j_fur_curiousangel" then
                corruptjokers = G.jokers.highlighted[i]
            elseif G.jokers.highlighted[i].config.center.key == "j_fur_sparkles" then
                corruptjokers = G.jokers.highlighted[i]
            elseif G.jokers.highlighted[i].config.center.key == "j_fur_danny" or G.jokers.highlighted[i].config.center.key == "j_fur_talismandanny" then
                corruptjokers = G.jokers.highlighted[i]
            elseif G.jokers.highlighted[i].config.center.key == "j_fur_sephirapaws" or G.jokers.highlighted[i].config.center.key == "j_fur_talismansephirapaws" then
                corruptjokers = G.jokers.highlighted[i]
            else
                break
            end
        end
        
        local jokertocorrupt = corruptjokers
        if jokertocorrupt then
            jokertocorrupt.getting_sliced = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(G.jokers, 'extra', nil, nil, nil, { message = localize("fur_corrupted", 'dictionary'), colour = G.C.FUR_CORRUPT })
                    jokertocorrupt:start_dissolve({ G.C.FUR_CORRUPT }, nil, 1.6)
                    check_for_unlock({ type = "used_???" })
                return true
            end}))
        end
    end,

    in_pool = function(self, args)
        if 
            next(SMODS.find_card("j_fur_sparkles")) or 
            next(SMODS.find_card("j_fur_curiousangel")) or 
            (next(SMODS.find_card("j_fur_danny")) or next(SMODS.find_card("j_fur_talismandanny"))) or
            (next(SMODS.find_card("j_fur_sephirapaws")) or next(SMODS.find_card("j_fur_talismansephirapaws"))) 
        then 
            return true
        else
            return false
        end
    end,

    loc_vars = function() -- loc_vars from VanillaRemade
        local corruptiontexts = {
            "???",
            "The darkness comsumes you!!!",
            "=)",
            "You can\'t run from us!",
            "@#!&*@#$?/>1A",
            "You're gonna have a bad time...",
            "9999999999999999999999999999999",
            "This game seems very, very interesting...",
        }
        main_start = {
            { n = G.UIT.O, config = {
                object = DynaText({
                    string = corruptiontexts,
                    colours = { G.C.FUR_CORRUPT },
                    pop_in_rate = 9999999,
                    silent = true,
                    random_element = true,
                    pop_delay = 0.3022,
                    scale = 0.38,
                    min_cycle_time = 0
                    })
                }
            },
        }
        return { main_start = main_start }
    end,
}
