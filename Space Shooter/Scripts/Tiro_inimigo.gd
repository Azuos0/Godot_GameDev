extends Area2D

const GIRO = 180
const VEL = 200
const DIR = Vector2(0, 1)
var janela = OS.get_window_size()

func _ready():
	add_to_group(Game.GRUPO_TIRO_INIMIGO)
	set_process(true)

func _process(delta):
	rotate(deg2rad(GIRO) * delta)
	translate(DIR * VEL * delta)
	
	if position.y > janela.y + 30:
		queue_free()

func destroi():
	queue_free()