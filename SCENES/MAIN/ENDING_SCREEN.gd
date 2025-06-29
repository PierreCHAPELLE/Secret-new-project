extends ColorRect



func end():
	self.visible = true

func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.
