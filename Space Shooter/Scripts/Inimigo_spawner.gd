extends Node2D

var pre_inimigo =  preload("res://Scenes/Path_inimigo.tscn") 

func _ready():
	randomize_timer()
	
	pass

func randomize_timer():
	$Timer.wait_time = rand_range(5, 10)

func _on_Timer_timeout():
	var inimigo = pre_inimigo.instance()
	get_parent().add_child(inimigo)
	randomize_timer()
	pass # replace with function body
