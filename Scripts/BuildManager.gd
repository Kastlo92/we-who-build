extends Node

@export var build_preview: Sprite2D
@export var buildings: Array[BuildingData]
var selectedBuilding = BuildingData;

func set_building(building_data: BuildingData):
	selectedBuilding = building_data
	build_preview.texture = building_data.preview_texture
	build_preview.visible = true
	
