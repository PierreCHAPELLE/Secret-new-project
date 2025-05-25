extends Node

signal Tile_has_been_updated()


func init_click_signal(maps : Maps)->void:
	maps.Tile_Clicked.connect(_selected_tile_from_map)
	maps.None_Clicked.connect(_selected_none_from_map)
	return

func _selected_none_from_map()->void:
	GlobalsVar.current_selected_tile = []
	Tile_has_been_updated.emit()
	return


func _selected_tile_from_map(Array_Data_Tile: Array)->void:
	GlobalsVar.current_selected_tile = Array_Data_Tile
	Tile_has_been_updated.emit()
	return


func data_to_resource(data : TileData)-> CustomTile:
	return data.get_custom_data(Maps.ENUM_CUSTOM_TILE_DATA.keys()[Maps.ENUM_CUSTOM_TILE_DATA.RESOURCE])
