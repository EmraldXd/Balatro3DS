-- set the "power" of each face card for "of a kind" and "straight" evaluations
local RANK_POWER = {
    j = 11,
    q = 12,
    k = 13,
    a = 14
}

-- set the chip value of each face card for point totals
local RANK_CHIPS = {
    j = 10,
    q = 10,
    k = 10,
    a = 11
}

-- Create a card with rank, suit, power, and worth
local cards = {}

function cards.createCard(rank, suit)
    return {
        rank = rank,
        suit = suit,
        power = RANK_POWER[rank] or tonumber(rank),
        chips = RANK_CHIPS[rank] or tonumber(rank)
    }
end

-- Return the card created
return cards