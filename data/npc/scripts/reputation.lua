local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(player)       npcHandler:onCreatureAppear(player)       end
function onCreatureDisappear(player)     npcHandler:onCreatureDisappear(player)       end
function onCreatureSay(player, type, msg)
	local rankReputacao = player:pegarRankReputacao()
	npcHandler:setMessage(MESSAGE_GREET, formatarFraseNpc(Reputacao.ranks[rankReputacao].fraseNpc, player))
	npcHandler:onCreatureSay(player, type, msg)
end
function onThink()         npcHandler:onThink()           end
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local rankReputacao = player:pegarRankReputacao()
	if isInArray({"task", "tasks", "tarefa", "tarefas"}, msg) then
		player:enviarTasksModalPrincipal()
		player:registerEvent("Tasks")
		npcHandler:setMessage(MESSAGE_FAREWELL, "Veja as tarefas dispon�veis, caso precise de mais alguma coisa, volte a falar comigo!")
		npcHandler:unGreet(cid)
	elseif rankReputacao > 1 and isInArray({"promotion", "promot", "promote", "promover", "promo��o", "promocao"}, msg) then
		if player:isPromoted() then
			npcHandler:say("Voc� j� est� promovido.", cid)
		elseif player:getLevel() < 20 then
			npcHandler:say("Voc� precisa ter pelo menos n�vel 20 para receber uma promo��o.", cid)
		else
			npcHandler:say("Parab�ns! Voc� foi promovido.", cid)
			player:promote()
		end
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())