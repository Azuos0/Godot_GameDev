extends "res://Entities/Entities.gd"

var state = "default"

func _ready():
	speed = 70

func _physics_process(delta):
	controls_loop()
	movement_loop()
	movement_anim_loop()
	spritedir_loop()
	update_interactable_pointer()
	pass

func controls_loop():
	
	movedir = DIR_CENTER
	isMoving = true
	if !isTalking:
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
	
	if Input.is_action_just_pressed("Action"):
		interact()

func movement_anim_loop():
	if isMoving:
		anim_switch("walk")
	else:
		anim_switch("idle")

func interact():
	if $InteractablePointer.is_colliding():
		var entitie = $InteractablePointer.get_collider() 
		if entitie.has_node("Interact"):
			$"Camera2D/Dialogue Box".showMessage()

func update_interactable_pointer():
	match movedir:
		DIR_DOWN:
			$InteractablePointer.rotation_degrees = 0
			$InteractablePointer.position = Vector2(0, 16.1)
		DIR_RIGHT:
			$InteractablePointer.rotation_degrees = 270
			$InteractablePointer.position = Vector2(6.2, 11)
		DIR_LEFT:
			$InteractablePointer.rotation_degrees = 90
			$InteractablePointer.position = Vector2(-6.2, 11)
		DIR_UP:
			$InteractablePointer.rotation_degrees = 180
			$InteractablePointer.position = Vector2(0, 5.8)