extends Sprite2D
class_name Selector


func _ready() -> void:
	SignalBus.Dialogue_ended.connect(_on_maps_none_clicked)
	pass





func _on_maps_none_clicked() -> void:
	hide()
	pass


func get_in_position(tile_pos : Vector2, concerned_layer: TileMapLayer)->void:
	show()
	var target_position = concerned_layer.position + tile_pos * 18 + Vector2(9,9)
	position = target_position
	pass
