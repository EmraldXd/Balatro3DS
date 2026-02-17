local hand = {}

local BASE_HAND_SIZE = 7;

local nextCard = 1

function hand.drawCards(deck, hand)

    local newHand = hand

    if (pcall(#hand)) then
        cardsInHand = #hand
    else
        cardsInHand = 0
    end

    local cardsNeeded = BASE_HAND_SIZE - cardsInHand

    for i = 1, cardsNeeded do
        -- If this is the first card it goes straight into the hand
        if cardsInHand == 0 then
            table.insert(hand, deck[nextCard])
            cardsInHand = 1;
            nextCard = nextCard + 1
        else
            for j = 1, #hand do
                if deck[nextCard].power >= hand[j].power then
                        table.insert(hand, j, deck[nextCard])
                        nextCard = nextCard + 1
                        break;
                else 
                    if j == #hand then
                        table.insert(hand, deck[nextCard])
                        nextCard = nextCard + 1;
                        break;
                    end
                end
            end
        end
    end

    return newHand

end

return hand