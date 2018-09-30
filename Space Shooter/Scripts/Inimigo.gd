extends "res://Scripts/Classe_inimigo.gd"

var pre_tiro = preload("res://Scenes/Tiro_inimigo.tscn")

signal destruiu
signal destruir

func _on_Tiro_timer_timeout():
	var tiro = pre_tiro.instance()
	
	tiro.global_position = $Tiro_pos.global_position
	Game.getCamera().add_child(tiro)
	$TiroSFX.play()

func _inicia():
	$Sprite.texture = Recursos.random_ini_tex()

func _destroi():
	$ExplosaoSFX.play()
	$Sprite.hide()
	$Tiro_timer.stop()
	$Explosao.get_node("Anim").play("Explosao")
	emit_signal("destruir")

func _explosion():
	pass


func _on_Anim_animation_finished(anim_name):
	if anim_name == "Explosao":
		emit_signal("destruiu")
		queue_free()
