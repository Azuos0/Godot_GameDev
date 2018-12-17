extends NinePatchRect

var dialog = ["Nada para ver aqui"]
var page = 0

func _ready():
	$Message.bbcode_enabled
	$Message.bbcode_text = dialog[page]
	$Message.visible_characters = 0
	$Message.set_process_input(true)

func showMessage():
	if !visible:
		visible = true
	
	$Timer.start()


func _on_Timer_timeout():
	$Message.visible_characters = $Message.visible_characters + 1 
