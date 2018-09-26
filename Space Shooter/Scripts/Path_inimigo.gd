extends Path2D

onready var follow = $Follow
var vel = 300

func _ready():
	curve = Recursos.random_path()
	set_process(true)

func _process(delta):
	follow.offset += vel * delta
	
	if follow.unit_offset >= 1:
		queue_free()
