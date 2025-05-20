extends Node

const COLUMNS = 16;
const ROWS = 16;
var tileMapLayer;
var dragging = false;
var click_radius = 32 # Size of the sprite.


func _ready() -> void:	
	tileMapLayer = get_node("TileMapLayer")
	
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
	if(tileMapLayer.get_cell_source_id(position) != -1):
		pass
	tileMapLayer.set_cell(position, 1, Vector2i(0,0))	
	
	pass
