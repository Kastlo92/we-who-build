extends Node
@onready var build_manager := $"../BuildManager"

func _on_house_1_button_down() -> void:
	
	build_manager.printRandomStuff()
	pass # Replace with function body.
