local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(player)       npcHandler:onCreatureAppear(player)       end
function onCreatureDisappear(player)     npcHandler:onCreatureDisappear(player)       end
function onCreatureSay(player, type, msg)
	if player:isPromoted() then
		npcHandler:setMessage(MESSAGE_GREET, "Sauda��es |PLAYERNAME|. Est� precisando de ajuda em algo?")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Ol� jovem aprendiz. Se est� preparado para melhorar suas habilidades, eu posso {promover} a sua voca��o.")
	end
	npcHandler:onCreatureSay(player, type, msg)
end
function onThink()         npcHandler:onThink()           end
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if isInArray({"promover", "promo��o", "promocao", "promotion", "promot"}, msg) and player:isPromoted() == false then
		if player:getLevel() < 20 then
			npcHandler:say("Voc� precisa ter pelo menos n�vel 20 para receber uma promo��o.", player)
		elseif player:verificarReputacao() < Reputacao.promocao then
			npcHandler:say("Voc� n�o possui reputa��o suficiente. Volte quando tiver pelo menos reputa��o " .. Reputacao.promocao .. " com a sua voca��o.", player)
		else
			npcHandler:say("Parab�ns! Voc� foi promovido.", player)
			player:promote()
		end
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())