extends Area2D

var vel = 500

func _ready():
	set_process(true)
	pass

func _process(delta):
	position += Vector2(0,-1) * vel * delta
	
	if position.y < -30:
		free()
	
	pass


func _on_Tiro_area_entered(area):
	if area.is_in_group(Game.GRUPO_INIMIGO):
		if area.has_method("aplica_dano"):
			area.aplica_dano(1)
			pass
		else:
			destroi_tiro()
		pass
	
	pass # replace with function body

func destroi_tiro():
	queue_free()
	pass