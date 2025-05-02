extends Node

const COLUMNS = 16;
const ROWS = 16;
var tileMapLayer;

func _ready() -> void:	
	tileMapLayer = get_node("TileMapLayer")
	
	pass 

func _process(delta: float) -> void:		
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var fuff = tileMapLayer.get_local_mouse_position()			
			var cell_coords = tileMapLayer.local_to_map(fuff)
			insertTile(cell_coords)
		
func insertTile(position: Vector2i) -> void:
	var tileData = tileMapLayer.get_cell_tile_data(position)
	print(tileData)
	tileMapLayer.set_cell(position, 1, Vector2i(1,1))	

	pass
