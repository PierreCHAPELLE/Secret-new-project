extends Control

@onready var atlas_coor: Label = %atlasCoor
@onready var alt_tile_id: Label = %AltTileId
@onready var tile_data: Label = %TileData
@onready var source_id: Label = %SourceID
@onready var coor: Label = %COOR

func _ready() -> void:
	SignalBus.Tile_has_been_updated.connect(update_data)

func update_data() -> void:
	if GlobalsVar.current_selected_tile == []:
		return
	atlas_coor.text = str(GlobalsVar.current_selected_tile[Maps.ENUM_SELECTED_TILE.ATLAS_COOR])
	alt_tile_id.text = str(GlobalsVar.current_selected_tile[Maps.ENUM_SELECTED_TILE.ALT_TILE_ID])
	tile_data.text = str(GlobalsVar.current_selected_tile[Maps.ENUM_SELECTED_TILE.TILEDATA])
	source_id.text = str(GlobalsVar.current_selected_tile[Maps.ENUM_SELECTED_TILE.SOURCE_ID])
	coor.text = str(GlobalsVar.current_selected_tile[Maps.ENUM_SELECTED_TILE.COOR])
	
	var custom_Tile: CustomTile = Util.data_to_resource(GlobalsVar.current_selected_tile[Maps.ENUM_SELECTED_TILE.TILEDATA])
	for child in %"fighter resources".get_children():
		child.queue_free()
	if custom_Tile == null:
		return
	
	if custom_Tile.Fighter_Resource != [] or custom_Tile.Fighter_Resource != null:
		for fighter : FighterResource in custom_Tile.Fighter_Resource:
			var debug_container = DEBUG_CONTAINTER.instantiate()
			%"fighter resources".add_child(debug_container)
			debug_container.get_child(0).texture = fighter.visual
			debug_container.get_child(1).text = fighter.name
		pass

var DEBUG_CONTAINTER = preload("res://SCENES/Debug/debug_container.tscn")
