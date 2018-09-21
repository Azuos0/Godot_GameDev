extends Area2D

#velocidade, tamanho da janela e tamanho do sprite
var vel = 300
var viewPort = OS.get_window_size()
var textura
var new_power_up = false

var arma

func _ready():
	set_process(true)
	textura = get_node("Sprite").texture.get_size()
	arma = Arma.new(self)
	add_to_group(Game.GRUPO_NAVE)
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
		arma.disparar()
		pass
	
	arma.atualiza(delta)
	
	pass

func trocar_arma(valor):
	arma.tipo = valor
	
	if valor == 1:
		arma.intervalo = 0.2
		pass
	else:
		arma.intervalo = 0.3
		pass
	pass 

#################### Inicio Classe Arma  ###################################
class Arma:
	
	#carregador da cena tiro e intervalo de disparo
	var pre_tiro = preload("res://Scenes/Tiro.tscn")
	var intervalo = 0.3 #tiro simples
	var ultimo_disparo = 0
	var tipo
	var nave
	
	func _init(nave):
		self.nave = nave
		intervalo = 0.3
		tipo = 0
		pass
	
	
	#Disparo do laser
	func disparar():
		if ultimo_disparo <= 0:
			match tipo:
				0: #cria tiro simples
					cria_tiro(nave.get_node("PosCanhaoC"))
					ultimo_disparo = intervalo
					pass
				1: #cria tiro rápido
					cria_tiro(nave.get_node("PosCanhaoC"))
					ultimo_disparo = intervalo
					pass
				2: #cria tiro duplo
					cria_tiro(nave.get_node("PosCanhaoE"))
					cria_tiro(nave.get_node("PosCanhaoD"))
					ultimo_disparo = intervalo
					pass
			pass
		pass
	
	func atualiza(delta):
		#intervalo
		if ultimo_disparo > 0:
			ultimo_disparo -= delta
			pass
		pass
	
	func cria_tiro(node):
		var tiro = pre_tiro.instance()
		tiro.global_position = node.global_position 
		nave.get_parent().add_child(tiro)
		pass
	
#fim da class Tiro
################## Fim da Classe Arma  #####################################
