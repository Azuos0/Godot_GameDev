extends Path2D

onready var follow = $Follow
var vel = 300

func _ready():
	curve = Recursos.random_path()
	set_process(true)
	$Follow/Inimigo_01.connect("destruiu", self, "on_destruiu")
	$Follow/Inimigo_01.connect("destruir", self, "on_destruir")

func _process(delta):
	follow.offset += vel * delta
	
	if follow.unit_offset >= 1:
		queue_free()

func on_destruir():
	set_process(false)

func on_destruiu():
	queue_free()