extends Node
@onready var build_manager := $"../BuildManager"

var HOUSE = preload("res://Scripts/Models/House.tres")

func _on_house_1_button_down() -> void:
	build_manager.set_building(HOUSE)
	pass # Replace with function body.
