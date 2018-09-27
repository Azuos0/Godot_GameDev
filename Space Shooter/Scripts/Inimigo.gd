extends Area2D

var pre_tiro = preload("res://Scenes/Tiro_inimigo.tscn")

func _ready():
	add_to_group(Game.GRUPO_INIMIGO)
	$Sprite.texture = Recursos.random_ini_tex()

func destroi():
	queue_free()

func _on_Tiro_timer_timeout():
	var tiro = pre_tiro.instance()
	
	tiro.global_position = $Tiro_pos.global_position
	Game.getCamera().add_child(tiro)
	pass
