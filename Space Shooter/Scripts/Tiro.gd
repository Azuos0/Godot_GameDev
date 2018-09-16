extends Node2D

var vel = 500

func _ready():
	set_process(true)
	pass

func _process(delta):
	position += Vector2(0,-1) * vel * delta
	
	if position.y < -30:
		free()
	
	pass
