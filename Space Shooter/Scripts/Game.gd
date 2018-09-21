extends Node

const GRUPO_INIMIGO = "inimigos"
const GRUPO_NAVE = "NAVE"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func getCamera():
	return get_tree().get_root().get_node("Main").get_node("Camera")
	pass