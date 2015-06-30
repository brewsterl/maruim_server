function onAdvance(player, skill, oldlevel, newlevel)
	if skill == 8 and newlevel == 20 then
		local modalPromotion = 5200
		local modalTitulo = "Promova a sua Voca��o!"
		local modalMensagem = "Voc� j� possui level para receber uma promo��o!\n\nAssim que conseguir " .. Reputacao.promocao .. " pontos de reputa��o fale com o NPC '" .. pegarNpcReputacao(player:getVocation():getId()) .. "', localizado na guilda de sua voca��o, e pergunte a ele sobre promo��o.\n\nVoc� pode conseguir pontos de reputa��o ap�s concluir algumas tarefas."
		local modal = ModalWindow(modalPromotion, modalTitulo, modalMensagem)
		modal:addButton(1, "Ok")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		modal:sendToPlayer(player)
	end
	return true
end
