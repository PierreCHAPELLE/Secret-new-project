@icon("uid://ey08shru7w0n")
extends Node2D
class_name Maps

@export var Testing : bool

enum ENUM_SELECTED_TILE {ATLAS_COOR,ALT_TILE_ID,TILEDATA}
enum ENUM_CUSTOM_TILE_DATA {RESOURCE}

signal Tile_Clicked(Atlas_Coor : Dictionary)
signal None_Clicked()


@onready var background: TileMapLayer = $BACKGROUND
@onready var background_offset: TileMapLayer = $"BACKGROUND OFFSET"
@onready var non_data_stuff: TileMapLayer = $"Non_Data stuff"
@onready var stuff: TileMapLayer = $Stuff

@onready var selector: Selector = $Selector



func _ready() -> void:
	Util.init_click_signal(self)

var data 

func return_tile(mous_pos : Vector2, concerned_layer: TileMapLayer)->void:
	var tile_pos = concerned_layer.local_to_map(mous_pos)
	var Array_clicked_tile : Array = []
	Array_clicked_tile.append(concerned_layer.get_cell_atlas_coords(tile_pos))
	Array_clicked_tile.append(concerned_layer.get_cell_alternative_tile(tile_pos))
	var tile_data = concerned_layer.tile_set.get_source(1).get_tile_data(Array_clicked_tile[0],Array_clicked_tile[1])
	Array_clicked_tile.append(tile_data)
	
	if tile_data:
		Tile_Clicked.emit(Array_clicked_tile)
		selector.get_in_position(tile_pos,concerned_layer)
		return
	else:
		None_Clicked.emit()
		return
	return
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Click"):
		return_tile(get_global_mouse_position(), stuff)
	pass
