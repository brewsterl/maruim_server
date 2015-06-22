local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeywords({{'forja'}, {'forjar'}}, StdModule.say, {npcHandler = npcHandler, text = "Existem muitas {receitas} para {produzir}, cada uma delas com sua caracter�stica e {dificuldade}."})
keywordHandler:addKeyword({'produzir'}, StdModule.say, {npcHandler = npcHandler, text = "Para produzir alguma receita voc� dever� usar a bigorna. Voc� pode usar essa que est� do meu lado, caso esteja dispon�vel."})
keywordHandler:addKeywords({{'receita'}, {'receitas'}}, StdModule.say, {npcHandler = npcHandler, text = "Existem receitas que voc� poder� produzir conforme sua evolu��o como ferreiro, outras voc� dever� aprender de outras diversas maneiras."})
keywordHandler:addKeywords({{'dificuldade'}, {'dificuldades'}}, StdModule.say, {npcHandler = npcHandler, text = "Existem receitas de diversas dificuldades, conforme sua {evolu��o} como ferreiro voc� aprimora suas habilidades, podendo produzir equipamentos cada vez mais poderosos."})
keywordHandler:addKeywords({{'evolucao'}, {'evolu��o'}}, StdModule.say, {npcHandler = npcHandler, text = "Para evoluir na sua profiss�o, voc� deve produzir receitas, mesmo que voc� n�o obtenha sucesso, isso lhe garantir� pontos de experi�ncia."})

npcHandler:setMessage(MESSAGE_GREET, "Ol� aventureiro, seja bem-vindo � minha {forja}, em que posso lhe ajudar?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Boa viagem aventureiro!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "De nada!!!")

npcHandler:addModule(FocusModule:new())