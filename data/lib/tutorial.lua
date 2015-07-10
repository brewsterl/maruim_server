tutorialId = 4500
tutorialFinalizado = 50
tutorialIntervaloMaximo = 100
enviosLinksAcessoRapido = {}
posicoesEfeitos = {
	{x = 301, y = 2421, z = 7},
	{x = 300, y = 2423, z = 7}
}
dataTutorial = {
	linkJanela = {},
	mesa = {}
}

function Player.iniciarTutorial(self)
	self:allowMovement(false)
	self:enviarModalTutorial(2)
end

function Player.sairTutorial(self)
	self:allowMovement(true)
	local posicaoJogador = self:getPosition()
	local posicaoTemplo = Town(1):getTemplePosition()
	if	not (posicaoJogador.x == posicaoTemplo.x and
		posicaoJogador.y == posicaoTemplo.y and
		posicaoJogador.z == posicaoTemplo.z) then
		self:teleportarJogador(posicaoTemplo, true)
	end
	local passoTutorial = self:pegarPassoTutorial()
	local vocacaoJogador = self:getVocation():getId()
	if passoTutorial < 7 then
		self:addItem(2461)
		self:addItem(2467)
		self:addItem(2649)
		if vocacaoJogador == 1 then
			self:addItem(23719, 1)
		elseif vocacaoJogador == 2 then
			self:addItem(23721, 1)
		elseif vocacaoJogador == 3 then
			self:addItem(19390, 10)
		end
		if vocacaoJogador == 4 then
			self:enviarModalItensKnight()
		end
	end
	if passoTutorial < 11 then
		self:addItem(11421, 1)
		self:addItem(2559, 1)
	else
		self:getItemById(11421, -1):removeAttribute(ITEM_ATTRIBUTE_ACTIONID)
		self:getItemById(2559, -1):removeAttribute(ITEM_ATTRIBUTE_ACTIONID)
	end
	if passoTutorial < 16 then
		self:adicionarMarcasMapa(1)
	end
	self:atualizarPassoTutorial(tutorialFinalizado)
end

function Player.confirmarSairTutorial(self)
	local modalTitulo = "Sair do Tutorial"
	local modalMensagem = "Voc� tem certeza que deseja sair do tutorial?\n"
	local modal = ModalWindow(tutorialId, modalTitulo, modalMensagem)
	modal:addButton(1, "Sim")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "N�o")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
end

function Player.enviarModalTutorial(self, id, atualizarPasso)
	if atualizarPasso == nil or atualizarPasso then
		self:atualizarPassoTutorial(id)
	end
	local modalTitulo = "Tutorial"
	local passo
	local modalMensagem = ""
	local opcoes = {}
	if id == 1 then
		modalMensagem = modalMensagem .. "Seja bem-vindo ao MaruimOT, " .. self:getName() .. "!\n\n"
		modalMensagem = modalMensagem .. "Se voc� � um iniciante por aqui e deseja receber algumas dicas para come�ar, selecione a op��o 'Iniciar Tutorial'.\n\n"
		modalMensagem = modalMensagem .. "Caso voc� seja experiente e j� conhe�a tudo o que pode fazer, selecione a op��o 'Pular Tutorial'.\n\n"
		opcoes = {
			"Iniciar Tutorial",
			"Pular Tutorial"
		}
	elseif id == 2 then
		modalMensagem = modalMensagem .. "Vamos come�ar!\n\n"
		modalMensagem = modalMensagem .. "Para melhor compreens�o, o tutorial est� dividido nas seguintes partes:\n\n"
		modalMensagem = modalMensagem .. "-> Introdu��o\n"
		modalMensagem = modalMensagem .. "-> Explicando o Sistema de Crafting (Fabrica��o de Itens)\n"
		modalMensagem = modalMensagem .. "       - Profiss�es\n"
		modalMensagem = modalMensagem .. "       - Fabrica��o de Receitas\n"
		modalMensagem = modalMensagem .. "       - Obtendo Materiais\n"
		modalMensagem = modalMensagem .. "       - Coleta de Materiais\n"
		modalMensagem = modalMensagem .. "-> Voca��o\n"
		modalMensagem = modalMensagem .. "       - Guilda\n"
		modalMensagem = modalMensagem .. "       - Promo��o\n"
		modalMensagem = modalMensagem .. "-> Conhecendo a 'Maruim Island'\n"
		modalMensagem = modalMensagem .. "-> Primeiros Passos\n"
		modalMensagem = modalMensagem .. "-> Informa��es Adicionais\n"
	elseif id == 3 then
		passo = "Introdu��o"
		modalMensagem = modalMensagem .. "Durante o tutorial, voc� receber� 'links de acesso r�pido' que poder�o ser usados no site "
		modalMensagem = modalMensagem .. "para ir diretamente a uma p�gina contendo mais informa��es sobre o assunto que est� sendo "
		modalMensagem = modalMensagem .. "lhe apresentado no momento.\n\n"
		modalMensagem = modalMensagem .. "Fique tranquilo! Caso voc� desconecte durante o tutorial, quando voltar voc� "
		modalMensagem = modalMensagem .. "estar� exatamente onde parou, para que possa prosseguir com o mesmo.\n\n"
		modalMensagem = modalMensagem .. "Voc� pode sair do tutorial a qualquer momento, basta esperar o in�cio de qualquer passo, "
		modalMensagem = modalMensagem .. "escolher a op��o 'Sair', ou pressionar a tecla 'Esc', e confirmar a sa�da.\n"
	elseif id == 4 then
		passo = "Sistema de Crafting"
		modalMensagem = modalMensagem .. "O crafting � um sistema que permite ao jogador fabricar diversos itens e equipamentos atrav�s de receitas espec�ficas que ser�o produzidas em uma mesa de trabalho.\n\n"
		modalMensagem = modalMensagem .. "Voc� pode evoluir dentro de cada profiss�o, basta produzir receitas e receber� pontos de experi�ncia que aumentar�o seu n�vel.\n\n"
		modalMensagem = modalMensagem .. "Conforme sua evolu��o, isso habilitar� uma quantidade maior de receitas e far� com que a produ��o delas se torne cada vez mais f�cil.\n\n"
		modalMensagem = modalMensagem .. "Link de Acesso R�pido: crafting\n"
	elseif id == 5 then
		passo = "Profiss�o"
		modalMensagem = modalMensagem .. "Atualmente o sistema est� divido entre quatro profiss�es, s�o elas:\n"
		modalMensagem = modalMensagem .. "Ferreiro, Alfaiate, Alquimista e Cozinheiro.\n\n"
		modalMensagem = modalMensagem .. "Cada profiss�o possui uma mesa de trabalho espec�fica, que � onde o jogador ter� acesso a todas as informa��es espec�ficas.\n\n"
		modalMensagem = modalMensagem .. "Al�m disso, possui diversas receitas que poder�o ser fabricadas caso o jogador tenha todos os requisitos necess�rios.\n\n"
		modalMensagem = modalMensagem .. "Existem tamb�m os ingredientes de melhoria das profiss�es, que aumentam a chance de sucesso de qualquer receita.\n\n"
		modalMensagem = modalMensagem .. "Link de Acesso R�pido: profiss�es\n"
	elseif id == 6 then
		passo = "Fabrica��o de Receitas"
		modalMensagem = modalMensagem .. "Para fabricar uma receita voc� precisa possuir os seguintes requisitos necess�rios:\n"
		modalMensagem = modalMensagem .. "     - N�vel de Profiss�o;\n"
		modalMensagem = modalMensagem .. "     - N�vel de Jogador;\n"
		modalMensagem = modalMensagem .. "     - Ferramenta;\n"
		modalMensagem = modalMensagem .. "     - Material;\n"
		modalMensagem = modalMensagem .. "     - Conhecimento (apenas receitas mais avan�adas).\n\n"
		modalMensagem = modalMensagem .. "Com tudo isso em m�os, � hora de ir at� a mesa de trabalho espec�fica da produ��o, "
		modalMensagem = modalMensagem .. "abrir a lista de receitas dispon�veis e selecionar a receita desejada.\n"
	elseif id == 8 then
		passo = "Escolha uma Arma"
		modalMensagem = modalMensagem .. "Escolha uma das armas abaixo e clique em 'Escolher', tecle entre ou d� "
		modalMensagem = modalMensagem .. "um clique duplo na op��o desejada para receb�-la.\n\n"
		opcoes = {
			"Arma Aleat�ria",
			capAll(ItemType(itensKnight[1]):getName()),
			capAll(ItemType(itensKnight[2]):getName()),
			capAll(ItemType(itensKnight[3]):getName())
		}
	elseif id == 9 then
		passo = "Obtendo Materiais"
		modalMensagem = modalMensagem .. "Muito bem " .. self:getName() .. "! Agora que voc� j� aprendeu como fabricar um item "
		modalMensagem = modalMensagem .. "chegou a hora de saber um pouco mais sobre como obter os materiais das receitas.\n\n"
		modalMensagem = modalMensagem .. "Existem 5 maneiras de obter materiais:\n"
		modalMensagem = modalMensagem .. "     - Comprando em NPCs;\n"
		modalMensagem = modalMensagem .. "     - Derrubando de criaturas;\n"
		modalMensagem = modalMensagem .. "     - Fabricando;\n"
		modalMensagem = modalMensagem .. "     - Comprando de outros jogadores;\n"
		modalMensagem = modalMensagem .. "     - Coletando na natureza.\n"
	elseif id == 10 then
		passo = "Coleta de Materiais"
		modalMensagem = modalMensagem .. "Existem 3 tipos de materiais que podem ser coletados na natureza:\n"
		modalMensagem = modalMensagem .. "Ferro, Carv�o e Madeira.\n\n"
		modalMensagem = modalMensagem .. "Ao tentar coletar qualquer um desses, voc� receber� pontos de experi�ncia de "
		modalMensagem = modalMensagem .. "profiss�o (cada material aumenta a experi�ncia de uma profiss�o espec�fica)\n"
		modalMensagem = modalMensagem .. "Observa��o: Mesmo que voc� n�o obtenha sucesso na coleta, a experi�ncia ser� adicionada.\n\n"
		modalMensagem = modalMensagem .. "Al�m disso, quanto maior for o seu n�vel na profiss�o espec�fica daquele material, "
		modalMensagem = modalMensagem .. "mais chance de sucesso voc� ter�.\n\n"
		modalMensagem = modalMensagem .. "Agora chegou a hora de voc� aprender como identificar uma fonte de coleta.\n"
	elseif id == 14 then
		passo = "Voca��es"
		modalMensagem = modalMensagem .. "Agora que voc� aprendeu os primeiros passos no sistema de crafting, chegou a hora "
		modalMensagem = modalMensagem .. "de saber um pouco mais sobre as voca��es.\n\n"
		modalMensagem = modalMensagem .. "Cada voca��o possui uma guilda, onde est�o localizados os NPC's espec�ficos que fornecer�o "
		modalMensagem = modalMensagem .. "desde equipamentos b�sicos at� itens mais avan�ados.\n\n"
		modalMensagem = modalMensagem .. "Al�m disso, voc� pode falar com o mestre da guilda, que lhe fornecer� tarefas para que possa "
		modalMensagem = modalMensagem .. "provar seu valor dentro de sua voca��o.\n"
	elseif id == 15 then
		passo = "Voca��es - Promo��o"
		modalMensagem = modalMensagem .. "Para ser promovido dentro de sua voca��o, voc� deve falar com o mestre da guilda "
		modalMensagem = modalMensagem .. "e realizar qualquer uma das tarefas dispon�veis.\n\n"
		modalMensagem = modalMensagem .. "Ap�s concluir a tarefa escolhida v� at� o mestre e pe�a por uma promo��o.\n\n"
		modalMensagem = modalMensagem .. "A cada tarefa conclu�da voc� receber� pontos de reputa��o.\n\n"
		modalMensagem = modalMensagem .. "Observa��o: Voc� precisa ter pelo menos n�vel 20 para ser promovido e n�o ter� nenhum custo para isso.\n"
	elseif id == 16 then
		passo = "Conhecendo a 'Maruim Island'"
		modalMensagem = modalMensagem .. "A 'Maruim Island' � a ilha inicial de qualquer jogador. Nela est�o localizadas as guildas das voca��es e das profiss�es.\n\n"
		modalMensagem = modalMensagem .. "Foram adicionadas marcas de refer�ncia no seu mini mapa, voc� pode consult�-las para facilitar a sua localiza��o na ilha.\n"
	elseif id == 17 then
		passo = "Primeiros Passos"
		modalMensagem = modalMensagem .. "Poucas criaturas derrubam 'gold coins', por isso, voc� deve recolher seus itens e procurar um NPC espec�fico "
		modalMensagem = modalMensagem .. "para vend�-los. Fique atento pois diversos itens derrubados s�o usados em receitas, voc� pode fabricar equipamentos "
		modalMensagem = modalMensagem .. "e vender para um NPC ou para outros jogadores.\n"
		modalMensagem = modalMensagem .. "Observa��o: As informa��es detalhadas de cada item voc� encontra no database de itens, localizado em nosso site.\n\n"
		modalMensagem = modalMensagem .. "A principal forma de voc� melhorar seus equipamentos � fabric�-los atrav�s do sistema de crafting.\n"
		modalMensagem = modalMensagem .. "Procure verificar a lista de receitas dispon�veis (no site ou na mesa de trabalho da profiss�o) para tornar seu personagem cada vez mais forte.\n\n"
		modalMensagem = modalMensagem .. "Dica:\n"
		modalMensagem = modalMensagem .. "Algumas criaturas n�o derrubam itens para ser vendidos. Nesses casos, voc� pode coletar o corpo dessa criatura e vender direto no NPC.\n\n"
		modalMensagem = modalMensagem .. "Link de Acesso R�pido: itens\n"
	elseif id == 18 then
		passo = "Informa��es Adicionais"
		modalMensagem = modalMensagem .. "Voc� poder� sair da ilha a qualquer momento, basta possuir a quantia necess�ria para a viagem para uma das tr�s cidades principais:\n"
		modalMensagem = modalMensagem .. "�tt�, a cidade sim�trica, Hyalakur, a cidade des�rtica e Civitaten, a cidade do vulc�o.\n"
		modalMensagem = modalMensagem .. "Lembrando que voc� n�o � obrigado a deixar a ilha, e poder� voltar quando quiser (o pre�o da passagem � reduzido).\n\n"
		modalMensagem = modalMensagem .. "� recomendado ficar na ilha pelo menos at� o n�vel 8, por�m, n�o precisa ter pressa para sair, a ilha possui �reas "
		modalMensagem = modalMensagem .. "que lhe proporcionar�o uma boa quantidade de experi�ncia durante o in�cio da sua jornada.\n\n"
		modalMensagem = modalMensagem .. "Lembre-se sempre de consultar o banco de informa��es em nosso site, l� est� listado todo o conte�do "
		modalMensagem = modalMensagem .. "dispon�vel no MaruimOT: Itens, NPCs, Criaturas, Mapa e muita informa��o para auxiliar o seu jogo.\n\n"
		modalMensagem = modalMensagem .. "Boa sorte em sua jornada!\n"
	elseif isInArray({7, 11, 12, 13}, id) then
		return
	end
	if passo ~= nil then
		modalTitulo = modalTitulo .. " - " .. passo
	end
	local modal = ModalWindow(tutorialId+id, modalTitulo, modalMensagem)
	for i = 1, #opcoes do
		modal:addChoice(i, opcoes[i])
	end
	modal:addButton(1, "Pr�ximo")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Sair")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
end

function Player.checarSemVocacao(self)
	if self:getVocation():getId() == 0 then
		return true
	end
	return false
end

function Player.enviarModalSemVocacao(self)
	local modalTitulo = "Escolha uma Voca��o"
	local modalMensagem = "O seu personagem n�o possui nenhuma voca��o.\n\n"
	modalMensagem = modalMensagem .. "Selecione uma das op��es abaixo e tecle 'enter' ou clique em 'escolher' para mudar sua voca��o.\n"
	local modal = ModalWindow(tutorialId+tutorialFinalizado+4, modalTitulo, modalMensagem)
	modal:addChoice(1, "Sorcerer")
	modal:addChoice(2, "Druid")
	modal:addChoice(3, "Paladin")
	modal:addChoice(4, "Knight")
	modal:addButton(1, "Escolher")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Fechar")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
end

function Player.enviarModalAindaSemVocacao(self)
	if self:getVocation():getId() > 0 then
		local modalTitulo = "Nenhuma Voca��o foi Selecionada"
		local modalMensagem = "Voc� n�o escolheu nenhuma voca��o na janela anterior.\n"
		modalMensagem = modalMensagem .. "� obrigat�rio a escolha de uma voca��o para permanecer conectado ao jogo.\n\n"
		modalMensagem = modalMensagem .. "Clique em 'Voltar' para retornar � janela anterior e selecionar uma voca��o.\n"
		modalMensagem = modalMensagem .. "Clique em 'Sair' caso n�o queira escolher uma voca��o agora - essa op��o te desconectar� do jogo.\n"
		local modal = ModalWindow(tutorialId+tutorialFinalizado+5, modalTitulo, modalMensagem)
		modal:addButton(1, "Voltar")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		modal:sendToPlayer(self)
	end
end

function Player.pegarPassoTutorial(self)
	return math.max(1, self:getStorageValue(tutorialId))
end

function Player.atualizarPassoTutorial(self, passo)
	return self:setStorageValue(tutorialId, passo)
end

function Player.enviarLinkAcessoRapido(self, codigo, descricao)
	if not enviosLinksAcessoRapido[self:getId()] then
		enviosLinksAcessoRapido[self:getId()] = 1
		self:sendTextMessage(4, "Para utilizar um Link de Acesso R�pido voc� deve ir at� o site http://maruim.paulosalvatore.com.br/ e digit�-lo no campo que est� localizado na barra direita.")
	end
	self:sendTextMessage(1, "Link de Acesso R�pido: \"" .. codigo .. "\" - " .. descricao .. ".")
end

function Player.tutorialFabricarReceita(self)
	self:allowMovement(false)
	local npc = Npc("Duriel")
	local itemArma
	local vocacaoJogador = self:getVocation():getId()
	if vocacaoJogador == 1 or vocacaoJogador == 2 then
		itemArma = 7735
	elseif vocacaoJogador == 3 then
		itemArma = 8860
	elseif vocacaoJogador == 4 then
		itemArma = 5880
	end
	local mensagens = {
		"Ol� " .. self:getName() .. ". Para te ensinar como produzir receitas, vamos criar suas roupas e sua arma.",
		"Aqui est�o 3 'brown piece of cloth', para seu equipamento, e 1 '" .. ItemType(itemArma):getName() .. "', para sua arma.",
		"Para isso, voc� deve ir at� a alfaiataria e usar a mesa de trabalho."
	}
	addEvent(tutorialAdicionarMateriais, 4150, self:getId(), itemArma)
	addEvent(npcSay, 150, self:getId(), npc:getId(), mensagens[1])
	addEvent(npcSay, 5000, self:getId(), npc:getId(), mensagens[2])
	addEvent(npcSay, 10000, self:getId(), npc:getId(), mensagens[3])
end

function tutorialAdicionarMateriais(playerId, itemArma)
	local player = Player(playerId)
	if not player then
		return
	end
	player:addItem(5913, 3)
	player:addItem(itemArma, 1)
	player:atualizarPassoTutorial(7)
	player:allowMovement(true)
end

function Player.tutorialJanelaFabricacao(self)
	local modalTitulo = self:getProfissaoModalTitulo(22000)
	local modalMensagem = "Este � um exemplo de janela de profiss�o.\n\n"
	modalMensagem = modalMensagem .. "Todas as profiss�es possuem as mesmas op��es.\n\n"
	modalMensagem = modalMensagem .. "Observa��o: A op��o 'Fabricar �ltima Receita' s� aparecer� caso voc� tenha todos os requisitos para produzir a �ltima receita fabricada.\n\n"
	modalMensagem = modalMensagem .. "Link de Acesso R�pido: janela profiss�o\n"
	local modal = ModalWindow(tutorialId+tutorialFinalizado, modalTitulo, modalMensagem)
	modal:addChoice(5, "Fabricar �ltima Receita")
	modal:addChoice(1, "Informa��es da Profiss�o")
	modal:addChoice(2, "Lista de Receitas - Prontas para Fabrica��o")
	modal:addChoice(3, "Lista de Receitas - Conhecidas")
	modal:addChoice(4, "Lista de Receitas - Geral")
	modal:addButton(1, "Ok")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Fechar")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
end

function Player.tutorialJanelaFabricacaoInformacao(self)
	local profissaoId = 22000
	local profissaoNivel = self:getProfissaoSkill(profissaoId)
	local profissaoExpPorcentagem = self:getProfissaoSkillPorcentagem(profissaoId)
	local profissaoExp = self:getProfissaoSkillExp(profissaoId)
	local profissaoExpProximoNivel = self:getProfissaoSkillExpProximoNivel(profissaoId)
	local profissaoPontos = self:getProfissaoPontos(profissaoId)
	local profissaoReceitasFabricadas = self:getProfissaoReceitasFabricadas(profissaoId)
	local profissaoReceitasFalhadas = self:getProfissaoReceitasFalhadas(profissaoId)
	local profissaoBonusAdicional = self:getProfissaoBonusAdicional(profissaoId)
	local profissaoChanceSucessoAdicional = formatarValor(self:getProfissaoChanceSucessoAdicional(profissaoId)).."%"
	local modalTitulo = self:getProfissaoModalTitulo(profissaoId) .. " - Informa��es"
	local modalMensagem = "N�vel: " .. profissaoNivel .. " " .. profissaoExpPorcentagem .. "%)\n"
	modalMensagem = modalMensagem .. "Experi�ncia: " .. profissaoExp .. "\n"
	modalMensagem = modalMensagem .. "Experi�ncia para o pr�ximo n�vel: " .. profissaoExpProximoNivel .. "\n"
	modalMensagem = modalMensagem .. "Pontos de Profiss�o: " .. profissaoPontos .. "\n"
	modalMensagem = modalMensagem .. "Receitas fabricadas: " .. profissaoReceitasFabricadas .. "\n"
	modalMensagem = modalMensagem .. "Receitas falhadas: " .. profissaoReceitasFalhadas .. "\n"
	modalMensagem = modalMensagem .. "B�nus adicional: +" .. profissaoBonusAdicional .. "\n"
	modalMensagem = modalMensagem .. "Chance de sucesso adicional: +" .. profissaoChanceSucessoAdicional
	local modal = ModalWindow(tutorialId+tutorialFinalizado+1, modalTitulo, modalMensagem)
	modal:addButton(1, "Voltar")
	modal:setDefaultEnterButton(1)
	modal:sendToPlayer(self)
end

function Player.tutorialJanelaFabricacaoLista(self)
	if self:pegarPassoTutorial() ~= 7 then
		local modalTitulo = "Lista Vazia"
		local modalMensagem = "Voc� j� produziu seus equipamentos.\nClique no bot�o 'Voltar' e selecione outra op��o.\n"
		local modal = ModalWindow(tutorialId+tutorialFinalizado+3, modalTitulo, modalMensagem)
		modal:addButton(1, "Voltar")
		modal:setDefaultEnterButton(1)
		modal:sendToPlayer(self)
	else
		local modalTitulo = self:getProfissaoModalTitulo(22000) .. " - Lista de Receitas - Prontas para Fabrica��o"
		local modalMensagem = "Selecione um item na lista e realize uma das a��es citadas abaixo:\n\n"
		modalMensagem = modalMensagem .. "Clique no bot�o 'Criar', tecle 'Enter' ou d� dois cliques para iniciar o processo de fabrica��o.\n"
		modalMensagem = modalMensagem .. "Clique no bot�o 'Info' para verificar os requisitos necess�rios para cria��o do item selecionado.\n"
		local modal = ModalWindow(tutorialId+tutorialFinalizado+2, modalTitulo, modalMensagem)
		modal:addChoice(1, "Equipamentos Iniciais")
		modal:addButton(3, "Info")
		modal:addButton(2, "Voltar")
		modal:addButton(1, "Criar")
		modal:setDefaultEnterButton(1)
		modal:setDefaultEscapeButton(2)
		modal:sendToPlayer(self)
	end
end

function Player.tutorialJanelaFabricacaoIndisponivel(self)
	local modalTitulo = "Janela Indispon�vel"
	local modalMensagem = "Esta janela est� indispon�vel durante o tutorial.\n"
	local modal = ModalWindow(tutorialId+tutorialFinalizado+3, modalTitulo, modalMensagem)
	modal:addButton(1, "Voltar")
	modal:setDefaultEnterButton(1)
	modal:sendToPlayer(self)
end

function Player.tutorialIniciarFabricacao(self)
	self:allowMovement(false)
	local tempoFabricacao = 4
	self:removeItem(5913, 3)
	local vocacaoJogador = self:getVocation():getId()
	if vocacaoJogador == 1 or vocacaoJogador == 2 then
		self:getItemById(7735, -1):remove()
	elseif vocacaoJogador == 3 then
		self:getItemById(8860, -1):remove()
	elseif vocacaoJogador == 4 then
		self:getItemById(5880, -1):remove()
	end
	local craftCD = Condition(CONDITION_SPELLCOOLDOWN)
	craftCD:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
	craftCD:setParameter(CONDITION_PARAM_SUBID, 160)
	craftCD:setParameter(CONDITION_PARAM_TICKS, (tempoFabricacao+1)*1000)
	self:addCondition(craftCD)
	local mesa = dataTutorial.mesa[self:getId()]
	mesa:transform(mesa.itemid+1)
	for i = 1, tempoFabricacao do
		addEvent(function(playerId)
			local player = Player(playerId)
			if not player then
				return
			end
			local mesa = dataTutorial.mesa[player:getId()]
			if i < 4 then
				mesa:getPosition():sendMagicEffect(efeitos["hit"])
			else
				mesa:transform(mesa.itemid-1)
				player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
				player:addItem(2461)
				player:addItem(2467)
				player:addItem(2649)
				local vocacaoJogador = player:getVocation():getId()
				if vocacaoJogador == 1 then
					player:addItem(23719, 1)
				elseif vocacaoJogador == 2 then
					player:addItem(23721, 1)
				elseif vocacaoJogador == 3 then
					player:addItem(19390, 10)
				end
				if vocacaoJogador ~= 4 then
					player:enviarModalTutorial(9)
				else
					player:enviarModalTutorial(8)
				end
				player:allowMovement(true)
			end
		end, i*1000, self:getId(), i)
	end
end

function Player.enviarModalItensKnight(self)
	local modalTitulo = "Escolha uma Arma"
	local modalMensagem = "Escolha uma das armas abaixo e clique em 'Escolher', tecle entre ou d� um clique duplo na op��o desejada para receb�-la.\n\n"
	local modal = ModalWindow(modalItensKnight, modalTitulo, modalMensagem)
	modal:addChoice(1, "Arma Aleat�ria")
	modal:addChoice(2, capAll(ItemType(itensKnight[1]):getName()))
	modal:addChoice(3, capAll(ItemType(itensKnight[2]):getName()))
	modal:addChoice(4, capAll(ItemType(itensKnight[3]):getName()))
	modal:addButton(1, "Escolher")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Sair")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
	self:registerEvent("ItensKnight")
end

function Player.tutorialAprenderColeta(self)
	self:allowMovement(false)
	local npc = Npc("Klaus")
	local mensagens = {
		"Ol� " .. self:getName() .. ". Para identificar uma fonte de coleta dispon�vel, voc� deve verificar se ela possui um brilho em cima.",
		"Para tentar colet�-la, voc� deve usar uma ferramenta espec�fica que vou lhe entregar agora.",
		"Para coletar ferro e carv�o, lhe entregarei uma \"blacksmith's pick\" e para coletar madeira, lhe entregarei um \"small axe\".",
		"Caso voc� perca algum desses, voc� poder� compr�-los de NPC's.",
		"Agora v� nessa sala abaixo e use uma das ferramentas em alguma fonte de coleta."
	}
	addEvent(tutorialAdicionarFerramenta, 8150, self:getId())
	for i = 1, #mensagens do
		addEvent(npcSay, ((i-1)*4000)+150, self:getId(), npc:getId(), mensagens[i])
	end
end

function tutorialAdicionarFerramenta(playerId)
	local player = Player(playerId)
	if not player then
		return
	end
	player:addItem(11421):setActionId(4500)
	player:addItem(2559):setActionId(4500)
	player:atualizarPassoTutorial(11)
	player:allowMovement(true)
end

function npcSay(playerId, npcId, mensagem)
	local npc = Npc(npcId)
	if not npc then
		return
	end
	local player = Player(playerId)
	if player then
		npc:say(mensagem, TALKTYPE_PRIVATE_NP, false, player, npc:getPosition())
	end
end

function liberarMovimentoJogador(playerId)
	local player = Player(playerId)
	if player then
		player:allowMovement(true)
	end
end

function efeitosTutorial()
	for i = 1, #posicoesEfeitos do
		Position(posicoesEfeitos[i]):sendMagicEffect(CONST_ME_TUTORIALARROW)
		Position(posicoesEfeitos[i]):sendMagicEffect(CONST_ME_TUTORIALSQUARE)
	end
	addEvent(efeitosTutorial, 3100)
end
