extends Sprite2D
class_name Selector





func _on_maps_none_clicked() -> void:
	hide()
	pass


func get_in_position(tile_pos : Vector2, concerned_layer: TileMapLayer)->void:
	show()
	var target_position = concerned_layer.position + tile_pos * 16 + Vector2(8,8)
	position = target_position
	pass
