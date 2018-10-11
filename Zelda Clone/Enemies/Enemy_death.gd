extends Node2D

func _ready():
	$Anim.play("default")
	$Anim.connect("animation_finished", self, "destroy")


func destroy():
	queue_free()

