extends Node

var pre_meteor = preload("res://Scenes/Meteoro.tscn")
var intervalo = 2
var windowSize = OS.get_window_size()

func _ready():
	set_process(true)
	pass

func _process(delta):
	
	if intervalo > 0:
		intervalo-= delta
		pass
	else:
		randomize()
		intervalo = rand_range(0.3, 1)
		var meteoro = pre_meteor.instance()
		meteoro.position = Vector2(rand_range(30, windowSize.x - 30), -40)
		get_parent().add_child(meteoro)
		pass
	pass
