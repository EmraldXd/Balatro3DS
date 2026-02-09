cardBuilder = require("src.core.cards")

local deck = {}

-- create a deck of 52 cards
function deck.createDeck()
    -- define the suits and ranks for a standard deck of cards
    local suits = {"hearts", "diamonds", "clubs", "spades"}
    -- define the ranks for a deck of cards
    local ranks = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "j", "q", "k", "a"}
    local newDeck = {}
    
    -- iterate through each suit and rank to create a card and add it to the deck
    for _, suit in ipairs(suits) do
        for _, rank in ipairs(ranks) do
            table.insert(newDeck, cardBuilder.createCard(rank, suit))
        end
    end
    
    return newDeck
end

function deck.shuffleDeck(deck)
    -- shuffle the deck
    for i = #deck, 2, -1 do
        local j = math.random(1, i)
        deck[i], deck[j] = deck[j], deck[i]
    end
end

return deck