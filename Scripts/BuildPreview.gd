extends Sprite2D

@export var grid: TileMapLayer
@export var build_manager: Node

var current_cell: Vector2i

func _ready():
	visible = false
	modulate.a = 0.5  # transparency
	
func _process(_delta: float) -> void:
	if !visible:
		return	
		
	var mouse_pos = grid.get_global_mouse_position()
	var cell = grid.local_to_map(grid.to_local(mouse_pos))
	
	if cell == current_cell :
		return
		
	current_cell = cell
	var world_pos = grid.map_to_local(cell)
	global_position = grid.to_global(world_pos)
	
	# show when you cant build something
	# if grid.can_build_at(cell):
	#     modulate = Color(1, 1, 1, 0.5)
	# else:
	#     modulate = Color(1, 0.5, 0.5, 0.5)
