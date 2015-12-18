function onAdvance(player, skill, oldlevel, newlevel)
	if skill == 8 then
		if newlevel == 10 then
			local modalId = 5201
			local modalTitulo = "Parab�ns pelo n�vel 10!"
			local modalMensagem = "Voc� atingiu o n�vel m�nimo recomendado para sair da ilha!\n\n"
			modalMensagem = modalMensagem .. "Caso voc� ainda n�o tenha feito, sugerimos que v� at� "
			modalMensagem = modalMensagem .. "o mestre de sua guilda, '" .. pegarNpcReputacao(player:getVocation():getId()) .. "', "
			modalMensagem = modalMensagem .. "e pergunte a ele sobre 'tarefas' para que voc� possa "
			modalMensagem = modalMensagem .. "juntar " .. Reputacao.promocao .. " pontos de reputa��o "
			modalMensagem = modalMensagem .. "necess�rios para a sua promo��o no n�vel 20.\n\nAlgumas "
			modalMensagem = modalMensagem .. "tarefas s�o bem f�ceis de fazer e d�o exatamente a "
			modalMensagem = modalMensagem .. "quantidade de pontos que voc� precisa.\n\nSe quiser "
			modalMensagem = modalMensagem .. "treinar mais aqui, voc� podecontinuar nessa ilha por "
			modalMensagem = modalMensagem .. "quanto tempo quiser e semprepoder� viajar de volta.\n\n"
			modalMensagem = modalMensagem .. "Fique � vontade para explorar, existem diversas �reas de "
			modalMensagem = modalMensagem .. "ca�a espalhadas pela ilha. Se quiser sair e viajar para o "
			modalMensagem = modalMensagem .. "continente principal dirija-se ao Navio localizadono leste "
			modalMensagem = modalMensagem .. "da ilha."
			local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
			modal:addButton(1, "Ok")
			modal:setDefaultEnterButton(1)
			modal:addButton(2, "Sair")
			modal:setDefaultEscapeButton(2)
			modal:sendToPlayer(player)
			modalRecompensaAberto[player:getId()] = 0
			player:registerEvent("ModalInformativo")
		end

		if newlevel == 20 then
			local modalPromotion = 5200
			local modalTitulo = "Promova a sua Voca��o!"
			local modalMensagem = "Voc� j� possui level para receber uma promo��o!\n\nAssim que conseguir " .. Reputacao.promocao .. " pontos de reputa��o fale com o mestre da sua guilda, '" .. pegarNpcReputacao(player:getVocation():getId()) .. "', e pergunte a ele sobre promo��o.\n\nVoc� pode conseguir pontos de reputa��o ap�s concluir algumas tarefas."
			local modal = ModalWindow(modalPromotion, modalTitulo, modalMensagem)
			modal:addButton(1, "Ok")
			modal:setDefaultEnterButton(1)
			modal:addButton(2, "Sair")
			modal:setDefaultEscapeButton(2)
			modal:sendToPlayer(player)
			modalRecompensaAberto[player:getId()] = 0
			player:registerEvent("ModalInformativo")
		end

		eventoAdicionado = false
		for a, b in pairs(RecompensasNivel) do
			if b.nivel == newlevel then
				if b.vocacao == nil or (b.vocacao ~= nil and isInArray(b.vocacao, string.lower(player:getVocation():getName()))) then
					player:adicionarRecompensaPendente(a)
					if not eventoAdicionado then
						player:registerEvent("RecompensaNivel")
						eventoAdicionado = true
					end
				end
			end
		end
	end
	return true
end
