local deckBuilder = require("src.core.deck")
local handManager = require("src.core.hand")

local gamestate = menu;

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
  hand = handManager.drawCards(deck, hand)
  for i = 1, #hand do
    logPrint("Card " .. i .. ": " .. hand[i].rank .. " of " .. hand[i].suit .. " (Power: " .. hand[i].power .. ", Chips: " .. hand[i].chips .. ")")
  end
end