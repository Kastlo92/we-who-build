extends TileMapLayer

@onready var tileMapLayer: TileMapLayer = self
@onready var buildManager: Node = $"../BuildManager"

@export var Deselect_building: BuildingData
#Grid
const COLUMNS = 100;
const ROWS = 100;
#tiles_id (da cambiare usando le risorse?)
const COMPUTED_TILES_SOURCE_ID := 1
const BUILDINGS_SOURCE_ID := 1

var dragging = false;
var click_radius = 32 # Size of the sprite.


func _ready() -> void:	
	fill_with_grass()
	pass  

func _input(event):
	if Input.is_action_just_pressed("rightClick"):
		buildManager.selectedBuilding = Deselect_building
		return
	
	#Posizionamento singola Tile
	if Input.is_action_just_pressed("leftClick"):
		if(buildManager.selectedBuilding == Deselect_building):
			return
		
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
	if((tileMapLayer.get_cell_source_id(position)) != COMPUTED_TILES_SOURCE_ID):
		#print("GRASS!")
		return
	tileMapLayer.set_cell(position, BUILDINGS_SOURCE_ID, Vector2i(0,0))	
	pass
	
func fill_with_grass() -> void: 
	for y in range(-COLUMNS, COLUMNS):
		for x in range(-ROWS, ROWS):
			self.set_cell(Vector2i(x,y), COMPUTED_TILES_SOURCE_ID, Vector2i(0, 0))
	pass
