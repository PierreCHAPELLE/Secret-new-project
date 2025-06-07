extends Node

var maps :Maps


func init_click_signal(maps : Maps)->void:
	maps.Tile_Clicked.connect(_selected_tile_from_map)
	maps.None_Clicked.connect(_selected_none_from_map)
	return

func _selected_none_from_map()->void:
	GlobalsVar.current_selected_tile = []
	SignalBus.Tile_has_been_updated.emit()
	return

func _selected_none_from_dialog()->void:
	GlobalsVar.current_selected_tile = []
	SignalBus.Tile_has_been_updated.emit()
	return

func _selected_tile_from_map(Array_Data_Tile: Array)->void:
	GlobalsVar.current_selected_tile = Array_Data_Tile
	SignalBus.Tile_has_been_updated.emit()
	return


func data_to_resource(data : TileData)-> CustomTile:
	return data.get_custom_data(Maps.ENUM_CUSTOM_TILE_DATA.keys()[Maps.ENUM_CUSTOM_TILE_DATA.RESOURCE])



func Get_Fighter_from_Dialog(tile_removed : bool):
	var current_data : TileData = GlobalsVar.current_selected_tile[Maps.ENUM_SELECTED_TILE.TILEDATA]
	var customTile : CustomTile = Util.data_to_resource(current_data)
	SignalBus.get_new_fighter.emit(customTile.Fighter_Resource)
	if tile_removed == true:
		maps._delete_current_selected_tile()
	pass

func init_fight():
	pass
