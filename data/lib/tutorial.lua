tutorialId = 4500

function Player.iniciarTutorial(self)
	local posicaoInicioTutorial = Position(304, 2414, 7)
	self:teleportarJogador(posicaoInicioTutorial)
	self:allowMovement(false)
	self:enviarModalTutorial(1)
end

function Player.pularTutorial(self)
	self:teleportarJogador(Town(1):getTemplePosition())
	-- self:setStorageValue(tutorialId, 1)
end

function Player.enviarModalTutorial(self, id)
	local modalTitulo = "Tutorial"
	local modalMensagem = ""
	local opcoes = {}
	if id == 0 then
		modalMensagem = modalMensagem .. "Seja bem-vindo ao MaruimOT, " .. self:getName() .. "!\n\n"
		modalMensagem = modalMensagem .. "Se voc� � um iniciante por aqui e deseja receber algumas dicas para come�ar, selecione a op��o 'Iniciar Tutorial'.\n\n"
		modalMensagem = modalMensagem .. "Caso voc� seja experiente e j� conhe�a tudo o que pode fazer, selecione a op��o 'Pular Tutorial'.\n\n"
		opcoes = {
			"Iniciar Tutorial",
			"Pular Tutorial"
		}
	elseif id == 1 then
		modalMensagem = modalMensagem .. "Vamos come�ar!\n\n"
		modalMensagem = modalMensagem .. "Para melhor compreens�o, o tutorial ser� dividido nas seguintes partes:\n\n"
		modalMensagem = modalMensagem .. "-> Introdu��o\n"
		modalMensagem = modalMensagem .. "-> Explicando o Sistema de Crafting (Fabrica��o de Itens)\n"
		modalMensagem = modalMensagem .. "       - Profiss�es\n"
		modalMensagem = modalMensagem .. "       - Fabrica��o de Receitas\n"
		modalMensagem = modalMensagem .. "       - Obtendo Materiais\n"
		modalMensagem = modalMensagem .. "       - Coleta de Materiais\n"
		modalMensagem = modalMensagem .. "-> Voca��o\n"
		modalMensagem = modalMensagem .. "       - Guilda\n"
		modalMensagem = modalMensagem .. "       - Promo��o\n"
		modalMensagem = modalMensagem .. "-> Primeiros Passos\n"
		modalMensagem = modalMensagem .. "-> Conhecendo a 'Maruim Island'\n"
		modalMensagem = modalMensagem .. "-> Informa��es Adicionais\n"
	end
	local modal = ModalWindow(tutorialId+id, modalTitulo, modalMensagem)
	for i = 1, #opcoes do
		modal:addChoice(i, opcoes[i])
	end
	modal:addButton(1, "Pr�ximo")
	modal:setDefaultEnterButton(1)
	modal:sendToPlayer(self)
	self:registerEvent("TutorialModal")
end

function Player.checarSemVocacao(self)
	if self:getVocation():getId() == 0 then
		local modalTitulo = "Login Bloqueado"
		local modalMensagem = "Voc� deve escolher uma voca��o no site antes de conectar seu personagem.\n"
		local modal = ModalWindow(modalNoVocation, modalTitulo, modalMensagem)
		modal:addButton(1, "Ok")
		modal:setDefaultEnterButton(1)
		modal:sendToPlayer(self)
		return false
	end
	return true
end
