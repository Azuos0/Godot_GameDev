extends "res://Pickups/Pickup.gd"

func body_entered(body):
	if body.name == "player":
		body.health += 1
		queue_free()