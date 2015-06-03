destinos = {
	["ilha_inicial"] = {
		nome = "Ilha Inicial",
		posicao = {x = 644, y = 942, z = 6},
		custo = 100,
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
		posicao = {x = 882, y = 1940, z = 6},
		custo = 100,
		levelNecessario = 0
	},
	["civitaten_barco"] = {
		nome = "Civitaten",
		posicao = {x = 928, y = 1900, z = 2},
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
		nome = "Ôttô",
		posicao = {x = 834, y = 1258, z = 6},
		custo = 100,
		levelNecessario = 0
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
		nome = "Khazad-dûm",
		posicao = {x = 1513, y = 1753, z = 8},
		custo = 100,
		levelNecessario = 0
	},
	["dragon_mugulu"] = {
		nome = "Mugulu",
		posicao = {x = 744, y = 1688, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["mugulu_dragon"] = {
		nome = "Ilha dos Dragões",
		posicao = {x = 704, y = 1241, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["ilha_inicial_parte_alta_baixa"] = {
		nome = "Parte Baixa da Ilha",
		posicao = {x = 601, y = 1085, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["ilha_inicial_parte_baixa_alta"] = {
		nome = "Parte Alta da Ilha",
		posicao = {x = 587, y = 1018, z = 7},
		custo = 100,
		levelNecessario = 0
	}
}
-- Tipos Aceitos: navio, tapete, barco
barqueiros = {
	["Palter Dilventan"] = {
		destinos = {
			"civitaten_barco",
			"hyalakur_barco",
			"otto"
		},
		tipo_viagem = "navio"
	},
	["Eteringe Genon"] = {
		destinos = {
			"kyo",
			"hyalakur_barco",
			"civitaten_barco",
			"mugulu"
		},
		tipo_viagem = "navio"
	},
	["Ghariva Titodimoon"] = {
		destinos = {
			"otto",
			"algatar",
			"civitaten_barco"
		},
		tipo_viagem = "navio"
	},
	["Zairda Soron"] = {
		destinos = {
			"algatar",
			"hyalakur_barco",
			"civitaten_barco"
		},
		tipo_viagem = "navio"
	},
	["Akheria Sudayth"] = {
		destinos = {
			"mugulu",
			"hyalakur_barco",
			"ilha_inicial"
		},
		tipo_viagem = "navio"
	},
	["Mado Arbells"] = {
		destinos = {
			"otto",
			"algatar",
			"kyo",
			"ilha_inicial"
		},
		tipo_viagem = "navio"
	},
	["Pewarthor Daellits"] = {
		destinos = {
			"mugulu",
			"algatar",
			"kyo",
			"ilha_inicial"
		},
		tipo_viagem = "navio"
	},
	["Zerillion Darica"] = {
		destinos = {
			"udecoat",
			"civitaten_tapete",
			"hyalakur_tapete"
		},
		tipo_viagem = "tapete"
	},
	["Haless Amonius"] = {
		destinos = {
			"pundera",
			"civitaten_tapete",
			"hyalakur_tapete",
			"lorn"
		},
		tipo_viagem = "tapete"
	},
	["Vuwulo Retulon"] = {
		destinos = {
			"pundera",
			"udecoat",
			"lorn",
			"khazad_dum"
		},
		tipo_viagem = "tapete"
	},
	["Airotear Greli"] = {
		destinos = {
			"lorn",
			"hyalakur_tapete"
		},
		tipo_viagem = "tapete"
	},
	["Pheanak Livertin"] = {
		destinos = {
			"udecoat",
			"lorn",
			"pundera"
		},
		tipo_viagem = "tapete"
	},
	["Yendsos Anian"] = {
		destinos = {
			"civitaten_tapete",
			"lorn",
			"udecoat",
			"hyalakur_tapete"
		},
		tipo_viagem = "tapete"
	},
	["Rafter Demarm"] = {
		destinos = {"ilha_inicial_parte_alta_baixa"},
		tipo_viagem = "barco"
	},
	["Rafter Bous"] = {
		destinos = {"ilha_inicial_parte_baixa_alta"},
		tipo_viagem = "barco"
	}
}