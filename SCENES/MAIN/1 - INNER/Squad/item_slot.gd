extends PanelContainer
class_name Item_Slot

signal new_item_has_eqquiped()
signal item_has_uneqquiped()


var ITEM_CONTAINER = GlobalsVar.ITEM_CONTAINER

var current_item : Item_Container


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true
	return false


func _drop_data(at_position: Vector2, data: Variant) -> void:
	var item_container : Item_Container = ITEM_CONTAINER.instantiate()
	add_child(item_container)
	item_container.init(data)
	current_item = item_container
	pass
