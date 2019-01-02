tool
extends StaticBody2D

var pokemon_sheet = preload("res://Assets/tileset-wesley.png")
var adventure_sheet = preload("res://Assets/Overworld.png")

enum Itens {logg, miniStone, largeStone_hearthShape, largeStone_broken, 
            doubleStone, twoStones, baseTree, plantPot, whiteFlowerPot,
            blueFlowerPot, bigPlantPot, pineappleBox, greenThingBox,
            appleBox, potatoBox, woodenBarrel, woodenCrate_Vertical,
            woodenCrate_Horizontal, bottomLight_pole, xtudo}

var adventureRegions = {
    Itens.logg: Rect2(50, 81, 44, 14),
    Itens.miniStone:Rect2(96, 80, 15, 15),
    Itens.largeStone_hearthShape: Rect2(111, 80, 18, 15),
    Itens.largeStone_broken: Rect2(128, 81, 16, 15),
    Itens.doubleStone: Rect2(144, 81, 16, 15),
    Itens.twoStones: Rect2(160, 81, 15, 15),
    Itens.baseTree: Rect2(497, 53, 31, 26),
    Itens.plantPot: Rect2(560, 14, 16, 16),
    Itens.whiteFlowerPot: Rect2(560, -1, 15, 15),
    Itens.blueFlowerPot: Rect2(528, 31, 15, 15),
    Itens.bigPlantPot: Rect2(512, 17, 15, 30),
    Itens.pineappleBox: Rect2(417, 318, 15, 25),
    Itens.greenThingBox: Rect2(433, 320, 15, 23),
    Itens.appleBox: Rect2(449, 320, 15, 23),
    Itens.potatoBox: Rect2(465, 320, 15, 23),
    Itens.woodenBarrel: Rect2(528, 5, 16, 23),
    Itens.woodenCrate_Vertical: Rect2(480, 3, 16, 28),
    Itens.woodenCrate_Horizontal: Rect2(564, 129, 26, 31)
}

var pokemonRegions = {
	Itens.bottomLight_pole: Rect2(64, 80, 16, 16)
	}

export (Itens) var type setget _update
export (bool) var interactable = false setget ,isInteractable

func _update(_type):
	type = _type
	
	wait_game_to_Load()
	selectSpriteSheet(type)
	setCollisionShape()

func isInteractable():
	return interactable

func selectSpriteSheet(_type):
	if adventureRegions.has(_type):
		$Sprite.texture = adventure_sheet
		$Sprite.region_rect = adventureRegions[_type]
	else:
		$Sprite.texture = pokemon_sheet
		$Sprite.region_rect =  pokemonRegions[_type]

func wait_game_to_Load():
	if !Engine.editor_hint:
		yield(self, 'tree_entered')

func setCollisionShape():
	var rect = RectangleShape2D.new()
	rect.extents = $Sprite.region_rect.size/2
	$CollisionShape2D.shape = rect