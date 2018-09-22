extends Area2D

var vel = 150
var rot = 0
var vida = 2

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
	if vida > 0:
		get_node("Anim").play("Danificado")
		vida -= valor
		pass
	
	if vida <= 0:
		remove_from_group(Game.GRUPO_INIMIGO)
		z_index = 1
		rot = 0
		get_node("Anim").play("Destruir")
		$ExplosionFX.play()
		Game.getCamera().shake()
		pass
	pass


func _on_destruction_animation_finished(anim_name):
	
	if anim_name == "Destruir":
		print("Destruido")
		queue_free()

