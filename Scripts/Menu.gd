extends Node

var game_scene = preload("res://Scenes/game.tscn").instantiate()

func _ready() -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().root.hide()
	get_tree().root.add_child(game_scene)
	
	pass # Replace with function body.
