extends Node
@onready var build_manager := $"../BuildManager"
@export var HOUSE: BuildingData  

func _on_house_1_button_down() -> void:
	build_manager.set_building(HOUSE)
	pass # Replace with function body.
