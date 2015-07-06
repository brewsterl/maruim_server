destinos = {
	["ilha_inicial"] = {
		nome = "Ilha Inicial",
		posicao = {x = 633, y = 939, z = 6},
		custo = 30,
		levelNecessario = 0
	},
	["mugulu"] = {
		nome = "Mugulu",
		posicao = {x = 738, y = 1800, z = 6},
		custo = 100,
		levelNecessario = 0
	},
	["civitaten_tapete"] = {
		nome = "Civitaten",
		posicao = {x = 928, y = 1900, z = 2},
		custo = 100,
		levelNecessario = 0
	},
	["civitaten_barco"] = {
		nome = "Civitaten",
		posicao = {x = 882, y = 1940, z = 6},
		custo = 100,
		levelNecessario = 0
	},
	["udecoat"] = {
		nome = "Udecoat",
		posicao = {x = 921, y = 1774, z = 8},
		custo = 100,
		levelNecessario = 0
	},
	["otto"] = {
		nome = "�tt�",
		posicao = {x = 834, y = 1258, z = 6},
		custo = 100,
		levelNecessario = 0,
		palavrasChave = {"otto", "�tt�"}
	},
	["pundera"] = {
		nome = "Pundera",
		posicao = {x = 875, y = 1523, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["hyalakur_tapete"] = {
		nome = "Hyalakur",
		posicao = {x = 1084, y = 1592, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["hyalakur_barco"] = {
		nome = "Hyalakur",
		posicao = {x = 1102, y = 1512, z = 6},
		custo = 100,
		levelNecessario = 0
	},
	["lorn"] = {
		nome = "Lorn",
		posicao = {x = 1329, y = 1713, z = 6},
		custo = 100,
		levelNecessario = 0
	},
	["kyo"] = {
		nome = "Kyo",
		posicao = {x = 1397, y = 1871, z = 6},
		custo = 100,
		levelNecessario = 0
	},
	["algatar"] = {
		nome = "Algatar",
		posicao = {x = 1139, y = 1996, z = 6},
		custo = 100,
		levelNecessario = 0
	},
	["khazad_dum"] = {
		nome = "Khazad-d�m",
		posicao = {x = 1513, y = 1753, z = 8},
		custo = 100,
		levelNecessario = 0,
		palavrasChave = {"khazad d�m", "khazad dum"}
	},
	["dragon_mugulu"] = {
		nome = "Mugulu",
		posicao = {x = 744, y = 1688, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["mugulu_dragon"] = {
		nome = "Ilha dos Drag�es",
		posicao = {x = 704, y = 1241, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["ilha_inicial_parte_alta_baixa"] = {
		nome = "Parte Baixa da Ilha",
		posicao = {x = 601, y = 1085, z = 7},
		custo = 10,
		levelNecessario = 0
	},
	["ilha_inicial_parte_baixa_alta"] = {
		nome = "Parte Alta da Ilha",
		posicao = {x = 587, y = 1018, z = 7},
		custo = 10,
		levelNecessario = 0
	}
}
barqueiros = {
	["Palter Dilventan"] = {
		destinos = {
			"civitaten_barco",
			"hyalakur_barco",
			"otto"
		},
		tipoViagem = "navio"
	},
	["Eteringe Genon"] = {
		destinos = {
			"kyo",
			"hyalakur_barco",
			"civitaten_barco",
			"mugulu"
		},
		tipoViagem = "navio"
	},
	["Ghariva Titodimoon"] = {
		destinos = {
			"otto",
			"algatar",
			"civitaten_barco"
		},
		tipoViagem = "navio"
	},
	["Zairda Soron"] = {
		destinos = {
			"algatar",
			"hyalakur_barco",
			"civitaten_barco"
		},
		tipoViagem = "navio"
	},
	["Akheria Sudayth"] = {
		destinos = {
			"mugulu",
			"hyalakur_barco",
			"ilha_inicial"
		},
		tipoViagem = "navio"
	},
	["Mado Arbells"] = {
		destinos = {
			"otto",
			"algatar",
			"kyo",
			"ilha_inicial"
		},
		tipoViagem = "navio"
	},
	["Pewarthor Daellits"] = {
		destinos = {
			"mugulu",
			"algatar",
			"kyo",
			"ilha_inicial"
		},
		tipoViagem = "navio"
	},
	["Zerillion Darica"] = {
		destinos = {
			"udecoat",
			"civitaten_tapete",
			"hyalakur_tapete"
		},
		tipoViagem = "tapete"
	},
	["Haless Amonius"] = {
		destinos = {
			"pundera",
			"civitaten_tapete",
			"hyalakur_tapete",
			"lorn"
		},
		tipoViagem = "tapete"
	},
	["Vuwulo Retulon"] = {
		destinos = {
			"pundera",
			"udecoat",
			"lorn",
			"khazad_dum"
		},
		tipoViagem = "tapete"
	},
	["Airotear Greli"] = {
		destinos = {
			"lorn",
			"hyalakur_tapete"
		},
		tipoViagem = "tapete"
	},
	["Pheanak Livertin"] = {
		destinos = {
			"udecoat",
			"lorn",
			"pundera"
		},
		tipoViagem = "tapete"
	},
	["Yendsos Anian"] = {
		destinos = {
			"civitaten_tapete",
			"udecoat",
			"hyalakur_tapete",
			"khazad_dum"
		},
		tipoViagem = "tapete"
	},
	["Rafter Demarm"] = {
		destinos = {"ilha_inicial_parte_alta_baixa"},
		tipoViagem = "barco"
	},
	["Rafter Bous"] = {
		destinos = {"ilha_inicial_parte_baixa_alta"},
		tipoViagem = "barco"
	}
}

tempoBlessWoodenStake = 24*60*60

local limparNpcs = false
atualizarNpcsBanco = false
if limparNpcs then
	db.query("TRUNCATE TABLE `z_npcs`")
	db.query("TRUNCATE TABLE `z_npcs_itens`")
end

function atualizarNpcBanco(npc, tipo, informacoes)
	local npcNome = npc:getName()
	local npcId
	local resultId = db.storeQuery("SELECT `id` FROM `z_npcs` WHERE `nome` = " .. db.escapeString(npcNome))
	if resultId == false then
		db.query("INSERT INTO `z_npcs` (`nome`) VALUES (" .. db.escapeString(npcNome) .. ")")
		npcId = db.lastInsertId()
		print(npcNome .. " -> foi adicionado ao banco de dados.")
	else
		npcId = result.getDataInt(resultId, "id")
	end
	if tipo then
		if tipo == "comerciante" then
			local itemId = informacoes[1]
			local itemValor = informacoes[2]
			local itemSubTipo = informacoes[3]
			local acao = informacoes[4]
			local resultItemId = db.storeQuery("SELECT `id` FROM `z_npcs_itens` WHERE (`npc` = " .. db.escapeString(npcId) .. " and `item` = " .. db.escapeString(itemId) .. " and `acao` = " .. db.escapeString(acao) .. ")")
			if resultItemId == false then
				db.query("INSERT INTO `z_npcs_itens` (`npc`, `item`, `valor`, `subtipo`, `acao`) VALUES (" .. db.escapeString(npcId) .. ", " .. db.escapeString(itemId) .. ", " .. db.escapeString(itemValor) .. ", " .. db.escapeString(itemSubTipo) .. ", " .. db.escapeString(acao) .. ")")
			else
				local dbItemId = result.getDataInt(resultId, "id")
				db.query("UPDATE `z_npcs_itens` SET `item` = " .. db.escapeString(itemId) .. ", `valor` = " .. db.escapeString(itemValor) .. ", `subtipo` = " .. db.escapeString(itemSubTipo) .. ", `acao` = " .. db.escapeString(acao) .. " WHERE `id` = " .. db.escapeString(dbItemId))
			end
		end
	end
	result.free(resultId)
end

function atualizarNpcs()
	local resultId = db.storeQuery("SELECT `id`, `nome` FROM `z_npcs`")
	if resultId ~= false then
		repeat
		local npcId = result.getDataInt(resultId, "id")
		local npcNome = result.getDataString(resultId, "nome")
		local npc = Npc(npcNome)
		if npc ~= nil then
			local posicaoNpc = npc:getPosition()
			local npcOutfit = npc:getOutfit()
			db.query("UPDATE `z_npcs` SET `posx` = " .. db.escapeString(posicaoNpc.x) .. ", `posy` = " .. db.escapeString(posicaoNpc.y) .. ", `posz` = " .. db.escapeString(posicaoNpc.z) .. ", `lookBody` = " .. db.escapeString(npcOutfit.lookBody) .. ", `lookFeet` = " .. db.escapeString(npcOutfit.lookFeet) .. ", `lookHead` = " .. db.escapeString(npcOutfit.lookHead) .. ", `lookLegs` = " .. db.escapeString(npcOutfit.lookLegs) .. ", `lookType` = " .. db.escapeString(npcOutfit.lookType) .. ", `lookAddons` = " .. db.escapeString(npcOutfit.lookAddons) .. ", `lookMount` = " .. db.escapeString(npcOutfit.lookMount) .. "  WHERE `id` = " .. db.escapeString(npcId))
			print(npcNome .. " -> atualizado com sucesso.")
		end
		until not result.next(resultId)
		result.free(resultId)
	end
end
