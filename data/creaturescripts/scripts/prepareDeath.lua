function onPrepareDeath(player, lastHitKiller, mostDamageKiller)
	local masmorraId = player:verificarMasmorra()
	if masmorraId > 0 then
		local tempoRetorno = configMasmorras.tempoRetorno
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� morreu. Para voltar para a masmorra um integrante do seu grupo dever� usar o feiti�o 'exura res'. Caso todos os jogadores morram, todos ser�o inseridos automaticamente ap�s " .. formatarTempo(tempoRetorno))
		player:teleportarJogadorSalaMasmorra(masmorraId)
		player:curarJogador()
		player:removerDebuffs()
		player:removeCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)
		if checarLocalizacaoJogadoresMasmorra(masmorraId) == "sala" then
			addEvent(reviverJogadoresMasmorra, tempoRetorno*1000, masmorraId)
		end
		return false
	end
	return true
end
