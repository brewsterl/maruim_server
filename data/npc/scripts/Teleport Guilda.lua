local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local valorViagem = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)				end
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
	if isInArray({"travel", "viagem", "viajar", "guilda"}, msg) then
		local acessoLiberado = false

		if Npc():getName() == "Albert" or player:pegarReputacao() >= Reputacao.viagem.acessoLiberado then
			acessoLiberado = true
		end

		if acessoLiberado then
			valorViagem[cid] = 0
			npcHandler:say("Muito bem! Voc� tem certeza que deseja ir?", cid)
		else
			valorViagem[cid] = Reputacao.viagem.valor
			npcHandler:say("Voc� n�o possui reputa��o necess�ria com a sua guilda para viajar gratuitamente. Ser� cobrada uma taxa de " .. valorViagem[cid] .. " gp. Voc� deseja ir?", cid)
		end

		npcHandler.topic[cid] = 1
	elseif isInArray({"yes", "sim"}, msg) and npcHandler.topic[cid] == 1 then
		if not player:removeMoney(valorViagem[cid]) then
			npcHandler:say("Voc� n�o possui dinheiro suficiente.", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:unGreet(cid)
			local vocacao = player:getVocation():getId()

			local posicao
			if isInArray(Vocacoes.sorcerer, vocacao) then
				posicao = {x = 600, y = 983, z = 7}
			elseif isInArray(Vocacoes.druid, vocacao) then
				posicao = {x = 545, y = 948, z = 5}
			elseif isInArray(Vocacoes.paladin, vocacao) then
				posicao = {x = 448, y = 957, z = 2}
			elseif isInArray(Vocacoes.knight, vocacao) then
				posicao = {x = 647, y = 902, z = 8}
			end

			player:teleportarJogador(posicao, true)
		end
	end
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "At� breve!")
npcHandler:setMessage(MESSAGE_FAREWELL, "At� breve, |PLAYERNAME|!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
