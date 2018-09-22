extends Area2D

var vel = 700
var dano

func _ready():
	set_process(true)
	$TiroSFX.play()
	dano = 0.8
	pass

func _process(delta):
	position += Vector2(0,-1) * vel * delta
	
	if position.y < -30:
		free()
	
	pass


func _on_Tiro_area_entered(area):
	
	if area.is_in_group(Game.GRUPO_INIMIGO):
		if area.has_method("aplica_dano"):
			area.aplica_dano(dano)
			destroi_tiro()
			pass
	
	
	pass

func destroi_tiro():
	queue_free()
	pass