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
	if event is InputEventMouseButton:
		var localMousePos = tileMapLayer.get_local_mouse_position()			
		var cell_coords = tileMapLayer.local_to_map(localMousePos)
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			insertTile(cell_coords)
			dragging = true
		
		#TRASCINAMENTO
	if event is InputEventMouseMotion and dragging:
		var localMousePos = tileMapLayer.get_local_mouse_position()			
		var cell_coords = tileMapLayer.local_to_map(localMousePos)
		print("dragging")
		insertTile(cell_coords)

	if not event.is_pressed():
		dragging = false
		
func insertTile(position: Vector2i) -> void:
	#Attualmente il source ID è impostato su -1 perché stiamo scrivendo su tile "vuote".
	#Se metto un terreno base sarà il caso di cambiare questa parte di codice 
	if(tileMapLayer.get_cell_source_id(position) != -1):
		print("position dragged")
		pass
	tileMapLayer.set_cell(position, 1, Vector2i(0,0))	
	
	pass
