extends Node2D

func _ready() -> void:	
	#TODO: capire come rilevare posizioni di case adiacenti
	get_adiacent_houses(position)
	pass 

func _process(delta: float):		
	
	pass

func get_adiacent_houses(pos: Vector2):
	#print(pos.x + 16)
	#print(pos.y + 16)
	#print(pos.x - 16)
	#print(pos.y - 16, " ///////// //////// ")
	pass
