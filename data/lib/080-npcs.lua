atualizarNpcsBanco = false
interacaoNpcsDesativada = {}

frases = {
	["correio"] = {
		["greet"] = "Ol� |PLAYERNAME|. Seja bem-vindo aos Correios.",
		["trade"] = "Deseja despachar alguma encomenda? Eu tenho o que voc� precisa."
	},
	["comidas"] = {
		["greet"] = "Ol� |PLAYERNAME|. Seja bem-vindo � minha loja de alimentos.",
		["trade"] = "Interessado em algo? Voc� me parece faminto!"
	},
	["moveis"] = {
		["greet"] = "Seja bem-vindo, |PLAYERNAME|! Procurando por m�veis? Voc� veio ao lugar certo!"
	},
	["pocoes"] = {
		["greet"] = "Ol� |PLAYERNAME|. Seja bem-vindo � loja de po��es.",
		["trade"] = "Interessado em algo? D� uma olhada!"
	},
	["runas"] = {
		["greet"] = "Ol� |PLAYERNAME|. Seja bem-vindo � loja de runas.",
		["trade"] = "As pedras m�gicas s�o os artefatos mais poderosos que existem! D� uma olhada e me diga se estiver interessado em algo!"
	},
	["armas_distancia"] = {
		["greet"] = "Ol� |PLAYERNAME|. Eu negocios diversas armas � dist�ncia.",
		["trade"] = "Aqui est� minha lista! Interessado em algo?"
	}
}

comerciantes = {
	["Alcortone Elio"] = { -- Loja de Runas - Mugulu
		["itens"] = {
			["c"] = {"runas_c"},
			["v"] = {"runas_v"}
		},
		["frases"] = frases["runas"]
	},
	["Aldina Bixielin"] = { -- Loja de Runas - Algatar
		["itens"] = {
			["c"] = {"runas_c"},
			["v"] = {"runas_v"}
		},
		["frases"] = frases["runas"]
	},
	["Algarezin Phoranth"] = { -- Loja de Runas - Kyo
		["itens"] = {
			["c"] = {"runas_c"},
			["v"] = {"runas_v"}
		},
		["frases"] = frases["runas"]
	},
	["Anth Voon"] = { -- Loja de Utilidades - Khazad-D�m
		["itens"] = {
			["c"] = {"utilidades"}
		}
	},
	["Amyl Dannozon"] = { -- Loja de M�veis - Khazad-D�m
		["itens"] = {
			["c"] = {"moveis"}
		},
		["frases"] = frases["moveis"]
	},
	["Andor"] = { -- Loja de Clavas - Guilda dos Knights
		["itens"] = {
			["c"] = {2391, 2394, 2398, 2417, 2422, 2423, 2434, 2437, 2439, 2448, 2449},
			["v"] = {2391, 2394, 2398, 2417, 2422, 2423, 2434, 2437, 2439, 2448, 2449}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Eu compro e vendo diversos tipos de clavas poderosas. Interessado em algo, cavaleiro?"
		}
	},
	["Arcus Arataron"] = { -- Comprador de Madeira - Maruim Island
		["itens"] = {
			["v"] = {5901}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Podemos fazer neg�cio caso voc� tenha madeiras de boa qualidade para me vender.",
			["trade"] = "Interessado em negociar comigo? � pra j�!"
		}
	},
	["Argornim Juvindar"] = { -- Loja de Po��es - Mugulu
		["itens"] = {
			["c"] = {"pocoes_c"},
			["v"] = {"pocoes_v"}
		},
		["frases"] = frases["pocoes"]
	},
	["Arrongaria Turien"] = { -- Loja de Utilidades - Hyalakur
		["itens"] = {
			["c"] = {"utilidades"}
		}
	},
	["Artanis"] = { -- Loja de Armas � Dist�ncia "B�sicas" - Maruim Island
		["itens"] = {
			["c"] = {2389, {2410, 25}, {19390, 4}},
			["v"] = {2389, 2410, 19390}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Eu vendo lan�as e facas bem afiadas e de primeira linha. Voc� tamb�m pode me vender as suas, caso tenha alguma.",
			["trade"] = "� pra j�! Veja se est� interessado em algo."
		}
	},
	["Arto Larimin"] = { -- Carteiro - Lorn
		["itens"] = {
			["c"] = {"correio"}
		},
		["frases"] = frases["correio"]
	},
	["Ashlynois Homus"] = { -- Loja de Utilidades - Mugulu
		["itens"] = {
			["c"] = {"utilidades"}
		}
	},
	["Astantic Wunan"] = { -- Loja de M�veis - Mugulu
		["itens"] = {
			["c"] = {"moveis"}
		},
		["frases"] = frases["moveis"]
	},
	["Balim"] = { -- Comprador de Tecidos - �tt�
		["itens"] = {
			["v"] = {11210, 11224, 11236}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Seja bem-vindo � minha loja de tecidos."
		}
	},
	["Barna, Barba de Cascalho"] = { -- Loja de Armas - Maruim Island
		["itens"] = {
			["c"] = {2376, 2379, 2380, 2384, 2385, 2386, 2388, 2395, 2397, 2398, 2406, 2409, 2412, 2422, 2437, 2439, 2441, 2448, 2449, 2450, 2559, 8601, 8602},
			["v"] = {2376, 2379, 2380, 2384, 2385, 2386, 2388, 2395, 2397, 2398, 2406, 2409, 2412, 2422, 2437, 2439, 2441, 2448, 2449, 2450, 2559, 8601, 8602}
		}
	},
	["Belyne Fegotheahi"] = { -- Loja de Po��es - Algatar
		["itens"] = {
			["c"] = {"pocoes_c"},
			["v"] = {"pocoes_v"}
		},
		["frases"] = frases["pocoes"]
	},
	["Beth"] = { -- Loja de Comidas - Civitaten
		["itens"] = {
			["c"] = {"comidas_basicas"}
		},
		["frases"] = frases["comidas"]
	},
	["Boror"] = { -- Loja de Espadas - Guilda dos Knights
		["itens"] = {
			["c"] = {2376, 2377, 2379, 2383, 2384, 2385, 2395, 2396, 2397, 2406, 2409, 2412, 2450, 7385, 8602, 11309},
			["v"] = {2376, 2377, 2379, 2383, 2384, 2385, 2395, 2396, 2397, 2406, 2409, 2412, 2450, 7385, 8602, 11309}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Eu compro e vendo diversos tipos de espadas poderosas. Interessado em algo, cavaleiro?"
		}
	},
	["Dielixa Cymozina"] = { -- Loja de Po��es - �tt�
		["itens"] = {
			["c"] = {"pocoes_c"},
			["v"] = {"pocoes_v"}
		},
		["frases"] = frases["pocoes"]
	},
	["Doror"] = { -- Loja de Armas - Civitaten
		["itens"] = {
			["v"] = {2377, 2378, 2381, 2387, 2391, 2417, 2442, 7452}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Eu compro diversos tipos de armas."
		}
	},
	["Drago Fenne"] = { -- Loja de Po��es - Lorn
		["itens"] = {
			["c"] = {"pocoes_c"},
			["v"] = {"pocoes_v"}
		},
		["frases"] = frases["pocoes"]
	},
	["Eladriani Ewor"] = { -- Loja de M�veis - Civitaten
		["itens"] = {
			["c"] = {"moveis"}
		},
		["frases"] = frases["moveis"]
	},
	["Elron Meldo"] = { -- Loja de Armas � Dist�ncia - Algatar
		["itens"] = {
			["c"] = {"armas_distancia_c"},
			["v"] = {"armas_distancia_v"}
		},
		["frases"] = frases["armas_distancia"]
	},
	["Eron Darmbeon"] = { -- Carteiro - Pundera
		["itens"] = {
			["c"] = {"correio"}
		},
		["frases"] = frases["correio"]
	},
	["Evephy Phly"] = { -- Carteiro - Kyo
		["itens"] = {
			["c"] = {"correio"}
		},
		["frases"] = frases["correio"]
	},
	["Falatius Relidol"] = { -- Carteiro - �tt�
		["itens"] = {
			["c"] = {"correio"}
		},
		["frases"] = frases["correio"]
	},
	["Freenya Irin"] = { -- Loja de Utilidades - Civitaten
		["itens"] = {
			["c"] = {"utilidades"}
		}
	},
	["Frin Sale"] = { -- Loja de M�veis - Kyo
		["itens"] = {
			["c"] = {"moveis"}
		},
		["frases"] = frases["moveis"]
	},
	["Fron"] = { -- Loja de Itens M�gicos - Maruim Island
		["itens"] = {
			["c"] = {2182, 2185, 2186, 2188, 2190, 2191, 2260, 2261, 2265, 2266, 2277, 2285, 2301, 7618, 7620, 8704, 23722, 23723}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Seja bem-vindo � minha loja m�gica.",
			["trade"] = "Precisa de algo para criar algum feiti�o? D� uma olhada."
		}
	},
	["Gabriele"] = { -- Loja de Carnes - Hyalakur
		["itens"] = {
			["c"] = {2666, 2671}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Eu compro diversas armas."
		}
	},
	["Gandor"] = { -- Loja de Armas - �tt�
		["itens"] = {
			["v"] = {2379, 2380, 2406, 2448, 2449, 2559, 20104}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Eu compro diversas armas."
		}
	},
	["Ganor"] = { -- Loja de Machados - Guilda dos Knights
		["itens"] = {
			["c"] = {2378, 2380, 2386, 2388, 2425, 2429, 2441, 2559, 8601},
			["v"] = {2378, 2380, 2381, 2386, 2388, 2425, 2428, 2429, 2441, 2559, 8601}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Eu compro e vendo diversos tipos de machados poderosos. Interessado em algo, cavaleiro?"
		}
	},
	["Garen Dran"] = { -- Loja de Armas � Dist�ncia - Kyo
		["itens"] = {
			["c"] = {"armas_distancia_c"},
			["v"] = {"armas_distancia_v"}
		},
		["frases"] = frases["armas_distancia"]
	},
	["Gogilock Lena"] = { -- Carteiro - Udecoat
		["itens"] = {
			["c"] = {"correio"}
		},
		["frases"] = frases["correio"]
	},
	["Gundo Vangidma"] = { -- Loja de Armas � Dist�ncia - Civitaten
		["itens"] = {
			["c"] = {"armas_distancia_c"},
			["v"] = {"armas_distancia_v"}
		},
		["frases"] = frases["armas_distancia"]
	},
	["Hannah"] = { -- Loja de Frutas - Hyalakur
		["itens"] = {
			["c"] = {"frutas_basicas"}
		},
		["frases"] = frases["pocoes"]
	},
	["Ibigos Daymon"] = { -- Loja de Po��es - Pundera
		["itens"] = {
			["c"] = {"pocoes_c"},
			["v"] = {"pocoes_v"}
		},
		["frases"] = frases["pocoes"]
	},
	["Jachim Melliel"] = { -- Loja de Utilidades - Algatar
		["itens"] = {
			["c"] = {"utilidades"}
		}
	},
	["Jack"] = { -- Comprador de Produtos "Raros" de Criaturas - Maruim Island
		["itens"] = {
			["v"] = {2235, 5878, 5896, 5897, 5902, 8971, 9676, 11113, 12471}
		}
	},
	["James"] = { -- Loja de Comidas - Maruim Island
		["itens"] = {
			["c"] = {"comidas_basicas"}
		},
		["frases"] = frases["comidas"]
	},
	["Jane"] = { -- Comprador de Produtos "Comuns" de Criaturas - Maruim Island
		["itens"] = {
			["v"] = {2230, 2813, 2817, 3086, 3119, 8859, 10606, 10609, 11214, 12382, 12435, 12437, 12441, 12495, 13159}
		}
	},
	["Jide Malystona"] = { -- Loja de M�veis - Hyalakur
		["itens"] = {
			["c"] = {"moveis"}
		},
		["frases"] = frases["moveis"]
	},
	["Joe"] = { -- Comprador de Ervas - Maruim Island
		["itens"] = {
			["c"] = {2799, 2800, 12430},
			["v"] = {2799, 2800, 2805, 12430}
		}
	},
	["John"] = { -- Comprador de Produtos de Criaturas - �tt�
		["itens"] = {
			["v"] = {{2230, 20}, {2235, 42}, 2245, 2805, {5897, 60}, {5902, 45}, {9676, 50}, 10557, 10603, 10606, 11324, {12471, 44}, {12495, 15}, 19738, 19743, 20102, 20103, 21427, 21428}
		}
	},
	["Julius"] = { -- Loja de Amuletos - Maruim Island
		["itens"] = {
			["c"] = {2661, 2172, 2170},
			["v"] = {2661, 2172, 2170}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Eu negocios alguns tipos de amuletos."
		}
	},
	["Jund Alder"] = { -- Loja de Armas � Dist�ncia - Udecoat
		["itens"] = {
			["c"] = {"armas_distancia_c"},
			["v"] = {"armas_distancia_v"}
		},
		["frases"] = frases["armas_distancia"]
	},
	["Kalfafiny Niduril"] = { -- Loja de Utilidades - �tt�
		["itens"] = {
			["c"] = {"utilidades"}
		}
	},
	["Kardo Siren"] = { -- Loja de Runas - Pundera
		["itens"] = {
			["c"] = {"runas_c"},
			["v"] = {"runas_v"}
		},
		["frases"] = frases["runas"]
	},
	["Kilver Dojuf"] = { -- Loja de Runas - Udecoat
		["itens"] = {
			["c"] = {"runas_c"},
			["v"] = {"runas_v"}
		},
		["frases"] = frases["runas"]
	},
	["Lertrac"] = { -- Loja de Armas � Dist�ncia - Guilda dos Paladins
		["itens"] = {
			["c"] = {"armas_distancia_c", 2399, 2410, 2545, 2546, 2547, 7363, 7364, 7378, 7838, 7839, 7840, 7850, 15649, 18436},
			["v"] = {"armas_distancia_v", 2410}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Eu negocios diversas armas para paladins.",
			["trade"] = "Aqui est� minha lista! Interessado em algo?"
		}
	},
	["Lethai Gimmeroxa"] = { -- Loja de Po��es - Udecoat
		["itens"] = {
			["c"] = {"pocoes_c"},
			["v"] = {"pocoes_v"}
		},
		["frases"] = frases["pocoes"]
	},
	["Lontyrekta Mureus"] = { -- Loja de Po��es - Khazad-D�m
		["itens"] = {
			["c"] = {"pocoes_c"},
			["v"] = {"pocoes_v"}
		},
		["frases"] = frases["pocoes"]
	},
	["Lucerthor Eletratand"] = { -- Loja de Utilidades - Udecoat
		["itens"] = {
			["c"] = {"utilidades"}
		}
	},
	["Maran Marilin"] = { -- Loja de Armas � Dist�ncia - Mugulu
		["itens"] = {
			["c"] = {"armas_distancia_c"},
			["v"] = {"armas_distancia_v"}
		},
		["frases"] = frases["armas_distancia"]
	},
	["Maurice"] = { -- Comprador de Produtos de Criaturas - Civitaten
		["itens"] = {
			["v"] = {2129, 2229, 2800, 2805, 5678, {5897, 70}, 5899, 8859, 10553, 10557, 10568, 10569, 10574, 10606, 11189, 11191, 11192, 11208, 11210, 11224, 11324, 12399, 12400, 12423, 12440, 12441, 12471, 13757}
		}
	},
	["Mayanzux Uhko"] = { -- Carteiro - Mugulu
		["itens"] = {
			["c"] = {"correio"}
		},
		["frases"] = frases["correio"]
	},
	["Melamif Tufis"] = { -- Loja de Utilidades - Kyo
		["itens"] = {
			["c"] = {"utilidades"}
		}
	},
	["Meld Endimux"] = { -- Loja de M�veis - �tt�
		["itens"] = {
			["c"] = {"moveis"}
		},
		["frases"] = frases["moveis"]
	},
	["Mitefrena Gofaryx"] = { -- Loja de Runas - Kyo
		["itens"] = {
			["c"] = {"runas_c"},
			["v"] = {"runas_v"}
		},
		["frases"] = frases["runas"]
	},
	["Mood Neva"] = { -- Carteiro - Civitaten
		["itens"] = {
			["c"] = {"correio"}
		},
		["frases"] = frases["correio"]
	},
	["Nigos Morionomad"] = { -- Loja de Runas - Hyalakur
		["itens"] = {
			["c"] = {"runas_c"},
			["v"] = {"runas_v"}
		},
		["frases"] = frases["runas"]
	},
	["Oragon"] = { -- Loja de Utilidades - Pundera
		["itens"] = {
			["c"] = {"utilidades"}
		}
	},
	["Orran Samod"] = { -- Loja de Utilidades - Lorn
		["itens"] = {
			["c"] = {"utilidades"}
		}
	},
	["Phaos Thourasa"] = { -- Loja de Utilidades - Maruim Island
		["itens"] = {
			["c"] = {"utilidades", 2050}
		}
	},
	["Pith Dalen"] = { -- Loja de Runas - Lorn
		["itens"] = {
			["c"] = {"runas_c"},
			["v"] = {"runas_v"}
		},
		["frases"] = frases["runas"]
	},
	["Ranospight Asharus"] = { -- Loja de Po��es - Hyalakur
		["itens"] = {
			["c"] = {"pocoes_c"},
			["v"] = {"pocoes_v"}
		},
		["frases"] = frases["pocoes"]
	},
	["Ratur Miren"] = { -- Carteiro - Algatar
		["itens"] = {
			["c"] = {"correio"}
		},
		["frases"] = frases["correio"]
	},
	["Rhurus Tivainga"] = { -- Loja de Armas � Dist�ncia - Khazad-D�m
		["itens"] = {
			["c"] = {"armas_distancia_c"},
			["v"] = {"armas_distancia_v"}
		},
		["frases"] = frases["armas_distancia"]
	},
	["Rodbla Pheak"] = { -- Loja de M�veis - Algatar
		["itens"] = {
			["c"] = {"moveis"}
		},
		["frases"] = frases["moveis"]
	},
	["Rukarian Miru"] = { -- Loja de Armas � Dist�ncia - Hyalakur
		["itens"] = {
			["c"] = {"armas_distancia_c"},
			["v"] = {"armas_distancia_v"}
		},
		["frases"] = frases["armas_distancia"]
	},
	["Sergh Sinath"] = { -- Loja de M�veis - Lorn
		["itens"] = {
			["c"] = {"moveis"}
		},
		["frases"] = frases["moveis"]
	},
	["Seynos Malia"] = { -- Peixeiro - Maruim Island (Parte Baixa da Ilha)
		["itens"] = {
			["c"] = {{2667, 5}},
			["v"] = {2669, 7158, 7159, 7963, 13546}
		},
		["frases"] = {
			["trade"] = "Tenho diversos bons itens para aventureiros, haha, d� uma olhada!"
		}
	},
	["Sham Edirowanor"] = { -- Loja de Runas - Civitaten
		["itens"] = {
			["c"] = {"runas_c"},
			["v"] = {"runas_v"}
		},
		["frases"] = frases["runas"]
	},
	["Silingria Eowst"] = { -- Loja de Armas � Dist�ncia - Lorn
		["itens"] = {
			["c"] = {"armas_distancia_c"},
			["v"] = {"armas_distancia_v"}
		},
		["frases"] = frases["armas_distancia"]
	},
	["Sirk Skana"] = { -- Loja de Armaduras - Maruim Island
		["itens"] = {
			["c"] = {2457, 2458, 2459, 2460, 2461, 2463, 2464, 2465, 2467, 2468, 2473, 2478, 2480, 2481, 2482, 2483, 2484, 2508, 2642, 2643, 2647, 2648, 2649},
			["v"] = {2457, 2458, 2459, 2460, 2461, 2463, 2464, 2465, 2467, 2468, 2473, 2478, 2480, 2481, 2482, 2483, 2484, 2508, 2642, 2643, 2647, 2648, 2649}
		},
		["frases"] = {
			["trade"] = "Tenho diversos bons itens para aventureiros, haha, d� uma olhada!"
		}
	},
	["Sobek"] = { -- Est�tua - Itens do Horestis
		["itens"] = {
			["c"] = {13529},
			["v"] = {13531, 13532}
		},
		["frases"] = {
			["greet"] = "Sabah el-kheir, etsharafna!",
			["trade"] = "Hena la!"
		}
	},
	["Talita Dakeris"] = { -- Loja de Armas � Dist�ncia - �tt�
		["itens"] = {
			["c"] = {"armas_distancia_c"},
			["v"] = {"armas_distancia_v"}
		},
		["frases"] = frases["armas_distancia"]
	},
	["Tara Alcreka"] = { -- Loja de M�veis - Udecoat
		["itens"] = {
			["c"] = {"moveis"}
		},
		["frases"] = frases["moveis"]
	},
	["Tatoru Ogilvenno"] = { -- Loja de Runas - Khazad-D�m
		["itens"] = {
			["c"] = {"runas_c"},
			["v"] = {"runas_v"}
		},
		["frases"] = frases["runas"]
	},
	["Thanus Blackwood"] = { -- Loja de Wands - Guilda dos Sorcerers
		["itens"] = {
			["c"] = {2187, 2188, 2189, 2190, 2191, 8920, 8921, 8922}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Eu vendo wands para sorcerers.",
			["trade"] = "Aqui est�o, d� uma olhada!"
		}
	},
	["Toliashaen Leart"] = { -- Loja de Runas - �tt�
		["itens"] = {
			["c"] = {"runas_c"},
			["v"] = {"runas_v"}
		},
		["frases"] = frases["runas"]
	},
	["Tryn"] = { -- Loja de Escudos - Maruim Island
		["itens"] = {
			["c"] = {2509, 2510, 2511, 2512, 2513, 2525, 2526, 2530, 2531, 2541},
			["v"] = {2509, 2510, 2511, 2512, 2513, 2525, 2526, 2530, 2531, 2541}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Seja bem-vindo � minha loja. Escudos s�o a minha especialidade!",
			["trade"] = "Essa � a lista de escudos que eu negocio!"
		}
	},
	["Turizaban Ruanis"] = { -- Carteiro - Khazad-D�m
		["itens"] = {
			["c"] = {"correio"}
		},
		["frases"] = frases["correio"]
	},
	["Vuhtria Rath"] = { -- Carteiro - Hyalakur
		["itens"] = {
			["c"] = {"correio"}
		},
		["frases"] = frases["correio"]
	},
	["Xanthe"] = { -- Loja de Rods - Guilda dos Druids
		["itens"] = {
			["c"] = {2181, 2182, 2183, 2185, 2186, 8910, 8911, 8912}
		},
		["frases"] = {
			["greet"] = "Ol� |PLAYERNAME|. Eu vendo rods para druids.",
			["trade"] = "Aqui est�o, d� uma olhada!"
		}
	},
	["Yoruba"] = { -- Comprador de Fragmentos de Solo
		["itens"] = {
			["v"] = {8299}
		},
		["frases"] = {
			["greet"] = "Jy het iets vir my?",
			["trade"] = "Kom ons kyk.",
			["farewell"] = "Totsiens, gaan veilig!",
			["walkaway"] = "Die vloek op julle!!"
		}
	},
	["Yugan Peffon"] = { -- Loja de Po��es - Civitaten
		["itens"] = {
			["c"] = {"pocoes_c"},
			["v"] = {"pocoes_v"}
		},
		["frases"] = frases["pocoes"]
	},
	["Zirom Raularion"] = { -- Loja de Armas � Dist�ncia - Pundera
		["itens"] = {
			["c"] = {"armas_distancia_c"},
			["v"] = {"armas_distancia_v"}
		},
		["frases"] = frases["armas_distancia"]
	}
}

destinos = {
	["maruim_island"] = {
		nome = "Maruim Island",
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
		custo = 60,
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
		custo = 60,
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
		custo = 60,
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
		nome = "Khazad-D�m",
		posicao = {x = 1513, y = 1753, z = 8},
		custo = 100,
		levelNecessario = 0,
		palavrasChave = {"khazad d�m", "khazad dum"}
	},
	["dragon_mugulu"] = {
		nome = "Mugulu",
		posicao = {x = 789, y = 1739, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["mugulu_dragon"] = {
		nome = "Ilha dos Drag�es",
		posicao = {x = 704, y = 1241, z = 7},
		custo = 100,
		levelNecessario = 0,
		palavrasChave = {"ilha dos dragoes"}
	},
	["maruim_island_parte_alta_baixa"] = {
		nome = "Parte Baixa da Ilha",
		posicao = {x = 601, y = 1085, z = 7},
		custo = 10,
		levelNecessario = 0
	},
	["maruim_island_parte_baixa_alta"] = {
		nome = "Parte Alta da Ilha",
		posicao = {x = 587, y = 1018, z = 7},
		custo = 10,
		levelNecessario = 0
	}
}

barqueiros = {
	["maruim_island"] = {
		destinos = {
			"civitaten_barco",
			"hyalakur_barco",
			"otto"
		},
		tipoViagem = "navio"
	},
	["algatar"] = {
		destinos = {
			"kyo",
			"hyalakur_barco",
			"civitaten_barco",
			"mugulu"
		},
		tipoViagem = "navio"
	},
	["mugulu"] = {
		destinos = {
			"otto",
			"algatar",
			"civitaten_barco"
		},
		tipoViagem = "navio"
	},
	["kyo"] = {
		destinos = {
			"algatar",
			"hyalakur_barco",
			"civitaten_barco"
		},
		tipoViagem = "navio"
	},
	["otto"] = {
		destinos = {
			"mugulu",
			"hyalakur_barco",
			"civitaten_barco",
			"maruim_island"
		},
		tipoViagem = "navio"
	},
	["hyalakur_barco"] = {
		destinos = {
			"civitaten_barco",
			"otto",
			"algatar",
			"kyo",
			"maruim_island"
		},
		tipoViagem = "navio"
	},
	["civitaten_barco"] = {
		destinos = {
			"hyalakur_barco",
			"mugulu",
			"algatar",
			"otto",
			"kyo",
			"maruim_island"
		},
		tipoViagem = "navio"
	},
	["pundera"] = {
		destinos = {
			"udecoat",
			"civitaten_tapete",
			"hyalakur_tapete"
		},
		tipoViagem = "tapete"
	},
	["udecoat"] = {
		destinos = {
			"pundera",
			"civitaten_tapete",
			"hyalakur_tapete",
			"lorn"
		},
		tipoViagem = "tapete"
	},
	["hyalakur_tapete"] = {
		destinos = {
			"civitaten_tapete",
			"pundera",
			"udecoat",
			"lorn",
			"khazad_dum"
		},
		tipoViagem = "tapete"
	},
	["khazad_dum_tapete"] = {
		destinos = {
			"lorn",
			"hyalakur_tapete"
		},
		tipoViagem = "tapete"
	},
	["civitaten_tapete"] = {
		destinos = {
			"hyalakur_tapete",
			"udecoat",
			"lorn",
			"pundera"
		},
		tipoViagem = "tapete"
	},
	["lorn"] = {
		destinos = {
			"civitaten_tapete",
			"udecoat",
			"hyalakur_tapete",
			"khazad_dum"
		},
		tipoViagem = "tapete"
	},
	["maruim_island_parte_alta"] = {
		destinos = {"maruim_island_parte_alta_baixa"},
		tipoViagem = "barco"
	},
	["maruim_island_parte_baixa"] = {
		destinos = {"maruim_island_parte_baixa_alta"},
		tipoViagem = "barco"
	},
	["mugulu_dragon"] = {
		destinos = {"mugulu_dragon"},
		tipoViagem = "barco"
	},
	["dragon_mugulu"] = {
		destinos = {"dragon_mugulu"},
		tipoViagem = "barco"
	}
}

relacionarBarqueiros = {
	["Palter Dilventan"] = "maruim_island",
	["Eteringe Genon"] = "algatar",
	["Ghariva Titodimoon"] = "mugulu",
	["Zairda Soron"] = "kyo",
	["Akheria Sudayth"] = "otto",
	["Mado Arbells"] = "hyalakur_barco",
	["Pewarthor Daellits"] = "civitaten_barco",
	["Zerillion Darica"] = "pundera",
	["Haless Amonius"] = "udecoat",
	["Vuwulo Retulon"] = "hyalakur_tapete",
	["Airotear Greli"] = "khazad_dum_tapete",
	["Pheanak Livertin"] = "civitaten_tapete",
	["Yendsos Anian"] = "lorn",
	["Rafter Demarm"] = "maruim_island_parte_alta",
	["Rafter Bous"] = "maruim_island_parte_baixa",
	["Rafter Smar"] = "mugulu_dragon",
	["Rafter Pras"] = "dragon_mugulu"
}

tempoBlessWoodenStake = 24*60*60

function Player:desativarInteracaoNpcs()
	interacaoNpcsDesativada[self:getId()] = true
end

function Player:ativarInteracaoNpcs()
	interacaoNpcsDesativada[self:getId()] = false
end

function Player:verificarInteracaoNpcs()
	return interacaoNpcsDesativada[self:getId()] or false
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
	db.query("TRUNCATE TABLE `z_npcs_posicoes`")
	local npcs = {}
	local resultId = db.storeQuery("SELECT `id`, `nome` FROM `z_npcs`")

	if resultId ~= false then
		local proximoResultado = true
		while proximoResultado do
			local npcId = result.getDataInt(resultId, "id")
			local npcNome = result.getDataString(resultId, "nome")
			table.insert(npcs, {npcId, npcNome})
			if not result.next(resultId) then
				proximoResultado = false
			end
		end
		result.free(resultId)
	end

	for i = 1, #npcs do
		local npcId = npcs[i][1]
		local npcNome = npcs[i][2]
		local npcPosicoes = {}

		local npc = Npc(npcNome)
		while npc ~= nil do
			local outfit = npc:getOutfit()
			local posicao = npc:getPosition()
			db.query("UPDATE `z_npcs` SET `lookBody` = " .. db.escapeString(outfit.lookBody) .. ", `lookFeet` = " .. db.escapeString(outfit.lookFeet) .. ", `lookHead` = " .. db.escapeString(outfit.lookHead) .. ", `lookLegs` = " .. db.escapeString(outfit.lookLegs) .. ", `lookType` = " .. db.escapeString(outfit.lookType) .. ", `lookAddons` = " .. db.escapeString(outfit.lookAddons) .. ", `lookMount` = " .. db.escapeString(outfit.lookMount) .. "  WHERE `id` = " .. db.escapeString(npcId))
			db.query("INSERT INTO `z_npcs_posicoes` (`npc`, `posx`, `posy`, `posz`) VALUES (" .. db.escapeString(npcId) .. ", " .. db.escapeString(posicao.x) .. ", " .. db.escapeString(posicao.y) .. ", " .. db.escapeString(posicao.z) .. ")")
			print(npcNome .. " -> atualizado com sucesso.")
			if npcNome ~= "Jefrey" then
				table.insert(npcPosicoes, posicao)
				npc:remove(1)
				npc = Npc(npcNome)
			else
				npc = nil
			end
		end

		for i = 1, #npcPosicoes do
			local npc = Game.createNpc(npcNome, npcPosicoes[i])
			npc:setMasterPos(npcPosicoes[i])
		end
	end
end

if atualizarNpcsBanco then
	db.query("TRUNCATE TABLE `z_npcs`")
	db.query("TRUNCATE TABLE `z_npcs_itens`")
end
