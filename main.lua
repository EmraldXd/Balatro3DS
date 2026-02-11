local deckBuilder = require("src.core.deck")

local log = {}

-- Custom print function to log messages
function logPrint(...)
  local msg = table.concat({...}, " ")
  print(msg)
  table.insert(log, msg)
end

-- Override the default print function to log messages
function love.draw()
  for i, line in ipairs(log) do
    love.graphics.print(line, 10, 10 + i * 14)
  end
end


function love.load()
  local deck = deckBuilder.createDeck()
  local hand = {}
  local began = false
  deckBuilder.shuffleDeck(deck)
  logPrint("Deck created and shuffled. Total cards: " .. #deck)
  for i = 1, 7 do

    -- If it is the first card, we put it in the hand
    if i == 1 then
      table.insert(hand, deck[i])
      goto continue
    end

    -- Any other card we compare with cards already in the hand
    for j = 1, #hand do

      -- If the current card has a lower power, then we insert it
      if deck[i].power > hand[j].power then
        table.insert(hand, j, deck[i])
        break
      else
        if j == #hand then -- If we reach the end of the hand, we just put the current card in the hand
          table.insert(hand, deck[i])
          break
        end
      end
    end
    ::continue::
  end
  for i = 1, #hand do
    logPrint("Card " .. i .. ": " .. hand[i].rank .. " of " .. hand[i].suit .. " (Power: " .. hand[i].power .. ", Chips: " .. hand[i].chips .. ")")
  end
end