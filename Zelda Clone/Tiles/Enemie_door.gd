extends StaticBody2D

onready var camera = get_node("../Camera")
onready var player = get_node("../player")

func _ready():
	$Anim.play("open")

func _process(delta):
	if camera.grid_pos == camera.get_grid_pos(global_position):
		if camera.get_enemies() ==0:
			if $Anim.assigned_animation != "open":
				$Anim.play("open")
		elif !$Area.get_overlapping_bodies().has(player):
			if $Anim.assigned_animation != "close":
				$Anim.play("close")
	else:
		if $Anim.assigned_animation != "open":
			$Anim.play("open")