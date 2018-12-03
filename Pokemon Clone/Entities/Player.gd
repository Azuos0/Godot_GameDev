extends "res://Entities/Entities.gd"

var state = "default"

func _ready():
	speed = 70

func _physics_process(delta):
	controls_loop()
	movement_loop()
	movement_anim_loop()
	spritedir_loop()
	pass

func controls_loop():
	
	movedir = DIR_CENTER
	isMoving = true
	
	if Input.is_action_pressed("ui_left"):
		movedir = DIR_LEFT
	elif Input.is_action_pressed("ui_right"):
		movedir = DIR_RIGHT
	elif Input.is_action_pressed("ui_up"):
		movedir = DIR_UP
	elif Input.is_action_pressed("ui_down"):
		movedir = DIR_DOWN
	else:
		isMoving = false

func movement_anim_loop():
	if isMoving:
		anim_switch("walk")
	else:
		anim_switch("idle")
