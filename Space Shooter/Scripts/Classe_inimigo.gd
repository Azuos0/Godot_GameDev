extends Area2D

export var vida = 2
export var pontos = 10

func _ready():
	add_to_group(Game.GRUPO_INIMIGO)
	_inicia()

func aplica_dano(valor):
	if vida > 0:
		_explosion()
		vida -= valor
		pass
	
	if vida <= 0:
		remove_from_group(Game.GRUPO_INIMIGO)
		z_index = 1
		_destroi()
		Game.getCamera().shake()
		Game.score += pontos
		pass
	pass

func _destroi():
	pass

func _explosion():
	pass

func _inicia():
	pass