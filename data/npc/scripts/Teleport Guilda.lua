local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local valorViagem = {}

function onCreatureAppear(cid)
	Npc():gravarTeleportadorGuilda()
	npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)				end
function onCreatureSay(player, type, msg)
	npcHandler:setMessage(MESSAGE_GREET, "Ol� |PLAYERNAME|. Eu posso te levar para a sua {guilda}.")
	npcHandler:onCreatureSay(player, type, msg)
end
function onThink()							npcHandler:onThink()							end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	local npc = Npc()
	local npcName = npc:getName()
	if isInArray({"travel", "viagem", "viajar", "guilda"}, msg) then
		local acessoLiberado = false

		if npcName == "Albert" or player:pegarReputacao() >= Reputacao.viagem.acessoLiberado then
			acessoLiberado = true
		end

		if acessoLiberado then
			valorViagem[cid] = 0
			npcHandler:say("Muito bem! Voc� tem certeza que deseja ir?", cid)
		else
			valorViagem[cid] = Reputacao.viagem.valor
			npcHandler:say("Voc� n�o possui reputa��o necess�ria com a sua guilda para viajar gratuitamente. Ser� cobrada uma taxa de " .. valorViagem[cid] .. " gold coins. Voc� deseja ir?", cid)
		end

		npcHandler.topic[cid] = 1
	elseif isInArray({"yes", "sim"}, msg) and npcHandler.topic[cid] == 1 then
		if not player:removeMoney(valorViagem[cid]) then
			npcHandler:say("Voc� n�o possui dinheiro suficiente.", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Durante os pr�ximos 15 minutos voc� poder� falar com meu irm�o 'Dorius' que ele te mandar� novamente para essa sala. At� breve!", cid)
			npcHandler:unGreet(cid)

			local storageValue
			local npcId = npc:getId()

			for a, b in pairs(teleportadorGuilda.idsTeleportadorGuilda) do
				if npcId == b then
					storageValue = a
				end
			end

			player:setStorageValue(Storage.teleportGuildaRetorno, storageValue)
			player:setStorageValue(Storage.teleportGuildaRetornoTempo, os.time())

			player:teleportarParaGuilda(true)
		end
	end
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "At� breve!")
npcHandler:setMessage(MESSAGE_FAREWELL, "At� breve, |PLAYERNAME|!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
