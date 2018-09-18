extends Area2D

var vel = 250
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
	vida -= valor
	if vida <= 0:
		queue_free()
		pass
	pass