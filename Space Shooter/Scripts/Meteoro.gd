extends Area2D

var vel = 150
var rot = 0
export var vida = 2
export var pontos = 10

func _ready():
	set_process(true)
	add_to_group(Game.GRUPO_INIMIGO)
	randomize()
	rot = rand_range(-10, 10)
	pass

func _process(delta):
	position += Vector2(0, 1) * vel * delta
	rotate(rot * delta)
	if position.y > Game.game_view.y + 30:
		queue_free()
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
		Game.score += pontos
		pass
	pass


func _on_destruction_animation_finished(anim_name):
	
	if anim_name == "Destruir":
		print("fim da animação")
		queue_free()



func _on_Anim_animation_finished(anim_name):
	if anim_name == "Destruir":
		print("fim da animação")
		queue_free()
