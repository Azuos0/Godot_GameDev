extends Area2D

#velocidade, tamanho da janela e tamanho do sprite
var vel = 300
var viewPort = OS.get_window_size()
var textura

var arma
var pre_arma = preload("res://Scripts/Classes/Arma.gd")

func _ready():
	set_process(true)
	textura = get_node("Sprite").texture.get_size()
	arma = pre_arma.new(self)
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
	arma.trocar_arma(valor)
	pass 

func retira_vida(dano):
	Game.lifes -= dano

func _on_Nave_area_entered(area):
	if area.is_in_group(Game.GRUPO_INIMIGO):
		if area.has_method("aplica_dano"):
			area.aplica_dano(200)
			retira_vida(1)
	elif area.is_in_group(Game.GRUPO_TIRO_INIMIGO):
		if area.has_method("destroi"):
			area.destroi()
			retira_vida(1)