extends "res://Engine/Entity.gd"

const SPEED = 70

func _physics_process(delta):
	controls_loop()
	movement_loop()
	spritedir_loop()
	
	if is_on_wall():
		if spritedir == "left" && test_move(transform, Dir.LEFT):
			anim_switch("push")
		if spritedir == "right" && test_move(transform, Dir.RIGHT):
			anim_switch("push")
		if spritedir == "up" && test_move(transform, Dir.UP):
			anim_switch("push")
		if spritedir == "down" && test_move(transform, Dir.DOWN):
			anim_switch("push")
	elif movedir != Dir.CENTER:
		anim_switch("walk")
	else:
		anim_switch("idle")

func controls_loop():
	var LEFT	 = Input.is_action_pressed("ui_left")
	var RIGHT	 = Input.is_action_pressed("ui_right")
	var UP		 = Input.is_action_pressed("ui_up")
	var DOWN	 = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
