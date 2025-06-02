@icon("uid://ey08shru7w0n")
extends Node2D
class_name Maps

@export var Testing : bool

enum ENUM_SELECTED_TILE {ATLAS_COOR,ALT_TILE_ID,TILEDATA,SOURCE_ID}
enum ENUM_CUSTOM_TILE_DATA {RESOURCE}

signal Tile_Clicked(Atlas_Coor : Array)
signal None_Clicked()


@onready var background: TileMapLayer = $BACKGROUND
@onready var background_offset: TileMapLayer = $"BACKGROUND OFFSET"
@onready var non_data_stuff: TileMapLayer = $"Non_Data stuff"
@onready var stuff: TileMapLayer = $Stuff

@onready var selector: Selector = $Selector



func _ready() -> void:
	Util.init_click_signal(self)
	GlobalsVar.MAIN_Tileset = stuff.tile_set
	return

func return_tile(mous_pos : Vector2, concerned_layer: TileMapLayer)->void:
	 # 1) On calcule la position de la cellule dans le TileMapLayer
	var tile_pos = concerned_layer.local_to_map(mous_pos)
	
# 2) On récupère l’ID global de la tile (ceci encode déjà le source_id en interne)
	var source_id  = concerned_layer.get_cell_source_id(tile_pos)
	if source_id < 0 :
		# Pas de tile sous le curseur
		None_Clicked.emit()
		return
# 2) On récupère atlas_coords et l’alternative (facultatif)
	var atlas_co = concerned_layer.get_cell_atlas_coords(tile_pos)
	var alt_id  = concerned_layer.get_cell_alternative_tile(tile_pos)
	
	
	var Array_clicked_tile : Array = []
	Array_clicked_tile.append(atlas_co)
	Array_clicked_tile.append(alt_id)
	var tile_data = concerned_layer.tile_set.get_source(source_id).get_tile_data(Array_clicked_tile[0],Array_clicked_tile[1])
	Array_clicked_tile.append(tile_data)
	Array_clicked_tile.append(source_id)
	
	
	if tile_data:
		Tile_Clicked.emit(Array_clicked_tile)
		selector.get_in_position(tile_pos,concerned_layer)
		return
	else:
		None_Clicked.emit()
		return
	return


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Click") and GlobalsVar.dialog_is_running == false:
		return_tile(get_global_mouse_position(), stuff)
	pass
