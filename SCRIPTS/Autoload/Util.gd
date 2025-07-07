extends Node

var Game : GAME
var maps :Maps
var Ally_Squad : Ally_Squad_ZONE


func init_click_signal(map : Maps)->void:
	map.Tile_Clicked.connect(_selected_tile_from_map)
	map.None_Clicked.connect(_selected_none_from_map)
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



func Get_Fighter_from_Dialog(tile_removed : bool=false):
	var current_data : TileData = GlobalsVar.current_selected_tile[Maps.ENUM_SELECTED_TILE.TILEDATA]
	var customTile : CustomTile = Util.data_to_resource(current_data)
	SignalBus.get_new_fighter.emit(customTile.Fighter_Resource)
	if tile_removed == true:
		_delete_current_selected_tile()
		
	pass

func init_fight():
	pass

func find_fighter_from_squad(fighterC : Fighter_Container, pool : Pool)-> Fighter:
	for fighter:Fighter in pool.get_children():
		if fighterC.Fighter_Current_Stat == fighter.Fighter_Current_Stat:
			return fighter
	return null

func Update_Squad(FR: CurrentFighterResource):
	for child : Fighter_Container  in Ally_Squad.get_children():
		if child.Fighter_Current_Stat == FR:
			child.Update_DATA()
			break





func _delete_current_selected_tile():
	maps._delete_current_selected_tile()
	pass


func End_Game():
	Game.End_Game()


func get_current_custome_tile() -> CustomTile:
	return data_to_resource(GlobalsVar.current_selected_tile[Maps.ENUM_SELECTED_TILE.TILEDATA])
