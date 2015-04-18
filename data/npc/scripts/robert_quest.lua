local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function quest(cid, message, keywords, parameters, node)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local player = Player(cid)
	local nomeJogador = player:getName()
	local storageQuest = 2900
-- if getPlayerItemCount(cid,10934) >= 15 then
-- if doPlayerRemoveItem(cid,10934,15) then
-- npcHandler:say('Pegue seu item!', cid)
-- doPlayerAddItem(cid,10149,1)
-- end
-- else
-- npcHandler:say('Certifique-se de que tem todos os itens!', cid)
-- end
end
local mensagem1 = 'Minha �ltima esperan�a � um ant�doto criado a partir de uma erva chamada Miraculum. Tentei procurar mas n�o posso deixar a Julia sozinha, preciso ficar cuidando dela. Voc� poderia procur�-la para mim?'
local mensagemNegar1 = 'Tudo bem, eu entendo, voc� deve estar cansado.'

local node = keywordHandler:addKeyword({'antidoto'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagem1})
node:addChildKeyword({'yes'}, quest, {npcHandler = npcHandler, onlyFocus = true, reset = true})
node:addChildKeyword({'sim'}, quest, {npcHandler = npcHandler, onlyFocus = true, reset = true})
node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagemNegar1, reset = true})
node:addChildKeyword({'n�o'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagemNegar1, reset = true})
node:addChildKeyword({'nao'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagemNegar1, reset = true})

local node1 = keywordHandler:addKeyword({'ant�doto'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagem1})
node1:addChildKeyword({'yes'}, quest, {npcHandler = npcHandler, onlyFocus = true, reset = true})
node1:addChildKeyword({'sim'}, quest, {npcHandler = npcHandler, onlyFocus = true, reset = true})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagemNegar1, reset = true})
node1:addChildKeyword({'n�o'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagemNegar1, reset = true})
node1:addChildKeyword({'nao'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagemNegar1, reset = true})

npcHandler:addModule(FocusModule:new())