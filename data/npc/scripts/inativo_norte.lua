local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		return false		end
function onThink() if #npcHandler.focuses == 0 then selfTurn(NORTH) end npcHandler:onThink() end

npcHandler:addModule(FocusModule:new())
