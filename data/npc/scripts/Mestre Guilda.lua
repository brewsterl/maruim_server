local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

function onCreatureAppear(player)		npcHandler:onCreatureAppear(player)		end
function onCreatureDisappear(player)	npcHandler:onCreatureDisappear(player)	end

function onCreatureSay(player, type, msg)
	local reputacao = player:pegarReputacao()

	for a, b in pairs(Reputacao.loja) do
		if reputacao >= b.reputacao then
			local nomeItem = ItemType(a):getName()
			shopModule:addBuyableItem({nomeItem}, a, b.preco, 1, nomeItem)
		end
	end

	local rankReputacao = player:pegarRankReputacao()
	local reputacaoInfo = Reputacao.ranks[rankReputacao]
	local fraseNpc = reputacaoInfo.fraseNpc

	if player:isPromoted() and reputacaoInfo.fraseNpcPromovido ~= nil then
		fraseNpc = reputacaoInfo.fraseNpcPromovido
	end

	npcHandler:setMessage(MESSAGE_GREET, formatarFrase(fraseNpc, player) .. " Voc� pode ir ao {templo} quando quiser, basta pedir.")
	npcHandler:setMessage(MESSAGE_FAREWELL, "At� logo!")
	npcHandler:onCreatureSay(player, type, msg)
end

function onThink()					npcHandler:onThink()					end
function onPlayerEndTrade(cid)		npcHandler:onPlayerEndTrade(cid)		end
function onPlayerCloseChannel(cid)	npcHandler:onPlayerCloseChannel(cid)	end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if isInArray({"task", "tasks", "tarefa", "tarefas"}, msg) then
		player:enviarTasksModalPrincipal()
		player:registerEvent("Tasks")
		npcHandler:setMessage(MESSAGE_FAREWELL, "Veja as tarefas dispon�veis, caso precise de mais alguma coisa, volte a falar comigo!")
		npcHandler:unGreet(cid)
	elseif isInArray({"promotion", "promot", "promote", "promover", "promo��o", "promocao"}, msg) then
		if player:isPromoted() then
			npcHandler:say("Voc� j� est� promovido.", cid)
		elseif player:getLevel() < 20 then
			npcHandler:say("Voc� precisa ter pelo menos n�vel 20 para receber uma promo��o.", cid)
		elseif player:pegarReputacao() < Reputacao.promocao then
			npcHandler:say("Voc� precisa ter pelo menos " .. Reputacao.promocao .. " pontos de reputa��o para receber uma promo��o.", cid)
		else
			npcHandler:say("Parab�ns! Voc� foi promovido.", cid)
			player:promote()
		end
	elseif isInArray({"templo"}, msg) and npcHandler.topic[cid] == 0 then
		npcHandler:say("Deseja ir ao templo?", cid)
		npcHandler.topic[cid] = 1
	elseif isInArray({"yes", "sim"}, msg) and npcHandler.topic[cid] == 1 then
		npcHandler:unGreet(cid)
		player:teleportarJogador({x = 583, y = 911, z = 7}, true)
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
