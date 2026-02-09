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
  deckBuilder.shuffleDeck(deck)
  logPrint("Deck created and shuffled. Total cards: " .. #deck)
  for i = 1, 7 do
    table.insert(hand, deck[i])
    logPrint("Drew card: " .. hand[i].rank .. " of " .. hand[i].suit)
  end
end