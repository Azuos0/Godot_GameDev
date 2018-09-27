extends Node

const GRUPO_INIMIGO = "inimigos"
const GRUPO_NAVE = "NAVE"
const GRUPO_TIRO_INIMIGO = "tiro inimigo"

var score = 0 setget setScore
var lifes = 3 setget setLifes

signal score_changed
signal lifes_changed

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func getCamera():
	return get_tree().get_root().get_node("Main").get_node("Camera")
	pass

func setScore(valor):
	if valor > 0:
		score = valor
		emit_signal("score_changed")

func setLifes(valor):
	if valor >= 0:
		lifes = valor
		emit_signal("lifes_changed")