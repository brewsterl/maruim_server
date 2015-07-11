local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

function onCreatureAppear(player)       npcHandler:onCreatureAppear(player)       end
function onCreatureDisappear(player)     npcHandler:onCreatureDisappear(player)       end
function onCreatureSay(player, type, msg)	npcHandler:onCreatureSay(player, type, msg)	end
function onThink()         npcHandler:onThink()           end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end

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
			local exibirPocaoDisponivel = "�o"
			if quantidadeErva > 1 then
				exibirPocaoDisponivel = "�es"
			end
			npcHandler:say("Voc� pode fazer at� " .. quantidadeErva .. " po�" .. exibirPocaoDisponivel .. ". Voc� quer fazer uma quantidade espec�fica ou deseja fazer {tudo}?", cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say("Voc� n�o possui ervas dispon�veis.", cid)
		end
	elseif npcHandler.topic[cid] == 1 then
		local quantidadePocoes = 0
		if isInArray({"all", "todas", "todos", "tudo"}, msg) then
			quantidadePocoes = quantidadeErva
		elseif tonumber(msg) ~= nil then
			quantidadePocoes = tonumber(msg)
		end
		if quantidadePocoes > 0 then
			if player:removeItem(ervaId, quantidadePocoes) then
				player:addItem(pocaoId, quantidadePocoes)
				npcHandler:say("Aqui est�!", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Voc� n�o possui ervas suficiente.", cid)
			end
		end
	end
end

npcHandler:setMessage(MESSAGE_GREET, "Ol� |PLAYERNAME|. Eu posso fazer {po��es} para voc�. Basta me trazer uma erva chamada {heaven blossom}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "At� logo!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())