@icon("uid://c0xwxl1rdf41b")
extends VBoxContainer
class_name Selected_Tile_UI



@onready var selected_tile_display: TextureRect = %Selected_tile_display
@onready var selected_tile_title: Label = %Selected_tile_title


func unselect_tile() -> void:
	selected_tile_display.hide()
	selected_tile_title.hide()
	
	return

func select_tile(array_selected_tile : Array) -> void:
	var selected_coor : Vector2i= array_selected_tile[Maps.ENUM_SELECTED_TILE.ATLAS_COOR]
	var selected_ALT_ID : int = array_selected_tile[Maps.ENUM_SELECTED_TILE.ALT_TILE_ID]
	var tile_data : TileData = array_selected_tile[Maps.ENUM_SELECTED_TILE.TILEDATA]
	Update_visual(selected_coor, selected_ALT_ID,tile_data)
	
	return





func Update_visual(selected_coor :Vector2i, selected_ALT_ID:int,tile_data:TileData)->void:
#	mise à jour du texture rect
	var atlas_source : TileSetAtlasSource = GlobalsVar.MAIN_Tileset.get_source(1)
	var texture_to_display := AtlasTexture.new()
	texture_to_display.atlas = atlas_source.texture
	texture_to_display.region = atlas_source.get_tile_texture_region(selected_coor)
	selected_tile_display.texture = texture_to_display
	selected_tile_display.modulate = tile_data.modulate
	
#	mise à jour du label
	var tile_custom_ressource: CustomTile = Util.data_to_resource(tile_data)
	var label_to_display : String
	label_to_display = tile_custom_ressource.Title if tile_custom_ressource else ""
	selected_tile_title.text = label_to_display
	
	selected_tile_display.show()
	selected_tile_title.show()
	
	if tile_custom_ressource == null:
		return
	if tile_custom_ressource.Dialog:
		print(tile_custom_ressource.Dialog)
		_on_dialog_called(%Dialogue,tile_custom_ressource.Dialog,"start")
	return
func _on_dialog_called(DialogManager, DialogRes : DialogueResource, DialogStart : String):
	%MarginContainer.add_child(DialogManager)
	DialogManager.start(DialogRes, DialogStart)
