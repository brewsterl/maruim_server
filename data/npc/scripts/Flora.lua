local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

local refilId = 1949
local refilAction = 3903
local pocaoId = 8704
local quantidadeMaxPocoes = 5

function onCreatureAppear(player)			npcHandler:onCreatureAppear(player)			end
function onCreatureDisappear(player)		npcHandler:onCreatureDisappear(player)		end

function onCreatureSay(player, type, msg)
	local refil = player:getAllItemsByAction(refilId, refilAction)

	if #refil > 0 then
		local quantidadePocoes = player:getItemCount(pocaoId)
		
		if quantidadePocoes < quantidadeMaxPocoes then
			fraseNpc = "Ol� |PLAYERNAME|. Eu posso fornecer novas {po��es} se voc� estiver precisando."
		else
			fraseNpc = "Ol� aventureiro! Lembre-se: as po��es s�o o melhor rem�dio para curar seus ferimentos rapidamente!"
		end
	end

	npcHandler:setMessage(MESSAGE_GREET, fraseNpc)
	npcHandler:setMessage(MESSAGE_FAREWELL, "At� logo!")
	npcHandler:onCreatureSay(player, type, msg)
end

function onThink()							npcHandler:onThink()						end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	local refil = player:getAllItemsByAction(refilId, refilAction)

	local quantidadePocoes = player:getItemCount(pocaoId)

	if #refil > 0 and quantidadePocoes < quantidadeMaxPocoes and isInArray({"potion", "pocao", "po��o", "pocoes", "po��es"}, msg) then
		player:addItem(pocaoId, quantidadeMaxPocoes - quantidadePocoes)
		npcHandler:say("Prontinho! Fa�a um bom uso!", cid)
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
