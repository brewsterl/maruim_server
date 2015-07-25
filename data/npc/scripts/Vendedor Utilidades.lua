local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()							npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"backpack"}, 1988, 20, "backpack")
shopModule:addBuyableItem({"pick"}, 2553, 10, "pick")
shopModule:addBuyableItem({"shovel"}, 2554, 20, "shovel")
shopModule:addBuyableItem({"rope"}, 2120, 20, "rope")

npcHandler:setMessage(MESSAGE_GREET, "Ol� |PLAYERNAME|. Seja bem-vindo � minha loja de utilidades.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Est� pensando em ir pra alguma aventura? D� uma olhada aqui.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Adeus!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Nos vemos depois!")

npcHandler:addModule(FocusModule:new())
