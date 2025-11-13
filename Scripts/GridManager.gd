extends Node

#@onready var tm: TileMap = $TileMapLayer
@onready var tileMapLayer: TileMapLayer = $TileMapLayer

const COLUMNS = 100;
const ROWS = 100;
const NATURE_SOURCE_ID := 2
const BUILDINGS_SOURCE_ID := 1

const GRASS_SOURCE_ID := 1
var dragging = false;
var click_radius = 32 # Size of the sprite.


func _ready() -> void:	
	fill_with_grass(tileMapLayer)
	pass  

func _process(delta: float) -> void:		
	pass

func _input(event):
	#Posizionamento singola Tile
	if Input.is_action_just_pressed("leftClick"):
		var localMousePos = tileMapLayer.get_local_mouse_position()			
		var cell_coords = tileMapLayer.local_to_map(localMousePos)
		if event is not InputEventMouseMotion and event.pressed:
			insertTile(cell_coords)
			dragging = true
		#
		##TRASCINAMENTO
	if Input.is_action_just_released("leftClick"):
		dragging = false
		
	if  dragging:
		var localMousePos = tileMapLayer.get_local_mouse_position()			
		var cell_coords = tileMapLayer.local_to_map(localMousePos)
		insertTile(cell_coords)
		
func insertTile(position: Vector2i) -> void:
	#Attualmente il source ID è impostato su -1 perché stiamo scrivendo su tile "vuote".
	#Se metto un terreno base sarà il caso di cambiare questa parte di codice 
	if((tileMapLayer.get_cell_source_id(position)) != NATURE_SOURCE_ID):
		print("GRASS!")
		return
		pass
	tileMapLayer.set_cell(position, BUILDINGS_SOURCE_ID, Vector2i(0,0))	
	pass
	
func fill_with_grass(tm: TileMapLayer) -> void: 
	for y in range(-COLUMNS, COLUMNS):
		for x in range(-ROWS, ROWS):
			tm.set_cell(Vector2i(x,y), NATURE_SOURCE_ID, Vector2i(0, 0))
	pass
