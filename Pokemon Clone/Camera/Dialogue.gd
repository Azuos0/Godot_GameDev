extends Control

var dialogue = ["Eu não sei qual o problema desse texto que não me deixa animá-lo ou ampliá-lo horizontalmente"]
var rotulo = "Old Man odeia quando texto não fica no lugar certo"
const FIRSTDIALOGUE = 0
var test = []
const SPACE = " "


func _ready():
	inicializeMessage()
	pass

func startMessage():
	#setDialogue()
	inicializeMessage()
	#testando()

func testando():
	var temp = ""
	for ch in dialogue[0]:
		if ch != SPACE:
			temp = str(temp, ch)
		else:
			test.append(temp)
			temp = ""
	
	#novo update
	#cria um label temporário e conta a quantidade max de caracters que cabe em uma linha
	#cria um valor min e max de caracters por linha e força as quebras (não permitindo o wrap automatico do rich text)
	#cria o label com tamanho vertical de no máximo uma linha e força o nine

func _on_Timer_timeout():
	#show characters
	if $Box/VBoxContainer/Message.visible_characters <= $Box/VBoxContainer/Message.get_total_character_count():
		$Box/VBoxContainer/Message.visible_characters = $Box/VBoxContainer/Message.visible_characters + 1 
	else:
		print($Box/VBoxContainer/Message.rect_size)

func inicializeMessage():
	#$Box/Message.bbcode_enabled
	#$Box/Message.bbcode_text = dialogue[FIRSTDIALOGUE]
	$Box/VBoxContainer/Message.text = dialogue[FIRSTDIALOGUE]
	$Box/VBoxContainer/Message.visible_characters = 0
	$Box/VBoxContainer/Message.set_process_input(true)
	
	"""if !visible:
		visible = true
	$Timer.start()"""

func setDialogue():
	var file = File.new()
	file.open("res://DialogueBox/Messages/Prototype_message_1.json", file.READ)
	var json = parse_json(file.get_as_text())
	file.close()
	dialogue = json[str("messagem")]