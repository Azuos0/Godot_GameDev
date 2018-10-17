extends TileMap

func _ready():
	var size = get_cell_size()
	var offset = size/2
	for tile in get_used_cells():
		var name = get_tileset().tile_get_name(get_cell(tile.x, tile.y))
		var node = load(str("res://Enemies/", name,".tscn")).instance()
		node.global_position = tile * size + offset #add the enemie to the cell (this line multiply the tile per the enemie size)
		#It must be done this way (the function call bellow) because the _ready function can call the function addchild during the load of a parent node/scene maybe it's because it may not be already totally instanced
		get_parent().call_deferred("add_child", node) 
	queue_free()