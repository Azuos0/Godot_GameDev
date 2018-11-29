extends KinematicBody2D

var speed = 0
var movedir = Vector2()
var spritedir = "down"
var isMoving = false

#Directions constants
const DIR_CENTER = Vector2(0,0)
const DIR_LEFT = Vector2(-1,0)
const DIR_RIGHT = Vector2(1,0)
const DIR_UP = Vector2(0,-1)
const DIR_DOWN = Vector2(0,1)

func _ready():
	pass

func movement_loop():
	var motion = movedir.normalized() * speed
	move_and_slide(motion, Vector2(0,0))

func spritedir_loop():
	match movedir:
		DIR_LEFT:
			spritedir = "left"
		DIR_RIGHT:
			spritedir = "right"
		DIR_DOWN:
			spritedir = "down"
		DIR_UP:
			spritedir = "up"

func anim_switch(animation):
	var new_anim = str(animation, spritedir)
	if new_anim != $Anim.current_animation:
		$Anim.play(new_anim)
	