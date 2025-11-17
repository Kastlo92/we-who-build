extends Node
@onready var build_manager := $"../BuildManager"

const HOUSE = 1

func _on_house_1_button_down() -> void:
	build_manager.setPlaceableBuilding(HOUSE)
	pass # Replace with function body.
