extends PanelContainer
class_name Item_Container
@onready var sprite: TextureRect = %sprite

var item :ItemResource
func init(resource:ItemResource) -> void:
	item=resource
	sprite.texture=resource.visual
	pass

func _on_mouse_entered() -> void:
	SignalBus.Show_Item_Detail.emit(item)
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	SignalBus.Hide_Item_Detail.emit()
	pass # Replace with function body.
