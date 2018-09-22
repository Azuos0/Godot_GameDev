#################### Inicio Classe Arma  ###################################

#carregador da cena tiro e intervalo de disparo
var pre_tiro = [preload("res://Scenes/Tiro_vermelho.tscn"), 
preload("res://Scenes/Tiro.tscn"), preload("res://Scenes/Tiro_verde.tscn")]
#var pre_tiro = preload("res://Scenes/Tiro.tscn")
var intervalo = 0.3 #tiro simples
var ultimo_disparo = 0
var tipo #0 - tiro simples, 1 - tiro rápido, 2 - tiro duplo
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
	var tiro = pre_tiro[tipo].instance() 
	tiro.global_position = node.global_position 
	nave.get_parent().add_child(tiro)
	pass

func trocar_arma(valor):
	tipo = valor
	if valor == 1:
		intervalo = 0.15
		pass
	else:
		intervalo = 0.3
		pass
	pass