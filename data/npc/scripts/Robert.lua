local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local storage = 2900

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		if msg == "hi" or msg == "hello" or msg == "oi" or msg == "ol�" or msg == "ola" then
			if getPlayerStorageValue(cid, storage) == -1 then
				npcHandler:say({"Ol� "..player:getName()..". Minha filha e eu est�vamos caminhando pela floresta quando uma criatura a atacou.",
				"Assim que chegamos na cidade procurei por ajuda, mas ningu�m conseguiu cur�-la.",
				"Ouvi boatos de que apenas um {ant�doto} misterioso teria tal poder."}, cid)
				talkState[talkUser] = 1
			elseif getPlayerStorageValue(cid, storage) == 1 then
				npcHandler:say("Voc� encontrou o ant�doto?", cid)
				talkState[talkUser] = 3
			else
				npcHandler:say("Muito obrigado novamente por ter trazido a Miraculum para mim. O ant�doto foi produzido com sucesso ", cid)
			end
			npcHandler:addFocus(cid)
		else
			return false
		end
	end
	if (msgcontains(msg, "antidoto") or msgcontains(msg, "ant�doto")) and talkState[talkUser] == 1 then
		npcHandler:say({"Minha �ltima esperan�a � um ant�doto criado a partir de uma erva chamada Miraculum.",
		"Tentei procur�-la mas n�o posso deixar a Julia sozinha, preciso ficar cuidando dela.",
		"Voc� poderia encontr�-la para mim?"}, cid)
	elseif (msgcontains(msg, "yes") or msgcontains(msg, "sim")) then
		if talkState[talkUser] == 1 then
			npcHandler:say("Muito obrigado, volte quando encontr�-la.", cid)
			setPlayerStorageValue(cid, storage, 1)
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 3 then
			if doPlayerRemoveItem(cid, 12430, 1) then
				npcHandler:say("Muito obrigado, vejo que voc� encontrou a Miraculum. Em agradecimento, falarei com o guarda do castelo para liberar a sua entrada por l�. Boa sorte em sua jornada!", cid)
				setPlayerStorageValue(cid, storage, 2)
			else
				npcHandler:say("Voc� n�o possui a Miraculum.", cid)
			end
		end
	elseif (msgcontains(msg, "no") and ((talkState[talkUser] == 1) or (talkState[talkUser] == 3))) then
		npcHandler:say("Tudo bem...", cid)
		talkState[talkUser] = 0
	elseif ((msgcontains(msg, "bye")) or (msgcontains(msg, "tchau"))) then
		npcHandler:say("Adeus. Tome cuidado pelo caminho!", cid)
		npcHandler:releaseFocus(cid)
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)