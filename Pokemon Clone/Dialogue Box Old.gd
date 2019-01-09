extends NinePatchRect

var dialogue = ["Nada para ver aqui"]
const FIRSTDIALOGUE = 0
var lastDialogue

func _ready():
	pass

func startMessage():
	setDialogue()
	inicializeMessage()


func _on_Timer_timeout():
	#show characters
	$Message.visible_characters = $Message.visible_characters + 1 

func inicializeMessage():
	$Message.bbcode_enabled
	$Message.bbcode_text = dialogue[FIRSTDIALOGUE]
	$Message.visible_characters = 0
	$Message.set_process_input(true)
	
	if !visible:
		visible = true
	$Timer.start()

func setDialogue():
	var file = File.new()
	file.open("res://DialogueBox/Messages/Prototype_message_1.json", file.READ)
	var json = parse_json(file.get_as_text())
	file.close()
	dialogue = json[str("messagem")]

func skipMessage():
	pass