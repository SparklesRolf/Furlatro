local furry_mod = SMODS.current_mod
local config = SMODS.current_mod.config

if config.complex_jokers then -- Furry Joker Texture Check
    SMODS.Atlas {
        key = 'furryjokers',
        path = 'jokers/ComplexJokers.png',
        px = 71,
        py = 95
    }

    SMODS.Atlas {
        key = 'furryjokers2',
        path = 'jokers/ComplexJokers2.png',
        px = 71,
        py = 95
    }

    SMODS.Atlas {
        key = 'corruptfurryjokers',
        path = 'jokers/ComplexCorruptJokers.png',
        px = 71,
        py = 95
    }
else
    SMODS.Atlas {
        key = 'furryjokers',
        path = 'jokers/Jokers.png',
        px = 71,
        py = 95
    }

    SMODS.Atlas {
        key = 'furryjokers2',
        path = 'jokers/Jokers2.png',
        px = 71,
        py = 95
    }

    SMODS.Atlas {
        key = 'corruptfurryjokers',
        path = 'jokers/CorruptJokers.png',
        px = 71,
        py = 95
    }
end

if CardSleeves then -- CardSleeves
    SMODS.Atlas {
        key = 'sleeves',
        path = 'Sleeves.png',
        px = 73,
        py = 95
    }
end

SMODS.Atlas { -- Achievements
    key = 'achievementtrophies',
    path = 'Trophies.png',
    px = 66,
    py = 66
}

SMODS.Atlas { -- Blinds
    key = 'blinds',
    path = 'Blinds.png',
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    px = 34,
    py = 34,
}

SMODS.Atlas { -- Boosters
    key = 'boosters',
    path = 'Boosters.png',
    px = 71,
    py = 95,
}

SMODS.Atlas { -- Consumables
    key = 'consumables',
    path = 'Consumables.png',
    px = '71',
    py = '95'
}

SMODS.Atlas { -- Decks
    key = 'furrydecks',
    path = 'Decks.png',
    px = 71,
    py = 95,
}

SMODS.Atlas { -- Enhancements
    key = 'enhancements',
    path = 'Enhancements.png',
    px = '71',
    py = '95'
}

SMODS.Atlas { -- Seals
    key = 'furryseals',
    path = 'Seals.png',
    px = 71,
    py = 95
}

SMODS.Atlas { -- Tags
    key = 'furrytags',
    path = 'Tags.png',
    px = 34,
    py = 34,
}

SMODS.Atlas { -- Vanilla Jokers
    key = 'vanillajoker',
    path = 'Jokers/BasicJokers.png',
    px = 71,
    py = 95
}

-- Deck Skins
SMODS.Atlas {
    key = 'clubscollab_lc',
    px = 71,
    py = 95,
    path = 'skins/Clubs.png',
    atlas_table = 'ASSET_ATLAS',
}

SMODS.Atlas {
    key = 'clubscollab_hc',
    px = 71,
    py = 95,
    path = 'skins/Clubs_opt2.png',
    atlas_table = 'ASSET_ATLAS',
}

SMODS.Atlas {
    key = 'diamondscollab_lc',
    px = 71,
    py = 95,
    path = 'skins/Diamonds.png',
    atlas_table = 'ASSET_ATLAS',
}

SMODS.Atlas {
    key = 'diamondscollab_hc',
    px = 71,
    py = 95,
    path = 'skins/Diamonds_opt2.png',
    atlas_table = 'ASSET_ATLAS',
}

SMODS.Atlas {
    key = 'heartscollab_lc',
    px = 71,
    py = 95,
    path = 'skins/Hearts.png',
    atlas_table = 'ASSET_ATLAS',
}

SMODS.Atlas {
    key = 'heartscollab_hc',
    px = 71,
    py = 95,
    path = 'skins/Hearts_opt2.png',
    atlas_table = 'ASSET_ATLAS',
}

SMODS.Atlas {
    key = 'spadescollab_lc',
    px = 71,
    py = 95,
    path = 'skins/Spades.png',
    atlas_table = 'ASSET_ATLAS',
}

SMODS.Atlas {
    key = 'spadescollab_hc',
    px = 71,
    py = 95,
    path = 'skins/Spades_opt2.png',
    atlas_table = 'ASSET_ATLAS',
}

SMODS.Atlas {
    key = 'starscollab_lc',
    px = 71,
    py = 95,
    path = 'skins/Stars.png',
    atlas_table = 'ASSET_ATLAS',
}

SMODS.Atlas {
    key = 'starscollab_hc',
    px = 71,
    py = 95,
    path = 'skins/Stars_opt2.png',
    atlas_table = 'ASSET_ATLAS',
}
