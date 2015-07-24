local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(player, type, msg)
	local fraseNpc = "Seja bem-vind" .. player:pegarArtigo(1) .. ", " .. player:getName() .. "."
	local statusCasamento = player:pegarStatusCasamento()
	local conjuge = player:pegarConjuge()
	local propostas = player:pegarPropostas()
	if statusCasamento == STATUS_CASAMENTO_CASADO then
		fraseNpc = fraseNpc .. " Eu vejo que voc� est� muito feliz casad" .. player:pegarArtigo(1) .. ". O que voc� faz por aqui?"
	elseif statusCasamento == STATUS_CASAMENTO_PEDIDO then
		fraseNpc = fraseNpc .. " Voc� ainda est� esperando a proposta de casamento que fez para {" .. (getPlayerNameById(conjuge)) .. "}. Voc� gostaria de {remover} o pedido?"
	elseif statusCasamento == 0 and #propostas > 0 then
		if #propostas == 1 then
			fraseNpc = fraseNpc .. " {" .. propostas[1] .. "} lhe pediu em casamento, voc� pode {aceitar} esse pedido, caso queira."
		else
			local exibirPropostas = exibirPropostas(propostas)
			fraseNpc = fraseNpc .. "Voc� possui " .. #propostas .. " propostas de casamento:\n" .. exibirPropostas .. ". Voc� deseja {casar} com alguma dessas pessoas?"
		end
	else
		fraseNpc = fraseNpc .. " O que voc� faz por aqui? Deseja {casar} com algu�m?"
	end
	npcHandler:setMessage(MESSAGE_GREET, fraseNpc)
	npcHandler:onCreatureSay(player, type, msg)
end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local statusCasamento = player:pegarStatusCasamento()
	local conjuge = player:pegarConjuge()
	local propostas = player:pegarPropostas()
	if npcHandler.topic[cid] == 0 then
		if isInArray({"marry", "marriage", "casar", "casamento"}, msg) then
			if statusCasamento == STATUS_CASAMENTO_PEDIDO then
				npcHandler:say("Voc� j� est� casad" .. player:pegarArtigo(1) .. " com {" .. getPlayerNameById(conjuge) .. "}.", cid)
			elseif statusCasamento == STATUS_CASAMENTO_CASADO then
				npcHandler:say("Voc� j� fez uma proposta de casamento para {" .. getPlayerNameById(conjuge) .. "}. Voc� pode {remover} o pedido, caso queira.", cid)
			else
				npcHandler:say("Para casar com algu�m voc� teve possuir um 'wedding ring' e uma 'wedding outfit box'. Voc� deseja casar?", cid)
				npcHandler.topic[cid] = 1
			end
		elseif isInArray({"remove", "remover", "desfazer"}, msg) then
			local statusCasamento = player:pegarStatusCasamento()
			if statusCasamento == STATUS_CASAMENTO_PEDIDO then
				local conjuge = player:pegarConjuge()
				npcHandler:say("Voc� tem certeza que deseja remover sua proposta de casamento para {" .. getPlayerNameById(conjuge) .. "}?", cid)
				npcHandler.topic[cid] = 3
			else
				npcHandler:say("Voc� n�o possui nenhuma proposta de casamento pendente para remover.", cid)
			end
		elseif isInArray({"divorce", "divorcio", "div�rcio", "divorciar"}, msg) then
			local statusCasamento = player:pegarStatusCasamento()
			if statusCasamento == STATUS_CASAMENTO_CASADO then
				local conjuge = player:pegarConjuge()
				npcHandler:say("Voc� tem certeza que deseja se divorciar de {" .. getPlayerNameById(conjuge) .. "}? Isso lhe custar� " .. CUSTO_DIVORCIO .. " gold.", cid)
				npcHandler.topic[cid] = 4
			else
				npcHandler:say("Voc� n�o est� casad" .. player:pegarArtigo(1) .. " com ningu�m para se divorciar.", cid)
			end
		elseif isInArray({"propostas", "pedidos"}, msg) then
			if #propostas == 0 then
				npcHandler:say("Voc� n�o possui nenhuma proposta de casamento pendente.", cid)
			elseif #propostas == 1 then
				npcHandler:say("{" .. propostas[1] .. "} lhe pediu em casamento, voc� pode {aceitar} ou {recusar} esse pedido.", cid)
			else
				local exibirPropostas = exibirPropostas(propostas)
				npcHandler:say("Voc� possui " .. #propostas .. " propostas de casamento:\n" .. exibirPropostas .. ". Voc� deseja {casar} com alguma dessas pessoas?", cid)
			end
		elseif #propostas == 1 and isInArray({"aceitar"}, msg) then
			npcHandler:say("Confirme o nome da pessoa com quem voc� ir� casar.", cid)
			npcHandler.topic[cid] = 2
		end
	elseif npcHandler.topic[cid] == 1 then
		if isInArray({"yes", "sim"}, msg) then
			npcHandler:say("Muito bem! Com quem voc� quer casar?", cid)
			npcHandler.topic[cid] = 2
		elseif isInArray({"no", "nao", "n�o"}, msg) then
			npcHandler:say("Sem problemas, posso ajud�-lo em alguma outra coisa?", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 2 then
		if isInArray({"desistir"}, msg) then
			npcHandler:say("Sem problemas, posso ajud�-lo em alguma outra coisa?", cid)
			npcHandler.topic[cid] = 0
		else
			local candidatoNome = msg
			local candidatoId = getPlayerGUIDByName(candidatoNome)
			local candidato = Player(candidatoNome)
			if candidatoId == 0 then
				npcHandler:say("Essa pessoa n�o existe, voc� pode {desistir} caso queira.", cid)
			elseif candidatoId == player:getGuid() then
				npcHandler:say("Voc� n�o pode casar com voc� mesm" .. player:pegarArtigo(1) .. ".", cid)
			elseif not candidato then
				npcHandler:say("Essa pessoa n�o est� online, voc� pode {desistir} caso queira.", cid)
			elseif player:getAccountId() == candidato:getAccountId() then
				npcHandler:say("Voc� n�o pode casar com um personagem de sua conta.", cid)
			else
				candidatoNome = candidato:getName()
				if player:getItemCount(ITEM_WEDDING_RING) == 0 then
					npcHandler:say("Voc� precisa de um 'wedding ring' para se {casar}.", cid)
					npcHandler.topic[cid] = 0
				elseif player:getItemCount(ITEM_WEDDING_OUTFIT_BOX) == 0 then
					npcHandler:say("Voc� precisa de uma 'wedding outfit box' para se {casar}.", cid)
					npcHandler.topic[cid] = 0
				else
					local candidatoStatusCasamento = candidato:pegarStatusCasamento()
					local candidatoConjuge = candidato:pegarConjuge()
					if candidatoStatusCasamento == STATUS_CASAMENTO_CASADO then
						npcHandler:say("{" .. candidatoNome .. "} possui um casamento com {" .. getPlayerNameById(candidato:pegarConjuge()) .. "}.", cid)
					elseif candidatoStatusCasamento == STATUS_CASAMENTO_PEDIDO then
						if candidatoConjuge == player:getGuid() then
							npcHandler:say("J� que � da vontade de todos, eu declaro {" .. player:getName() .. "} e {" .. candidatoNome .. '} casados. Muito bem, aqui est�o as alian�as. Pegue uma e d� a outra para ' .. ((player:getSex() == PLAYERSEX_FEMALE) and 'o seu esposo' or 'a sua esposa') .. '.', cid)
							player:getPosition():sendMagicEffect(CONST_ME_HEARTS)
							candidato:sendTextMessage(MESSAGE_INFO_DESCR, "Parab�ns! Seu pedido de casamento para " .. player:getName() .. " foi aceito.")
							candidato:getPosition():sendMagicEffect(CONST_ME_HEARTS)
							player:removeItem(ITEM_WEDDING_RING, 1)
							player:removeItem(ITEM_WEDDING_OUTFIT_BOX, 1)
							local alianca1 = player:addItem(ITEM_ENGRAVED_WEDDING_RING, 1)
							local alianca2 = player:addItem(ITEM_ENGRAVED_WEDDING_RING, 1)
							local descricaoAlianca = player:getName() .. " & " .. candidatoNome .. ' para sempre - casados em ' .. os.date('%d/%m/%Y.')
							alianca1:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, descricaoAlianca)
							alianca2:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, descricaoAlianca)
							if player:getSex() == PLAYERSEX_FEMALE then
								player:addOutfit(329)
								player:mudarOutfit(329)
							else
								player:addOutfit(328)
								player:mudarOutfit(328)
							end
							if candidato:getSex() == PLAYERSEX_FEMALE then
								candidato:addOutfit(329)
								candidato:mudarOutfit(329)
							else
								candidato:addOutfit(328)
								candidato:mudarOutfit(328)
							end
							player:definirConjuge(candidatoId)
							player:definirStatusCasamento(STATUS_CASAMENTO_CASADO)
							candidato:definirStatusCasamento(STATUS_CASAMENTO_CASADO)
							npcHandler.topic[cid] = 0
						else
							npcHandler:say("{" .. candidatoNome .. "} j� fez uma proposta de casamento para {" .. getPlayerNameById(candidatoConjuge) .. "}.", cid)
						end
					else
						npcHandler:say("Tudo bem, agora vamos aguardar e ver se a sua proposta ser� aceita. Voc� pode {remover} o pedido a qualquer momento.", cid)
						player:removeItem(ITEM_WEDDING_RING, 1)
						player:removeItem(ITEM_WEDDING_OUTFIT_BOX, 1)
						player:definirStatusCasamento(STATUS_CASAMENTO_PEDIDO)
						player:definirConjuge(candidatoId)
						candidato:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� recebeu uma proposta de casamento de " .. player:getName() .. ".")
						npcHandler.topic[cid] = 0
					end
				end
			end
		end
	elseif npcHandler.topic[cid] == 3 then
		local conjuge = player:pegarConjuge()
		if isInArray({"yes", "sim"}, msg) then
			npcHandler:say("Sua proposta de casamento para {" .. getPlayerNameById(conjuge) .. "} foi removida. Aqui est� seu 'wedding ring' e sua 'wedding outfit box' de volta.", cid)
			player:addItem(ITEM_WEDDING_RING, 1)
			player:addItem(ITEM_WEDDING_OUTFIT_BOX, 1)
			player:definirStatusCasamento(0)
			player:definirConjuge(0)
			npcHandler.topic[cid] = 0
		elseif isInArray({"no", "nao", "n�o"}, msg) then
			npcHandler:say("Tudo bem, vamos deixar assim ent�o.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 4 then
		local conjugeId = player:pegarConjuge()
		local conjugeNome = getPlayerNameById(conjugeId)
		if isInArray({"yes", "sim"}, msg) then
			local statusCasamento = player:pegarStatusCasamento()
			if statusCasamento == STATUS_CASAMENTO_CASADO then
				if not player:removeMoney(CUSTO_DIVORCIO) then
					npcHandler:say("Voc� n�o possui dinheiro suficiente.", cid)
				else
					npcHandler:say("Pronto, voc� se divorciou de {" .. conjugeNome .. "}. Pense melhor da pr�xima vez que for casar com algu�m.", cid)
					player:desfazerCasamento()
					if player:getSex() == PLAYERSEX_FEMALE then
						player:removerOutfit(329)
					else
						player:removerOutfit(328)
					end
					local conjuge = Player(conjugeNome)
					if conjuge then
						if conjuge:getSex() == PLAYERSEX_FEMALE then
							conjuge:removerOutfit(329)
						else
							conjuge:removerOutfit(328)
						end
					end
				end
			else
				npcHandler:say("Voc� n�o est� casad" .. player:pegarArtigo(1) .. " com ningu�m para se divorciar.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif isInArray({"no", "nao", "n�o"}, msg) then
			npcHandler:say("Tudo bem, vamos deixar assim ent�o.", cid)
			npcHandler.topic[cid] = 0
		end
	end
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "At� mais!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Boa sorte em sua jornada, |PLAYERNAME|!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
