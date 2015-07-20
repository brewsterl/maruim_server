local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

local quantidadePocoes = {}

function onCreatureAppear(player)       npcHandler:onCreatureAppear(player)       end
function onCreatureDisappear(player)     npcHandler:onCreatureDisappear(player)       end
function onCreatureSay(player, type, msg)	npcHandler:onCreatureSay(player, type, msg)	end
function onThink()         npcHandler:onThink()           end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end

local function exibirQuantidadePocaoDisponivel(quantidade, marcarNumero)
	local exibirQuantidadePocaoDisponivel = "�o"
	if quantidade > 1 then
		exibirQuantidadePocaoDisponivel = "�es"
	end
	if marcarNumero then
		quantidade = "{" .. quantidade .. "}"
	end
	return quantidade .. " po�" .. exibirQuantidadePocaoDisponivel
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local ervaId = 5921
	local pocaoId = 8704
	local quantidadeErva = player:getItemCount(ervaId)
	if isInArray({"potion", "pocao", "po��o", "pocoes", "po��es"}, msg) then
		if quantidadeErva > 0 then
			npcHandler:say("Voc� pode fazer at� " .. exibirQuantidadePocaoDisponivel(quantidadeErva, true) .. ". Voc� quer fazer uma {quantidade} espec�fica ou deseja fazer {tudo}?", cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say("Voc� n�o possui ervas dispon�veis.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 1 then
		if isInArray({"all", "todas", "todos", "tudo"}, msg) then
			quantidadePocoes[cid] = quantidadeErva
		elseif tonumber(msg) ~= nil then
			quantidadePocoes[cid] = tonumber(msg)
		end
		if quantidadePocoes[cid] > 0 then
			npcHandler:say("Voc� deseja fazer " .. exibirQuantidadePocaoDisponivel(quantidadePocoes[cid]) .. "?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif npcHandler.topic[cid] == 2 then
		if isInArray({"yes", "sim"}, msg) then
			if player:removeItem(ervaId, quantidadePocoes[cid]) then
				player:addItem(pocaoId, quantidadePocoes[cid])
				npcHandler:say("Prontinho! Fa�a um bom uso!", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Voc� n�o possui ervas suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif isInArray({"no", "n�o", "nao"}, msg) then
			npcHandler:say("Tudo bem. Quando quiser fazer {po��es} volte a falar comigo!", cid)
			npcHandler.topic[cid] = 1
		end
	end
end

keywordHandler:addKeywords({{'erva'}, {'heaven blossom'}}, StdModule.say, {npcHandler = npcHandler, text = "A heaven blossom � uma erva excelente na cria��o de {po��es} de cura. Voc� pode colet�-la em diversos locais da Maruim Island, basta selecionar a op��o 'use' em cima de uma que esteja brilhando."})
keywordHandler:addKeyword({'quantidade'}, StdModule.say, {npcHandler = npcHandler, text = "Quantas po��es deseja fazer?"})

npcHandler:setMessage(MESSAGE_GREET, "Ol� |PLAYERNAME|. Eu posso fazer {po��es} para voc�. Basta me trazer uma {erva} chamada {heaven blossom}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "At� logo!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())