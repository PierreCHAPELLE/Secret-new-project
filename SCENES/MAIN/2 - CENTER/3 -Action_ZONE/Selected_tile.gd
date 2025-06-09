@icon("uid://c0xwxl1rdf41b")
extends VBoxContainer
class_name Selected_Tile_ZONE


var BALLON = preload("res://addons/example_balloon.tscn")

@onready var selected_tile_display: TextureRect = %Selected_tile_display
@onready var selected_tile_title: Label = %Selected_tile_title
@onready var enemy_squad_zone: Enemy_Squad_ZONE = %EnemySquad_ZONE

# Initialise les connexions de signaux, notamment pour détecter lorsqu'une tile a été mise à jour
func _ready() -> void:
	SignalBus.Tile_has_been_updated.connect(_tile_has_been_updated)
	return

## Fonction déclenchée quand une tile est mise à jour :
# - Si aucune tile n’est sélectionnée, appelle `unselect_tile`
# - Sinon, affiche la tile et génère les ennemis associés
func _tile_has_been_updated():
	var data_selected_tile = GlobalsVar.current_selected_tile
	#if data_selected_tile[Maps.ENUM_SELECTED_TILE.TILEDATA] == null:
	if data_selected_tile == []:
		unselect_tile()
		return
	else:
		select_tile(data_selected_tile)
		pass
	var tile_data : TileData = data_selected_tile[Maps.ENUM_SELECTED_TILE.TILEDATA]
	enemy_squad_zone.Generated_EnemySquad_Display(Util.data_to_resource(tile_data))
	return

 ##Cache les éléments de l’UI et nettoie la zone ennemie associée
func unselect_tile() -> void:
	selected_tile_display.hide()
	selected_tile_title.hide()
	enemy_squad_zone.cleanse()
	return

## Affiche les infos visuelles de la tile sélectionnée (coordonnées, couleur, titre, etc.)
func select_tile(array_selected_tile : Array) -> void:
	var selected_coor : Vector2i= array_selected_tile[Maps.ENUM_SELECTED_TILE.ATLAS_COOR]
	var selected_ALT_ID : int = array_selected_tile[Maps.ENUM_SELECTED_TILE.ALT_TILE_ID]
	var tile_data : TileData = array_selected_tile[Maps.ENUM_SELECTED_TILE.TILEDATA]
	var tileset_source_id : int = array_selected_tile[Maps.ENUM_SELECTED_TILE.SOURCE_ID]
	Update_visual(selected_coor, selected_ALT_ID,tile_data, tileset_source_id)
	return





## Met à jour l'affichage du TextureRect et du Label selon les données de la tile sélectionnée
# Appelle aussi le dialogue s'il existe
func Update_visual(selected_coor :Vector2i, _selected_ALT_ID:int,tile_data:TileData,tileset_source_id : int )->void:
#	mise à jour du texture rect
	var atlas_source : TileSetAtlasSource = GlobalsVar.MAIN_Tileset.get_source(tileset_source_id)
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
		_on_dialog_called(tile_custom_ressource.Dialog,"start")
		pass
	
	return



## Instancie une bulle de dialogue et lance un dialogue à partir d’une ressource donnée
func _on_dialog_called(DialogRes : DialogueResource, DialogStart : String):
	var Ballon = BALLON.instantiate() as DialogueManagerExampleBalloon
	%Ballon_Holder.add_child(Ballon)
	Ballon.start(DialogRes, DialogStart)
	return
