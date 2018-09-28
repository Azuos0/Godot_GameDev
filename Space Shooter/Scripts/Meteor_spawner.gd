extends Node

var pre_fabrica = preload("res://Scenes/Fabrica_de_meteoro.tscn")
var fabrica
var windowSize = OS.get_window_size()

func _ready():
	fabrica = pre_fabrica.instance()


func _on_Timer_timeout():
	$Timer.wait_time = rand_range(1.5, 3.5)
	var meteoro = fabrica.gera_meteoro_randomico()
	meteoro.position = Vector2(rand_range(30, windowSize.x - 30), -40)
	get_parent().add_child(meteoro)
