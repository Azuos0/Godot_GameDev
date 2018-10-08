 extends KinematicBody2D

const SPEED = 0
const TYPE = "ENEMY"

var movedir = Dir.CENTER
var spritedir = "down"
var hit_stun = 0
var knockdir = Dir.CENTER
var health = 1

func movement_loop():
	var motion 
	if hit_stun == 0:
		motion = movedir.normalized() * SPEED
	else:
		motion = knockdir.normalized() * SPEED * 1.5
	move_and_slide(motion, Vector2(0,0))

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

func damage_loop():
	if hit_stun > 0:
		hit_stun -= 1
	for area in $Hitbox.get_overlapping_areas():
		var body = area.get_parent()
		if hit_stun == 0 && body.get("DAMAGE") != null && body.get("TYPE") != TYPE:
			health -= body.get("DAMAGE")
			hit_stun = 10
			knockdir = global_transform.origin - body.global_transform.origin

func use_item(item):
	var newItem = item.instance()
	newItem.add_to_group(str(newItem.get_name(), self))
	add_child(newItem)
	if get_tree().get_nodes_in_group(str(newItem.get_name(), self)).size() > newItem.max_amount:
		newItem.queue_free()
		