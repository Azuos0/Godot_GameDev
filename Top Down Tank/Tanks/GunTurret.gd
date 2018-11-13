extends "res://Tanks/Tank.gd"

onready var parent = get_parent()
export (float) var turret_speed
export (int) var detect_radius

var speed = 0.0
var target = null

func _ready():
	var circle = CircleShape2D.new()
	$DetectRadius/CollisionShape2D.shape = circle
	$DetectRadius/CollisionShape2D.shape.radius = detect_radius

func _process(delta):
	if target:
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated($Turret.global_rotation)
		$Turret.global_rotation = current_dir.linear_interpolate(target_dir, turret_speed * delta).angle()
		if target_dir.dot(current_dir) > 0.9:
			shoot(gun_shots, gun_spread)

func _on_DetectRadius_body_entered(body):
		target = body 
		print(body)

func _on_DetectRadius_body_exited(body):
	if body == target:
		target = null


