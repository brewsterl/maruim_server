function onStepIn(player, item, position, fromPosition)
	local actionId = item:getActionId()
	local cidade = Town(actionId-4000)
	player:setTown(cidade)
	player:teleportarJogador(cidade:getTemplePosition(), false, true)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� se tornou cidad�o de " .. formatarNomeCidade(cidade:getName()) .. ".")
end