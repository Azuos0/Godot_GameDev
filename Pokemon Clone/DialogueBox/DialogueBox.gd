extends NinePatchRect

var dialogue = "Aqui tem 21 character"
var dono = "Old Man"
var ballonDialogue = []

const MAX_CHARACTER_PER_LINE = 20.0
const CHARACTER_OUT_LIMIT_PER_LINE = 5

func _ready():
	inicializeMessage()
	stringToDialogue()

func inicializeMessage():
	$VBoxContainer/Message.bbcode_enabled
	$VBoxContainer/Message.bbcode_text = dialogue
	$VBoxContainer/Name.text = dono
	$VBoxContainer/Message.visible_characters = 0
	$VBoxContainer/Message.set_process_input(true)

func stringToDialogue():
	var dialogueLines = []
	if dialogue.length() > MAX_CHARACTER_PER_LINE:
		create_new_lines()
	pass

func _on_Timer_timeout():
	$VBoxContainer/Message.visible_characters = $VBoxContainer/Message.visible_characters + 1

func create_new_lines():
	var numberOfLines = ceil(dialogue.length()/MAX_CHARACTER_PER_LINE)
	var lastLineCharacter = ""
	var new_line_break_position = MAX_CHARACTER_PER_LINE - 1 # the string array starts at 0
	var last_line_break_position = 0
	
	for n in numberOfLines:
		new_line_break_position = new_line_break_position * (n + 1)
		lastLineCharacter = dialogue[new_line_break_position] 
		#it tests if the character in the line break position is a space
		if lastLineCharacter == " ": 
			ballonDialogue.append(dialogue.substr(last_line_break_position, new_line_break_position))
		else:
			pass 