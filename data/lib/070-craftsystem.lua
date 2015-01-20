configProfissoes = {
	nivelMaximoProfissao = 100,
	skill = 1,
	skillExp = 2,
	receitasFabricadas = 3,
	receitasFalhadas = 4,
	pontosProfissao = 5,
	aprendizado = 10,
	ultimasReceitasFalhadas = 500,
	modalInfo = 1,
	modalLista1 = 2,
	modalLista2 = 3,
	modalLista3 = 4,
	actionItemDesativado = 2500
}
profissoes = {
	[20000] = {
		nome = "Ferreiro",
		mesaTrabalho = {2555, 8671},
		mesaTrabalhando = {},
		receitas = {
			[1] = {item = 2400, nivel = 1, nivelJogador = 1, ferramenta = 2421, materiais = {{2160, 1}}, tempo = 0, experiencia = 1301, pontos = 10, chanceSucesso = 100, aprender = 0, atributos = {ataque = {1, 10}, defesa = {1, 10}, defesaExtra = 1, armadura = {1, 3}}},
			[2] = {item = 2401, nivel = 1, nivelJogador = 1, ferramenta = 2421, materiais = {{2160, 1}}, tempo = 2, experiencia = 273, pontos = 10, chanceSucesso = 100, aprender = 0, atributos = {ataque = {1, 10}, defesa = {1, 10}, defesaExtra = 1, armadura = {1, 3}}},
		},
		mensagem = "A forja permite voc� criar equipamentos �nicos e poderosos, basta voc� ter os materiais necess�rios para isso.",
		efeitoTrabalhando = CONST_ME_BLOCKHIT,
		efeitoSucesso = CONST_ME_FIREWORK_RED,
		efeitoFalha = CONST_ME_POFF,
		extraData = {}
	},
	[21000] = {
		nome = "Alquimista",
		mesaTrabalho = {9909, 9910},
		mesaTrabalhando = {},
		receitas = {
			[1] = {item = 7618, nivel = 1, nivelJogador = 1, ferramenta = 1965, materiais = {{2006, 2, 6}}, tempo = 0, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {health = {50, 60}}},
		},
		mensagem = "A alquimia permite voc� criar po��es �nicas e encantamentos poderosos, basta voc� ter os materiais necess�rios para isso.",
		efeitoTrabalhando = CONST_ME_BLOCKHIT,
		efeitoSucesso = CONST_ME_FIREWORK_BLUE,
		efeitoFalha = CONST_ME_POFF,
		extraData = {}
	},
	[22000] = {
		nome = "Alfaiate",
		mesaTrabalho = {10086},
		mesaTrabalhando = {},
		receitas = {
			[1] = {item = 7439, nivel = 1, nivelJogador = 1, ferramenta = 1965, materiais = {{7636, 1}, {2798, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
		},
		mensagem = "Ser um alfaiate permite voc� criar vestimentas �nicas e equipamentos poderosos, basta voc� ter os materiais necess�rios para isso.",
		efeitoTrabalhando = CONST_ME_BLOCKHIT,
		efeitoSucesso = CONST_ME_FIREWORK_BLUE,
		efeitoFalha = CONST_ME_POFF,
		extraData = {}
	},
	[23000] = {
		nome = "Cozinheiro",
		mesaTrabalho = {1787, 1789, 1791, 1793},
		mesaTrabalhando = {1786, 1788, 1790, 1792},
		receitas = {
			[1] = {item = 9992, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{11192, 2}, {2671, 5}, {8838, 3}, {2787, 3}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[2] = {item = 9993, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{7259, 3}, {8838, 3}, {8842, 5}, {2805, 2}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[3] = {item = 9994, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{12638, 3}, {11429, 3}, {2795, 4}, {2677, 3}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[4] = {item = 9995, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{11190, 2}, {2006, 2, 3}, {8841, 2}, {7909, 7}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[5] = {item = 9996, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{6574, 1}, {2676, 10}, {2006, 1, 6}, {2800, 1}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[6] = {item = 9997, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{12639, 2}, {12416, 3}, {12418, 4}, {12417, 4}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[7] = {item = 9998, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{8844, 5}, {2666, 5}, {2096, 1}, {2685, 2}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[8] = {item = 9999, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{2672, 5}, {8843, 2}, {9114, 4}, {8844, 2}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[9] = {item = 10000, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{2685, 5}, {2695, 2}, {2692, 5}, {2006, 1, 6}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[10] = {item = 10001, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{7963, 1}, {2689, 1}, {2667, 7}, {2696, 4}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[11] = {item = 12540, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{2678, 2}, {2670, 8}, {2789, 1}, {8845, 2}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[12] = {item = 12542, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{8844, 4}, {8838, 4}, {2006, 2, 14}, {2686, 3}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[13] = {item = 12543, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{6500, 1}, {6569, 8}, {6574, 2}, {8840, 2}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[14] = {item = 12544, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{20100, 1}, {12415, 4}, {2006, 4, 14}, {7910, 4}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			[15] = {item = 12637, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{11246, 5}, {2668, 3}, {2669, 3}, {2800, 2}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}}
		},
		mensagem = "Cozinhar permite voc� criar comidas �nicas e poderosos, basta voc� ter os materiais necess�rios para isso.",
		efeitoTrabalhando = CONST_ME_SMOKE,
		efeitoSucesso = CONST_ME_FIREWORK_BLUE,
		efeitoFalha = CONST_ME_BLACKSMOKE,
		extraData = {}
	},
}
listaProfissoes = {}
listaProfissoesInfo = {}
listaProfissoesLista1 = {}
listaProfissoesLista2 = {}
listaProfissoesLista3 = {}
for a,b in pairs(profissoes) do
	table.insert(listaProfissoes, a)
	table.insert(listaProfissoesInfo, a+configProfissoes.modalInfo)
	table.insert(listaProfissoesLista1, a+configProfissoes.modalLista1)
	table.insert(listaProfissoesLista2, a+configProfissoes.modalLista2)
	table.insert(listaProfissoesLista3, a+configProfissoes.modalLista3)
end
function doCalcLevel(n)
	if n == 0 then
		return 0
	else
		o = 0
		if n ~= 1 then
			o = math.pow((0.188*(math.pow(n, 1.4))), 2)+10
		end
		return math.max(0, (n-1)*40+o)+doCalcLevel(n-1)
	end
end
function doCalcLevelPontos(n)
	if n == 0 then
		return 0
	else
		return math.max(0, (n-1)*2+math.pow((0.01*(math.pow(n, 0.2))), 2)+10)+doCalcLevelPontos(n-1)
	end
end
function calcularLevelProfissao(n)
	return math.floor(doCalcLevel(n))
end
function calcularPontosProfissao(n)
	return math.floor(doCalcLevelPontos(n))
end
function verificiarProfissao(value)
	for a,b in pairs(profissoes) do
		if	a+configProfissoes.modalInfo == value or
			a+configProfissoes.modalLista1 == value or
			a+configProfissoes.modalLista2 == value or
			a+configProfissoes.modalLista3 == value then
			return a
		end
	end
	return 0
end
function verificiarProfissaoPorNome(value)
	for a,b in pairs(profissoes) do
		if string.lower(b.nome) == value then
			return a
		end
	end
	return 0
end
function Player.getProfissaoSkill(self, profissaoId)
	return math.max(1, self:getStorageValue(profissaoId+configProfissoes.skill))
end
function Player.getProfissaoSkillExp(self, profissaoId)
	return math.max(0, self:getStorageValue(profissaoId+configProfissoes.skillExp))
end
function Player.getProfissaoSkillExpProximoNivel(self, profissaoId)
	local skill = math.max(1, self:getStorageValue(profissaoId+configProfissoes.skill))
	local skillExp = math.max(0, self:getStorageValue(profissaoId+configProfissoes.skillExp))
	return calcularLevelProfissao(skill+1)-skillExp
end
function Player.getProfissaoSkillPorcentagem(self, profissaoId)
	local skillExp = self:getProfissaoSkillExp(profissaoId)
	local skillExpProximoNivel = self:getProfissaoSkillExpProximoNivel(profissaoId)+skillExp
	local percent = math.floor(100*skillExp/skillExpProximoNivel)
	if percent >= 0 and percent <= 100 then
		return percent
	else
		return 0
	end
end
function Player.addProfissaoSkill(self, profissaoId)
	local profissao = profissoes[profissaoId]
	local storageSkill = profissaoId+configProfissoes.skill
	local storageSkillExp = profissaoId+configProfissoes.skillExp
	local skill = self:getProfissaoSkill(profissaoId)+1
	self:setStorageValue(storageSkill, skill)
	self:setStorageValue(storageSkillExp, 0)
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� avan�ou seu n�vel de "..string.lower(profissao.nome).." para "..skill..".")
	self:addProfissaoPontos(profissaoId, calcularPontosProfissao(skill))
end
function Player.addProfissaoSkillExp(self, profissaoId, experiencia)
	local storageSkillExp = profissaoId+configProfissoes.skillExp
	local skill = self:getProfissaoSkill(profissaoId)
	local skillExp = self:getProfissaoSkillExp(profissaoId)
	local skillExpProxLevel = calcularLevelProfissao(skill+1)
	local novaExperiencia = 0
	if skill < configProfissoes.nivelMaximoProfissao and experiencia + skillExp >= skillExpProxLevel then
		novaExperiencia = experiencia+skillExp-skillExpProxLevel
		self:addProfissaoSkill(profissaoId)
	else
		novaExperiencia = skillExp+experiencia
	end
	self:setStorageValue(storageSkillExp, novaExperiencia)
end
function Player.getProfissaoPontos(self, profissaoId)
	return math.max(0, self:getStorageValue(profissaoId+configProfissoes.pontosProfissao))
end
function Player.addProfissaoPontos(self, profissaoId, pontos)
	local profissao = profissoes[profissaoId]
	local storagePontos = profissaoId+configProfissoes.pontosProfissao
	local pontosTotais = self:getProfissaoPontos(profissaoId)+pontos
	self:setStorageValue(storagePontos, pontosTotais)
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� recebeu "..pontos.." pontos de "..string.lower(profissao.nome)..". Voc� possui um total de "..pontosTotais.." pontos.")
end
function Player.getProfissaoReceitasFabricadas(self, profissaoId)
	return math.max(0, self:getStorageValue(profissaoId+configProfissoes.receitasFabricadas))
end
function Player.addProfissaoReceitasFabricadas(self, profissaoId)
	local storageReceitasFabricadas = profissaoId+configProfissoes.receitasFabricadas
	local receitasFabricadas = math.max(0, self:getStorageValue(storageReceitasFabricadas))
	self:setStorageValue(storageReceitasFabricadas, receitasFabricadas+1)
end
function Player.getProfissaoReceitasFalhadas(self, profissaoId)
	return math.max(0, self:getStorageValue(profissaoId+configProfissoes.receitasFalhadas))
end
function Player.addProfissaoReceitasFalhadas(self, profissaoId)
	local storageReceitasFalhadas = profissaoId+configProfissoes.receitasFalhadas
	local receitasFalhadas = math.max(0, self:getStorageValue(storageReceitasFalhadas))
	self:setStorageValue(storageReceitasFalhadas, receitasFalhadas+1)
end
function Player.getProfissaoUltimasReceitasFalhadas(self, profissaoId, receitaId)
	return math.floor(math.max(0, self:getStorageValue(profissaoId+configProfissoes.ultimasReceitasFalhadas+receitaId))*50)
end
function Player.addProfissaoUltimasReceitasFalhadas(self, profissaoId, receitaId)
	local storageUltimasReceitasFalhadas = profissaoId+configProfissoes.ultimasReceitasFalhadas+receitaId
	local ultimasReceitasFalhadas = math.max(0, self:getStorageValue(storageUltimasReceitasFalhadas))
	self:setStorageValue(storageUltimasReceitasFalhadas, ultimasReceitasFalhadas+1)
end
function Player.resetProfissaoUltimasReceitasFalhadas(self, profissaoId, receitaId)
	self:setStorageValue(profissaoId+configProfissoes.ultimasReceitasFalhadas+receitaId, 0)
end
function Player.getProfissaoBonusAdicional(self, profissaoId)
	local nivel = self:getProfissaoSkill(profissaoId)
	return math.floor(0.05*nivel)
end
function Player.getProfissaoChanceSucessoAdicional(self, profissaoId)
	local nivel = self:getProfissaoSkill(profissaoId)
	return (20*(nivel-1))
end
function Player.getProfissaoChanceColetaAdicional(self, profissaoId)
	local nivel = self:getProfissaoSkill(profissaoId)
	return (40*(nivel-1))
end
function Player.getProfissaoChanceSucessoReceita(self, profissaoId, receitaId)
	local profissao = profissoes[profissaoId]
	local chanceSucessoAdicional = self:getProfissaoChanceSucessoAdicional(profissaoId)
	local chanceSucessoUltimasReceitasFalhadas = self:getProfissaoUltimasReceitasFalhadas(profissaoId, receitaId)
	local chanceSucesso = profissao.receitas[receitaId].chanceSucesso
	return chanceSucesso+chanceSucessoUltimasReceitasFalhadas+chanceSucessoAdicional
end
function Player.getProfissaoReceitaAprendizado(self, profissaoId, receitaId)
	return math.max(0, self:getStorageValue(profissaoId+configProfissoes.aprendizado+receitaId))
end
function Player.addProfissaoReceitaAprendizado(self, profissaoId, receitaId)
	local storageAprendizado = profissaoId+configProfissoes.aprendizado+receitaId
	self:setStorageValue(storageAprendizado, 1)
end
function Player.getPosicaoMesaTrabalho(self, profissaoId)
	local extraData = profissoes[profissaoId].extraData[self:getId()]
	local posicaoMesaTrabalho = extraData.mesaTrabalho:getPosition()
	local posicaoEfeitoMesaTrabalho = extraData.mesaTrabalho:getPosition()
	local mesaTrabalho = extraData.mesaTrabalho:getType():getId()
	if mesaTrabalho == 1786 then
		posicaoEfeitoMesaTrabalho.x = posicaoEfeitoMesaTrabalho.x+1
		posicaoEfeitoMesaTrabalho.y = posicaoEfeitoMesaTrabalho.y-1
	elseif mesaTrabalho == 1788 then
		posicaoEfeitoMesaTrabalho.x = posicaoEfeitoMesaTrabalho.x+1
		posicaoEfeitoMesaTrabalho.y = posicaoEfeitoMesaTrabalho.y-1
	elseif mesaTrabalho == 1790 then
		posicaoEfeitoMesaTrabalho.x = posicaoEfeitoMesaTrabalho.x+1
	end
	return {mesaTrabalho = posicaoMesaTrabalho, efeito = posicaoEfeitoMesaTrabalho}
end
function Player.getProfissaoModalPrincipal(self, profissaoId)
	local profissao = profissoes[profissaoId]
	local profissaoMensagem = profissao.mensagem
	local profissaoNome = profissao.nome
	local profissaoNivel = self:getProfissaoSkill(profissaoId)
	local profissaoExpPorcentagem = self:getProfissaoSkillPorcentagem(profissaoId)
	local modal_titulo = profissaoNome.." - N�vel: "..profissaoNivel.." ("..profissaoExpPorcentagem.."%)"
	local modal_mensagem = profissaoMensagem.."\n\nO que voc� deseja fazer?\n"
	local modal = ModalWindow(profissaoId, modal_titulo, modal_mensagem)
	modal:addChoice(1, "Informa��es da Profiss�o")
	modal:addChoice(2, "Lista de Receitas - Prontas para Fabrica��o")
	modal:addChoice(3, "Lista de Receitas - Conhecidas")
	modal:addChoice(4, "Lista de Receitas - Geral")
	if modal:getChoiceCount() ~= 0 then
		modal:addButton(1, "Ok")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		return modal
	end
end
function Player.iniciarReceita(self, profissaoId, receitaId)
	local mesaTrabalho = profissoes[profissaoId].extraData[self:getId()].mesaTrabalho
	local actionItemDesativado = configProfissoes.actionItemDesativado
	if mesaTrabalho:getActionId() == actionItemDesativado then
		return false
	end
	local profissaoNivel = self:getProfissaoSkill(profissaoId)
	local profissao = profissoes[profissaoId]
	local efeitoTrabalhando = profissao.efeitoTrabalhando
	local mesaTrabalhoKey = searchArrayKey(profissao.mesaTrabalho, mesaTrabalho:getType():getId())
	local mesaTrabalhando = profissao.mesaTrabalhando[mesaTrabalhoKey]
	local receita = profissao.receitas[receitaId]
	local ferramenta = receita.ferramenta
	local materiais = receita.materiais
	if	self:getItemCount(ferramenta) == 0 or
		profissaoNivel < receita.nivel or
		self:getLevel() < receita.nivelJogador or
		(receita.aprender == 1 and self:getProfissaoReceitaAprendizado(profissaoId, receitaId) == 1) then
		return false
	end
	for a,b in pairs(materiais) do
		if b[3] ~= -1 then
			b[3] = -1
		end
		if self:getItemCount(b[1], b[3]) < b[2] then
			return false
		end
	end
	mesaTrabalho:setActionId(actionItemDesativado)
	if mesaTrabalhando ~= nil then
		mesaTrabalho:transform(mesaTrabalhando)
		mesaTrabalhando = profissao.mesaTrabalho[mesaTrabalhoKey]
	end
	local tempo = receita.tempo
	local craftCD = Condition(CONDITION_SPELLCOOLDOWN)
	craftCD:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
	craftCD:setParameter(CONDITION_PARAM_SUBID, 160)
	craftCD:setParameter(CONDITION_PARAM_TICKS, tempo*1000)
	self:addCondition(craftCD)
	self:allowMovement(false)
	self:say("Trabalhando...", TALKTYPE_MONSTER_SAY)
	local posicaoMesaTrabalho = self:getPosicaoMesaTrabalho(profissaoId)
	function enviarAnimacao(tempo, posicao, efeito)
		if tempo > 0 then
			posicao:sendMagicEffect(efeito)
			addEvent(enviarAnimacao, 1000, tempo-1, posicao, efeito)
		end
	end
	enviarAnimacao(tempo, posicaoMesaTrabalho.efeito, efeitoTrabalhando)
	for i = 1, #materiais do
		if materiais[i][3] == nil then
			materiais[i][3] = -1
		end
		self:removeItem(materiais[i][1], materiais[i][2], materiais[i][3])
	end
	addEvent(function(self, receitaId, profissaoId, mesaTrabalhando)
		self:fabricarItem(receitaId, profissaoId, mesaTrabalhando) 
	end, tempo*1000, self, receitaId, profissaoId, mesaTrabalhando)
	-- addEvent(function(player, receitaId, receita, efeitoSucesso, efeitoFalha, posicaoMesaTrabalho, mesaTrabalho, mesaTrabalhando)
	-- tempo*1000, self, receitaId, receita, efeitoSucesso, efeitoFalha, posicaoMesaTrabalho.mesaTrabalho, mesaTrabalho, mesaTrabalhando)
	return true
end
function Player.fabricarItem(self, receitaId, profissaoId, mesaTrabalhando)
	local profissao = profissoes[profissaoId]
	local mesaTrabalho = profissao.extraData[self:getId()].mesaTrabalho
	local posicaoMesaTrabalho = self:getPosicaoMesaTrabalho(profissaoId).efeito
	local efeitoSucesso = profissao.efeitoSucesso
	local efeitoFalha = profissao.efeitoFalha
	local receita = profissao.receitas[receitaId]
	local nivel = receita.nivel
	local chanceSucesso = self:getProfissaoChanceSucessoReceita(profissaoId, receitaId)
	local experiencia = receita.experiencia
	local pontos = receita.pontos
	local chance = math.random(10000)
	if chance <= chanceSucesso then
		local itemCriado = receita.item
		local atributos = receita.atributos
		local itemCriado = self:addItem(itemCriado, 1)
		if itemCriado:getType():getDescription() ~= "" then
			itemCriado:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, itemCriado:getType():getDescription().."\nCriado por "..self:getName()..".")
		else
			itemCriado:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Criado por "..self:getName()..".")
		end
		if receita.atributos ~= nil then
			local bonusAdicional = self:getProfissaoBonusAdicional(profissaoId)
			if itemCriado:getType():getAttack() > 0 and receita.atributos.ataque ~= nil then
				if type(receita.atributos.ataque) == "table" then
					ataqueAdicional = math.random(receita.atributos.ataque[1], receita.atributos.ataque[2])
				else
					ataqueAdicional = receita.atributos.ataque
				end
				itemCriado:setAttribute(ITEM_ATTRIBUTE_ATTACK, itemCriado:getType():getAttack()+ataqueAdicional+bonusAdicional)
			end
			if itemCriado:getType():getDefense() > 0 and receita.atributos.defesa ~= nil then
				if type(receita.atributos.defesa) == "table" then
					defesaAdicional = math.random(receita.atributos.defesa[1], receita.atributos.defesa[2])
				else
					defesaAdicional = receita.atributos.defesa
				end
				itemCriado:setAttribute(ITEM_ATTRIBUTE_DEFENSE, itemCriado:getType():getDefense()+defesaAdicional+bonusAdicional)
			end
			if itemCriado:getType():getExtraDefense() > 0 and receita.atributos.defesaExtra ~= nil then
				itemCriado:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE, itemCriado:getType():getExtraDefense()+receita.atributos.defesaExtra)
			end
			if itemCriado:getType():getArmor() > 0 and receita.atributos.armadura ~= nil then
				if type(receita.atributos.armadura) == "table" then
					armaduraAdicional = math.random(receita.atributos.armadura[1], receita.atributos.armadura[2])
				else
					armaduraAdicional = receita.atributos.armadura
				end
				itemCriado:setAttribute(ITEM_ATTRIBUTE_ARMOR, itemCriado:getType():getArmor()+armaduraAdicional+bonusAdicional)
			end
			if itemCriado:getType():getShootRange() > 0 then
				itemCriado:setAttribute(ITEM_ATTRIBUTE_SHOOTRANGE, itemCriado:getType():getShootRange()+math.random(0, 1))
			end
			if receita.atributos.health ~= nil then
				if type(receita.atributos.health) == "table" then
					healthAdicional = math.random(receita.atributos.health[1], receita.atributos.health[2])
				else
					healthAdicional = receita.atributos.health
				end
				itemCriado:setAttribute(ITEM_ATTRIBUTE_NAME, itemCriado:getType():getName().." [health: "..healthAdicional.."]")
			end
			if receita.atributos.mana ~= nil then
				if type(receita.atributos.mana) == "table" then
					manaAdicional = math.random(receita.atributos.mana[1], receita.atributos.mana[2])
				else
					manaAdicional = receita.atributos.mana
				end
				itemCriado:setAttribute(ITEM_ATTRIBUTE_NAME, itemCriado:getType():getName().." [mana: "..manaAdicional.."]")
			end
		end
		self:addProfissaoReceitasFabricadas(profissaoId)
		self:resetProfissaoUltimasReceitasFalhadas(profissaoId, receitaId)
		self:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Voc� fabricou com sucesso o item '"..capAll(itemCriado:getName()).."'.")
		self:addProfissaoPontos(profissaoId, pontos)
		posicaoMesaTrabalho:sendMagicEffect(efeitoSucesso)
	else
		self:addProfissaoReceitasFalhadas(profissaoId)
		self:addProfissaoUltimasReceitasFalhadas(profissaoId, receitaId)
		posicaoMesaTrabalho:sendMagicEffect(efeitoFalha)
		self:sendCancelMessage("O processo de cria��o falhou.")
	end
	self:addProfissaoSkillExp(profissaoId, experiencia)
	if mesaTrabalhando ~= nil then
		mesaTrabalho:transform(mesaTrabalhando)
	end
	mesaTrabalho:removeAttribute(ITEM_ATTRIBUTE_ACTIONID)
	self:allowMovement(true)
end