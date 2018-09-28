extends "res://Scripts/Classe_inimigo.gd"

var vel = 150
var rot = 0

func _inicia():
	rot = rand_range(-10, 10)
	set_process(true)

func _process(delta):
	position += Vector2(0, 1) * vel * delta
	rotate(rot * delta)
	if position.y > Game.game_view.y + 30:
		queue_free()

func _destroi():
	get_node("Anim").play("Destruir")
	$ExplosionFX.play()
	rot = 0

func _explosion():
	get_node("Anim").play("Danificado")


#animation functions
func _on_destruction_animation_finished(anim_name):
	
	if anim_name == "Destruir":
		queue_free()

func _on_Anim_animation_finished(anim_name):
	if anim_name == "Destruir":
		queue_free()
