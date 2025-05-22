extends Node2D
@onready var Map: TileMapLayer = %Map



func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Click"):
		return_tile(get_global_mouse_position())
	pass



func return_tile(mous_pos : Vector2):
	var tile_pos = Map.local_to_map(mous_pos)
	print(tile_pos)
