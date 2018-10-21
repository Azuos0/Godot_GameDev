extends CanvasLayer


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	$Keys.frame = get_node("../player").keys