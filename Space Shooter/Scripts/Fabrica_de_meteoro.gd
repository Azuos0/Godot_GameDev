extends Node

func gera_meteoro(valor):
	return get_children()[valor].duplicate()

func gera_meteoro_randomico():
	return get_children()[randi() % get_children().size()].duplicate()