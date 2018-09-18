extends Node2D

var vel = 250
var rot = 0

func _ready():
	set_process(true)
	randomize()
	rot = rand_range(-5, 5)
	pass

func _process(delta):
	position += Vector2(0, 1) * vel * delta
	rotate(rot * delta)
	pass
