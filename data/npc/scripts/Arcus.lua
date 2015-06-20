local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(player, type, msg)
	local fraseNpc = "Ol�, |PLAYERNAME|! Espero que voc� seja um grande alfaiate."
	if player:getStorageValue(Storage.thickFur) ~= 1 then
		fraseNpc = "Ol�, |PLAYERNAME|! Vejo que essa � sua primeira vez por aqui, caso queira, posso te ajudar em sua {alfaiataria}."
	end
	npcHandler:setMessage(MESSAGE_GREET, fraseNpc)
	npcHandler:onCreatureSay(player, type, msg)
end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msg == "alfaiataria" then
		if player:getStorageValue(Storage.thickFur) ~= 1 then
			npcHandler:say("Aqui est�, espero que isso possa lhe ser �til.", cid)
			player:addItem(11224, 2)
			player:setStorageValue(Storage.thickFur, 1)
		end
	end
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "At� mais!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Boa sorte em sua jornada, |PLAYERNAME|!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())