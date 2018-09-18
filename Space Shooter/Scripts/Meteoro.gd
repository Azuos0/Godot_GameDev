extends Area2D

var vel = 150
var rot = 0
var vida = 4

func _ready():
	set_process(true)
	add_to_group(Game.GRUPO_INIMIGO)
	randomize()
	rot = rand_range(-5, 5)
	pass

func _process(delta):
	position += Vector2(0, 1) * vel * delta
	rotate(rot * delta)
	pass

func aplica_dano(valor):
	if vida <= 0:
		remove_from_group(Game.GRUPO_INIMIGO)
		get_node("Anim").play("Destruir")
		pass
	else:
		get_node("Anim").play("Danificado")
		vida -= valor
		pass
	pass