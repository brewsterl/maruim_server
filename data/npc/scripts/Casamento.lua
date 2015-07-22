local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

local function greetCallback(cid)
	local player = Player(cid)
	local msg = 'Seja bem-vindo, ' .. player:getName() .. '.'

	local playerStatus = getPlayerMarriageStatus(player:getGuid())
	local playerSpouse = getPlayerSpouse(player:getGuid())
	if (playerStatus == MARRIED_STATUS) then
		msg = msg .. ' Eu vejo que voc� est� muito feliz casad' .. ((player:getSex() == PLAYERSEX_FEMALE) and 'a' or 'o') .. '. O que voc� faz por aqui? Procurando por um {div�rcio}?'
	elseif (playerStatus == PROPOSED_STATUS) then
		msg = msg .. ' Voc� ainda est� esperando a proposta de casamento que fez para {' .. (getPlayerNameById(playerSpouse)) .. '}. Voc� gostaria de {remover} o pedido?'
	else
		msg = msg .. ' O que voc� faz por aqui? Quer {casar} com algu�m?'
	end
	npcHandler:say(msg,cid)
	npcHandler:addFocus(cid)
	return false
end

local function confirmRemoveEngage(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local playerStatus = getPlayerMarriageStatus(player:getGuid())
	local playerSpouse = getPlayerSpouse(player:getGuid())
	if playerStatus == PROPOSED_STATUS then
		npcHandler:say('Voc� tem certeza que deseja remover sua proposta de casamento para {' .. getPlayerNameById(playerSpouse) .. '}?', cid)
		node:addChildKeywords({{'no'}, {'nao'}, {'n�o'}}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 3, text = 'Tudo bem, vamos deixar assim ent�o.'})

		local function removeEngage(cid, message, keywords, parameters, node)
			local player = Player(cid)
			player:addItem(ITEM_WEDDING_RING, 1)
			player:addItem(ITEM_WEDDING_OUTFIT_BOX, 1)
			setPlayerMarriageStatus(player:getGuid(), 0)
			setPlayerSpouse(player:getGuid(), -1)
			npcHandler:say(parameters.text, cid)
			keywordHandler:moveUp(parameters.moveup)
		end
		node:addChildKeywords({{'yes'}, {'sim'}}, removeEngage, {moveup = 3, text = "Sua proposta de casamento para {" .. getPlayerNameById(playerSpouse) .. "} foi removida. Aqui est� seu 'wedding ring' e sua 'wedding outfit box' de volta."})
	else
		npcHandler:say('Voc� n�o possui nenhuma proposta de casamento pendentes para remover.', cid)
		keywordHandler:moveUp(2)
	end
	return true
end

local function confirmDivorce(cid, message, keywords, parameters, node)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local player = Player(cid)
	local playerStatus = getPlayerMarriageStatus(player:getGuid())
	local playerSpouse = getPlayerSpouse(player:getGuid())
	if playerStatus == MARRIED_STATUS then
		npcHandler:say('Voc� tem certeza que deseja se divorciar de {' .. getPlayerNameById(playerSpouse) .. '}?', cid)
		node:addChildKeywords({{'no'}, {'nao'}, {'n�o'}}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 3, text = 'Maravilha! Casamento deve ser um compromisso eterno.'})

		local function divorce(cid, message, keywords, parameters, node)
			local player = Player(cid)
			local spouse = getPlayerSpouse(player:getGuid())
			setPlayerMarriageStatus(player:getGuid(), 0)
			setPlayerSpouse(player:getGuid(), -1)
			setPlayerMarriageStatus(spouse, 0)
			setPlayerSpouse(spouse, -1)
			if player:getSex() == PLAYERSEX_FEMALE then
				player:removeOutfit(329)
			else
				player:removeOutfit(328)
			end
			local playerSpouse = Player(getPlayerNameById(spouse))
			if playerSpouse then
				if playerSpouse:getSex() == PLAYERSEX_FEMALE then
					playerSpouse:removeOutfit(329)
				else
					playerSpouse:removeOutfit(328)
				end
			end
			npcHandler:say(parameters.text, cid)
			keywordHandler:moveUp(parameters.moveup)
		end
		node:addChildKeywords({{'yes'}, {'sim'}}, divorce, {moveup = 3, text = 'Pronto, voc� se divorciou de {' .. getPlayerNameById(playerSpouse) .. '}. Pense melhor da pr�xima vez que for casar com algu�m.'})
	else
		npcHandler:say('Voc� n�o est� casad' .. ((player:getSex() == PLAYERSEX_FEMALE) and 'a' or 'o') .. ' para se divorciar.', cid)
		keywordHandler:moveUp(2)
	end
	return true
end

local function tryEngage(cid, message, keywords, parameters, node)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	if isInArray({'remove', 'remover'}, message) then
		confirmRemoveEngage(cid, message, keywords, parameters, node)
		return
	elseif isInArray({'divorce', 'divorciar'}, message) then
		confirmDivorce(cid, message, keywords, parameters, node)
		return
	end

	local player = Player(cid)

	local playerStatus = getPlayerMarriageStatus(player:getGuid())
	local playerSpouse = getPlayerSpouse(player:getGuid())
	if playerStatus == MARRIED_STATUS then
		npcHandler:say('Voc� j� est� casad' .. ((player:getSex() == PLAYERSEX_FEMALE) and 'a' or 'o') .. ' com {' .. getPlayerNameById(playerSpouse) .. '}.', cid)
	elseif playerStatus == PROPOSED_STATUS then
		npcHandler:say('Voc� j� fez uma proposta de casamento para {' .. getPlayerNameById(playerSpouse) .. '}. Voc� pode {remover} o pedido, caso queira.', cid)
	else
		local candidate = getPlayerGUIDByName(message)
		if candidate == 0 then
			npcHandler:say('Essa pessoa n�o existe.', cid)
		elseif candidate == player:getGuid() then
			npcHandler:say('Voc� n�o pode casar voc� mesm' .. ((player:getSex() == PLAYERSEX_FEMALE) and 'a' or 'o') .. '.', cid)
		else
			if player:getItemCount(ITEM_WEDDING_RING) == 0 then
				npcHandler:say("Como eu disse, voc� precisa de um 'wedding ring' para se casar.", cid)
			elseif player:getItemCount(ITEM_WEDDING_OUTFIT_BOX) == 0 then
				npcHandler:say("Como eu disse, voc� precisa de uma 'wedding outfit box' para se casar.", cid)
			else
				local candidateStatus = getPlayerMarriageStatus(candidate)
				local candidateSpouse = getPlayerSpouse(candidate)
				if candidateStatus == MARRIED_STATUS then
					npcHandler:say('{' .. getPlayerNameById(candidate) .. '} possui um casamento com {' .. getPlayerNameById(candidateSpouse) .. '}.', cid)
				elseif candidateStatus == PROPOSED_STATUS then
					if candidateSpouse == player:getGuid() then
						npcHandler:say('J� que ambas as jovens almas desejam se casar, eu declaro voc� e {' .. getPlayerNameById(candidate) .. '} casados. {' .. player:getName() .. '}, aqui est�o as alian�as. Pegue uma e d� a outra para ' .. ((player:getSex() == PLAYERSEX_FEMALE) and 'o seu esposo' or 'a sua esposa') .. '.', cid)
						player:removeItem(ITEM_WEDDING_RING, 1)
						player:removeItem(ITEM_WEDDING_OUTFIT_BOX, 1)
						local item1 = Item(doPlayerAddItem(cid, ITEM_ENGRAVED_WEDDING_RING, 1))
						local item2 = Item(doPlayerAddItem(cid, ITEM_ENGRAVED_WEDDING_RING, 1))
						item1:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, player:getName() .. ' & ' .. getPlayerNameById(candidate) .. ' para sempre - casados em ' .. os.date('%d/%m/%Y.'))
						item2:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, player:getName() .. ' & ' .. getPlayerNameById(candidate) .. ' para sempre - casados em ' .. os.date('%d/%m/%Y.'))
						if player:getSex() == PLAYERSEX_FEMALE then
							player:addOutfit(329)
						else
							player:addOutfit(328)
						end
						local playerCandidato = Player(getPlayerNameById(candidate))
						if playerCandidato then
							if playerCandidato:getSex() == PLAYERSEX_FEMALE then
								playerCandidato:addOutfit(329)
							else
								playerCandidato:addOutfit(328)
							end
						end
						setPlayerMarriageStatus(player:getGuid(), MARRIED_STATUS)
						setPlayerMarriageStatus(candidate, MARRIED_STATUS)
						setPlayerSpouse(player:getGuid(), candidate)
					else
						npcHandler:say('{' .. getPlayerNameById(candidate) .. '} j� fez uma proposta de casamento para {' .. getPlayerNameById(candidateSpouse) .. '}.', cid)
					end
				else
					npcHandler:say("Tudo bem, agora vamos aguardar e ver se {" ..  getPlayerNameById(candidate) .. "} aceita a sua proposta. Eu lhe darei seu 'wedding ring' de volta assim que {" ..  getPlayerNameById(candidate) .. "} aceitar sua proposta. Caso n�o aceite, devolverei tamb�m a sua 'wedding outfit box'. Voc� pode {remover} o pedido a qualquer momento.", cid)
					player:removeItem(ITEM_WEDDING_RING, 1)
					player:removeItem(ITEM_WEDDING_OUTFIT_BOX, 1)
					setPlayerMarriageStatus(player:getGuid(), PROPOSED_STATUS)
					setPlayerSpouse(player:getGuid(), candidate)
				end
			end
		end
	end
	keywordHandler:moveUp(3)
	return true
end

local node1 = keywordHandler:addKeywords({{'marry'}, {'casar'}, {'casamento'}}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Voc� gostaria de se casar? Certifique-se de que possui um 'wedding ring' e uma 'wedding outfit box' com voc�."})
for a, b in pairs(node1) do
	b:addChildKeywords({{'no'}, {'nao'}, {'n�o'}}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Sem problemas.'})
	local node2 = b:addChildKeywords({{'yes'}, {'sim'}}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voc� gostaria de casar-se com quem?'})
	for c, d in pairs(node2) do
		d:addChildKeyword({'[%w]'}, tryEngage, {})
	end
end

keywordHandler:addKeywords({{'remove'}, {'remover'}}, confirmRemoveEngage, {})

keywordHandler:addKeywords({{'divorce'}, {'divorcio'}, {'div�rcio'}}, confirmDivorce, {})

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
