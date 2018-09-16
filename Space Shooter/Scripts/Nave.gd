extends Node2D

#velocidade, tamanho da janela e tamanho do sprite
var vel = 300
var viewPort = OS.get_window_size()
var textura

func _ready():
	set_process(true)
	textura = get_node("Sprite").texture.get_size()
	pass

func _process(delta):
	print(viewPort.x)
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
	position += Vector2(vel,0) * delta * (d + e)
	
	#Disparo do laser
	 
	
	pass
