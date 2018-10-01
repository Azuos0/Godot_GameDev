extends Node

const CENTER = Vector2(0,0)
const LEFT = Vector2(-1,0)
const RIGHT = Vector2(1,0)
const UP = Vector2(0,-1)
const DOWN = Vector2(0,1)

func rand():
	randomize()
	var d = randi() % 4 + 1
	match d:
		1:
			return LEFT
		2:
			return RIGHT
		3:
			return UP
		4:
			return DOWN