tutorialId = 4500
tutorialFinalizado = 50
tutorialIntervaloMaximo = 100

habilitarTutorial = true

function Player:iniciarTutorial()
	self:enviarModalTutorial(2)
end

function Player:sairTutorial()
	self:allowMovement(true)
	local passoTutorial = self:pegarPassoTutorial()
	local vocacaoJogador = self:getVocation():getId()

	if passoTutorial < 4 then
		self:adicionarMarcasMapa(1)
	end

	if passoTutorial < 12 then
		self:teleportarParaGuilda()
	end

	self:atualizarPassoTutorial(tutorialFinalizado)
end

function Player:confirmarSairTutorial()
	local modalTitulo = "Sair do Tutorial"
	local modalMensagem = "Voc� tem certeza que deseja sair do tutorial?\n"
	local modal = ModalWindow(tutorialId, modalTitulo, modalMensagem)
	modal:addButton(1, "Sim")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "N�o")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
end

function Player:enviarModalTutorial(id, atualizarPasso)
	self:allowMovement(false)

	if atualizarPasso == nil or atualizarPasso then
		self:atualizarPassoTutorial(id)
	end

	local modalTitulo = "Tutorial"
	local passo
	local modalMensagem = ""
	local opcoes = {}

	if id == 1 then
		modalMensagem = modalMensagem .. "Seja bem-vindo ao MaruimOT, " .. self:getName() .. "!\n\n"
		modalMensagem = modalMensagem .. "Se voc� est� come�ando agora e deseja receber algumas dicas para come�ar, selecione a op��o 'Iniciar Tutorial'.\n\n"
		modalMensagem = modalMensagem .. "Caso voc� seja experiente e j� conhe�a tudo o que pode fazer, selecione a op��o 'Pular Tutorial'.\n\n"
		opcoes = {
			"Iniciar Tutorial",
			"Pular Tutorial"
		}
	elseif id == 2 then
		modalMensagem = modalMensagem .. "Vamos come�ar!\n\n"
		modalMensagem = modalMensagem .. "Para melhor compreens�o, o tutorial est� dividido nas seguintes partes:\n\n"
		modalMensagem = modalMensagem .. "-> Introdu��o\n"
		modalMensagem = modalMensagem .. "-> Conhecendo a 'Maruim Island'\n"
		modalMensagem = modalMensagem .. "-> Itens Iniciais\n"
		modalMensagem = modalMensagem .. "-> Recompensas por Criaturas Mortas\n"
		modalMensagem = modalMensagem .. "-> Itens Encontrados em Miss�es ou Derrubados por Monstros\n"
		modalMensagem = modalMensagem .. "-> Informa��es Adicionais\n"
		modalMensagem = modalMensagem .. "-> Voca��o\n"
		modalMensagem = modalMensagem .. "       - Guilda\n"
		modalMensagem = modalMensagem .. "       - Promo��o\n"
	elseif id == 3 then
		passo = "Introdu��o"
		modalMensagem = modalMensagem .. "Durante o tutorial voc� receber� diversas informa��es e dicas que te ajudar�o a entender melhor o servidor.\n\n"
		modalMensagem = modalMensagem .. "Fique tranquilo! Caso voc� desconecte durante o tutorial, quando voltar voc� "
		modalMensagem = modalMensagem .. "estar� exatamente onde parou, para que possa prosseguir com o mesmo.\n\n"
		modalMensagem = modalMensagem .. "Voc� pode sair do tutorial a qualquer momento, basta escolher a op��o 'Sair' "
		modalMensagem = modalMensagem .. "(ou pressionar a tecla 'Esc') e confirmar a sa�da.\n"
	elseif id == 4 then
		passo = "Conhecendo a 'Maruim Island'"
		modalMensagem = modalMensagem .. "A 'Maruim Island' � a ilha inicial de qualquer jogador. Nela est�o localizadas todas as guildas das voca��es.\n\n"
		modalMensagem = modalMensagem .. "Foram adicionadas marcas de refer�ncia no seu mini mapa, voc� pode consult�-las para facilitar a sua localiza��o na ilha.\n"
	elseif id == 5 then
		passo = "Itens Iniciais"
		modalMensagem = modalMensagem .. "Enquanto voc� permanecer na Maruim Island voc� poder� utilizar alguns itens iniciais que te ajudar�o no in�cio da sua jornada. S�o eles:\n\n"
		modalMensagem = modalMensagem .. "-> Pergaminho de Teleporte\n"
		modalMensagem = modalMensagem .. "-> Pequena Po��o de Vida (refil gratuito)\n"
	elseif id == 6 then
		passo = "Itens Iniciais - Pergaminho de Teleporte"
		modalMensagem = modalMensagem .. "O 'Pergaminho de Teleporte' permite que voc� v� para qualquer �rea de ca�a da Maruim Island.\n\n"
		modalMensagem = modalMensagem .. "Al�m disso, voc� tamb�m consegue se teleportar para certos NPC's e sair da ilha quando quiser.\n\n"
		modalMensagem = modalMensagem .. "Caso voc� saia da ilha, o pergaminho de teleporte e o refil de po��es ser�o automaticamente removidos.\n\n"
		modalMensagem = modalMensagem .. "OBS.: Voc� pode us�-lo quantas vezes quiser, desde que esteja fora de combate, seja n�vel 30 ou inferior e respeitando um intervalo de 30 segundos a cada utiliza��o.\n"
	elseif id == 7 then
		passo = "Itens Iniciais - Pequena Po��o de Vida (refil gratuito)"
		modalMensagem = modalMensagem .. "A 'Pequena Po��o de Vida' � um item que lhe recuperar� uma pequena quantidade de vida.\n\n"
		modalMensagem = modalMensagem .. "Voc� poder� recarreg�-la no 'NPC Flora' localizado no templo da ilha inicial.\n\n"
		modalMensagem = modalMensagem .. "Dica: Para chegar rapidamente ao local de recarregamento da po��o, use o 'Pergaminho de Teleporte' e escolha a op��o 'NPC Flora (refil de po��es)'.\n"
	elseif id == 8 then
		passo = "Recompensas por Criaturas Mortas"
		modalMensagem = modalMensagem .. "Para come�ar, temos uma �tima not�cia: ao matar qualquer criatura, voc� n�o tem que abrir seu corpo para recolher 'gold coins'.\n"
		modalMensagem = modalMensagem .. "A recompensa que voc� recebe por derrotar essas criaturas v�o direto para sua conta especial que pode ser acessada a qualquer "
		modalMensagem = modalMensagem .. "momento atrav�s do comando: '/saque quantidade desejada'.\n"
		modalMensagem = modalMensagem .. "Exemplo: Para sacar '10 gold coins', voc� deve digitar: '/saque 10' e pronto, voc� receber� a quantia!\n\n"
		modalMensagem = modalMensagem .. "Fique atento pois uma vez que voc� retira valores de sua conta especial n�o h� como retorn�-lo para ela.\n\n"
		modalMensagem = modalMensagem .. "Existem tamb�m um limite de 'gold coins' que voc� pode armazenar e esse limite aumenta caso voc� possua uma 'Conta Premium'."
	elseif id == 9 then
		passo = "Itens Encontrados em Miss�es ou Derrubados por Monstros"
		modalMensagem = modalMensagem .. "Todos os itens encontrados em miss�es ou derrubados por monstros possuem valor!\n\n"
		modalMensagem = modalMensagem .. "A maioria deles voc� poder� vender para NPC's espalhados em todo o mundo, outros poder�o ser utilizados em diversas miss�es dispon�veis.\n\n"
		modalMensagem = modalMensagem .. "Caso voc� tenha d�vida sobre algum item basta acessar o nosso site e pesquis�-lo em nosso exclusivo database de itens!\n"
	elseif id == 10 then
		passo = "Informa��es Adicionais"
		modalMensagem = modalMensagem .. "Voc� poder� sair da ilha a qualquer momento, basta utilizar o seu pergaminho de teleporte e escolher a op��o 'Sair da Maruim Island' e escolher umas das cidades abaixo:\n\n"
		modalMensagem = modalMensagem .. "�tt�, a cidade sim�trica, Hyalakur, a cidade des�rtica ou Civitaten, a cidade do vulc�o.\n\n"
		modalMensagem = modalMensagem .. "Lembrando que voc� n�o � obrigado a deixar a ilha em algum n�vel espec�fico e poder� voltar quando quiser (basta procurar o navio mais pr�ximo e pedir uma passagem ao capit�o).\n\n"
		modalMensagem = modalMensagem .. "� recomendado ficar na ilha pelo menos at� o n�vel 10, por�m, n�o precisa ter pressa para sair, a ilha possui �reas "
		modalMensagem = modalMensagem .. "que lhe proporcionar�o uma boa quantidade de pontos de experi�ncia durante o in�cio da sua jornada.\n\n"
		modalMensagem = modalMensagem .. "Lembre-se sempre de consultar o banco de informa��es em nosso site, l� est� listado todo o conte�do "
		modalMensagem = modalMensagem .. "dispon�vel em nosso servidor: Itens, NPC's, Criaturas, Mapa e muitas informa��es �teis para auxiliar o seu jogo.\n"
	elseif id == 11 then
		passo = "Voca��o - Guilda"
		modalMensagem = modalMensagem .. "Vamos te explicar um pouco sobre as voca��es.\n\n"
		modalMensagem = modalMensagem .. "Cada voca��o possui uma guilda, onde est�o localizados os NPC's espec�ficos que fornecer�o "
		modalMensagem = modalMensagem .. "desde equipamentos b�sicos at� itens mais avan�ados.\n\n"
		modalMensagem = modalMensagem .. "Chegou a hora de conhecer a sua guilda. Vamos l�!\n\n"
	elseif id == 12 then
		modalMensagem = modalMensagem .. "Chegamos! Essa � a 'Guilda dos " .. self:formatarNomeVocacao() .. "'.\n\n"
		modalMensagem = modalMensagem .. "O mestre da guilda ir� te fornecer algumas informa��es importantes!\n\n"
		modalMensagem = modalMensagem .. "Boa sorte em sua jornada e divirta-se!\n"
	elseif isInArray({13}, id) then
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

function Player:checarSemVocacao()
	if self:getVocation():getId() == 0 then
		return true
	end

	return false
end

function Player:enviarModalSemVocacao()
	local modalTitulo = "Escolha uma Voca��o"
	local modalMensagem = "O seu personagem n�o possui nenhuma voca��o.\n\n"
	modalMensagem = modalMensagem .. "Selecione uma das op��es abaixo e tecle 'enter' ou clique em 'escolher' para mudar sua voca��o.\n"
	local modal = ModalWindow(tutorialId+tutorialFinalizado+1, modalTitulo, modalMensagem)
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

function Player:enviarModalAindaSemVocacao()
	if self:getVocation():getId() > 0 then
		local modalTitulo = "Nenhuma Voca��o foi Selecionada"
		local modalMensagem = "Voc� n�o escolheu nenhuma voca��o na janela anterior.\n"
		modalMensagem = modalMensagem .. "� obrigat�rio a escolha de uma voca��o para permanecer conectado ao jogo.\n\n"
		modalMensagem = modalMensagem .. "Clique em 'Voltar' para retornar � janela anterior e selecionar uma voca��o.\n"
		modalMensagem = modalMensagem .. "Clique em 'Sair' caso n�o queira escolher uma voca��o agora - essa op��o te desconectar� do jogo.\n"
		local modal = ModalWindow(tutorialId+tutorialFinalizado+2, modalTitulo, modalMensagem)
		modal:addButton(1, "Voltar")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		modal:sendToPlayer(self)
	end
end

function Player:pegarPassoTutorial()
	return math.max(1, self:getStorageValue(tutorialId))
end

function Player:atualizarPassoTutorial(passo)
	return self:setStorageValue(tutorialId, passo)
end

function Player:enviarModalItensKnight()
	local modalTitulo = "Escolha uma Arma"
	local modalMensagem = "Escolha uma das armas abaixo e clique em 'Escolher', tecle entre ou d� um clique duplo na op��o desejada para receb�-la.\n\n"
	local modal = ModalWindow(modalItensKnight, modalTitulo, modalMensagem)
	modal:addChoice(1, "Arma Aleat�ria")
	modal:addChoice(2, capAll(ItemType(itensKnight[1]):getName()) .. " (Espada)")
	modal:addChoice(3, capAll(ItemType(itensKnight[2]):getName()) .. " (Clava)")
	modal:addChoice(4, capAll(ItemType(itensKnight[3]):getName()) .. " (Machado)")
	modal:addButton(1, "Escolher")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Sair")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
	self:registerEvent("ItensKnight")
end

function Player:tutorialMestreGuilda()
	local vocacaoJogador = self:getVocation():getId()
	local npcReputacao = pegarNpcReputacao(vocacaoJogador)
	local npc = Npc(npcReputacao)

	self:desativarInteracaoNpcs()

	local mensagens = {
		"Ol� " .. self:getName() .. ". Meu nome � " .. npcReputacao .. " e eu sou o mestre da guilda.",
		"Durante sua jornada � importante ter em mente que voc� deve mostrar o seu valor para a guilda.",
		"Para isso voc� dever� realizar algumas tarefas e eu te recompensarei com pr�mios e bonifica��es.",
		"Para voc� conseguir sua promo��o, � necess�rio realizar pelo menos uma tarefa. Escolha uma tarefa na janela que aparecer� em alguns segundos."
	}

	addEvent(function(playerId)
		self:enviarTasksModalPrincipal()
		self:registerEvent("Tasks")
		self:allowMovement(true)
		self:ativarInteracaoNpcs()
	end, 21150, self:getId())

	addEvent(npcSay, 150, self:getId(), npc:getId(), mensagens[1])
	addEvent(npcSay, 5000, self:getId(), npc:getId(), mensagens[2])
	addEvent(npcSay, 10000, self:getId(), npc:getId(), mensagens[3])
	addEvent(npcSay, 15000, self:getId(), npc:getId(), mensagens[4])
end
