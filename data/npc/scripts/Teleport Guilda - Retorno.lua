local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local valorViagem = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)				end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)				end
function onCreatureSay(player, type, msg)
	local teleportGuildaRetorno = player:teleportGuildaPosicaoAnterior()
	local teleportGuildaTempo = player:teleportGuildaTempo()

	if teleportGuildaRetorno > 0 and teleportGuildaTempo then
		local npcRetorno

		if teleportGuildaRetorno == 4 then
			npcRetorno = "Albert"
		else
			npcRetorno = "Lucius"
		end

		npcHandler:setMessage(MESSAGE_GREET, "Ol� |PLAYERNAME|. Voc� pode {retornar} para a sala do meu irm�o '" .. npcRetorno .. "' na cidade onde voc� estava, caso queira.")
		npcHandler:onCreatureSay(player, type, msg)
	else
		addEvent(npcSay, 1000, player:getId(), Npc():getId(), formatarFrase("Ol� |PLAYERNAME|. Sempre que vier para a guilda atrav�s do meu irm�o 'Lucius' ou do 'Albert', fale comigo que eu te mandarei de volta para a cidade onde voc� estava. Mas lembre-se: isso � s� pelos pr�ximos 15 minutos ap�s a viagem!", player:getId()))
	end
end
function onThink()							npcHandler:onThink()							end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if isInArray({"return", "retorno", "retornar"}, msg) then
		local acessoLiberado = false

		if player:pegarReputacao() >= Reputacao.viagem.acessoLiberado then
			acessoLiberado = true
		end

		if acessoLiberado then
			valorViagem[cid] = 0
			npcHandler:say("Muito bem! Voc� tem certeza que deseja ir?", cid)
		else
			valorViagem[cid] = Reputacao.viagem.valorRetorno
			npcHandler:say("Voc� n�o possui reputa��o necess�ria com a sua guilda para viajar gratuitamente. Ser� cobrada uma taxa de " .. valorViagem[cid] .. " gold coins. Voc� deseja ir?", cid)
		end

		npcHandler.topic[cid] = 1
	elseif isInArray({"yes", "sim"}, msg) and npcHandler.topic[cid] == 1 then
		if not player:removeMoney(valorViagem[cid]) then
			npcHandler:say("Voc� n�o possui dinheiro suficiente.", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:unGreet(cid)
			player:teleportarParaGuildaRetorno()
		end
	end
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "At� breve!")
npcHandler:setMessage(MESSAGE_FAREWELL, "At� breve, |PLAYERNAME|!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
