extends Node2D

#velocidade, tamanho da janela e tamanho do sprite
var vel = 300
var viewPort = OS.get_window_size()
var textura

#carregador da cena tiro e intervalo de disparo
var pre_tiro = preload("res://Scenes/Tiro.tscn")
var intervalo = 0.3
var ultimo_disparo = 0

func _ready():
	set_process(true)
	textura = get_node("Sprite").texture.get_size()
	pass

func _process(delta):
	#movimentação da nave para esquerda e direita
	var d = 0
	var e = 0
	
	if Input.is_action_pressed("Direita"):
		d = 1
		pass
	
	if Input.is_action_pressed("Esquerda"):
		e = -1
		pass
	
	#Limita a movimentação da nave ao tamanho da tela
	if position.x > viewPort.x - textura.x/2:
		d = 0
	
	if position.x < textura.x/2:
		e = 0
	
	#atualização da posição da nave
	position += Vector2(1,0) * vel * delta * (d + e)
	
	#Disparo do laser
	if Input.is_action_pressed("Tiro"):
		if ultimo_disparo <= 0:
			disparar(get_node("CanhaoE"))
			disparar(get_node("CanhaoD"))
			ultimo_disparo = intervalo
			pass
		pass
	
	
	#intervalo
	if ultimo_disparo > 0:
		ultimo_disparo -= delta
		pass
	
	
	pass

func disparar(node):
	var tiro = pre_tiro.instance()
	tiro.global_position = node.global_position + Vector2(0, -30)
	get_parent().add_child(tiro)
	pass