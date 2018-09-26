extends Node

var paths = []
const path_dir = "res://Path/"

func _ready():
	carrega_paths()

func random_path():
	randomize()
	return paths[randi() % paths.size()]

func carrega_paths():
	var dir = Directory.new()
	if dir.open(path_dir) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while (file_name != ""):
			var path = load(path_dir + file_name)
			if path && path is Curve2D:
					paths.append(path)
			file_name = dir.get_next()
		
	print("Caminhos carregados " + str(paths.size()))
