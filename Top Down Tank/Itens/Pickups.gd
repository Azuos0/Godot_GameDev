extends Area2D

enum Items {health, ammo}

export (Items) var type = Items.health
export (Vector2) var amount = Vector2(10,25)

var icon_textures = [preload("res://Assets/wrench_white.png"),
					 preload("res://Assets/ammo_machinegun.png")]

func _ready():
	$Icon.texture = icon_textures[type]

func _on_Pickups_body_entered(body):
	match type:
		Items.health:
			if body.has_method('heal'):
				body.heal(int(rand_range(amount.x, amount.y)))
		Items.ammo:
			body.ammo += int(rand_range(amount.x, amount.y))
	queue_free()
