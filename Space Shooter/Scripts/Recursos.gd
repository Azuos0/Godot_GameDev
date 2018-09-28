extends Node

var paths = []
var ini_texs = []

const PATH_DIR = "res://Path/"
const INI_TEX_DIR = "res://images/PNG/Enemies/"


func _ready():
	carrega_paths()
	carrega_texturas_inimigo()

func random_path():
	randomize()
	return paths[randi() % paths.size()]

func random_ini_tex():
	randomize()
	return ini_texs[randi() % ini_texs.size()]

func carrega_paths():
	var dir = Directory.new()
	if dir.open(PATH_DIR) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while (file_name != ""):
			var path = load(PATH_DIR + file_name)
			if path && path is Curve2D:
					paths.append(path)
			file_name = dir.get_next()

func carrega_texturas_inimigo():
	var dir = Directory.new()
	if dir.open(INI_TEX_DIR) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while (file_name != ""):
			var tex = load(INI_TEX_DIR + file_name)
			if tex && tex is Texture:
					ini_texs.append(tex)
			file_name = dir.get_next()
