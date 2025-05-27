@icon("uid://dk38fbc2gdmk6")
extends PanelContainer
class_name Action_ZONE

@export var Selected_Tile_Ui : Selected_Tile_UI

func _ready() -> void:
	Util.Tile_has_been_updated.connect(_tile_has_been_updated)
	
	return

func _tile_has_been_updated():
	var data_selected_tile = GlobalsVar.current_selected_tile
	#if data_selected_tile[Maps.ENUM_SELECTED_TILE.TILEDATA] == null:
	if data_selected_tile == []:
		Selected_Tile_Ui.unselect_tile()
		return
	else:
		Selected_Tile_Ui.select_tile(data_selected_tile)
		return


#func _ready():
	#$HBoxContainer/Center/Reponse/ExampleBalloon.start(preload("res://dialogue.dialogue"),"start")
