 extends KinematicBody2D

const SPEED = 0

var movedir = Dir.CENTER
var spritedir = "down"

func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Dir.CENTER)

func spritedir_loop():
	match movedir:
		Dir.LEFT:
			spritedir = "left"
		Dir.RIGHT:
			spritedir = "right"
		Dir.UP:
			spritedir = "up"
		Dir.DOWN:
			spritedir = "down"

func anim_switch(animation):
	var new_anim = str(animation, spritedir)
	if $Anim.current_animation != new_anim:
		$Anim.play(new_anim)
