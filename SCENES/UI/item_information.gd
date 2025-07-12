extends PanelContainer
class_name Item_Panel


#@export var visual : Texture2D
#@export var name : String
#@export_multiline var description : String
#
#@export var bonus_type : Array[GlobalsVar.BONUS]


@onready var sprite: TextureRect = %Sprite
@onready var name_label: Label = %Name_label
@onready var flavor_text: Label = $"VBoxContainer/HBoxContainer/VBoxContainer/Flavor text"

func init(item: ItemResource)->void:
	sprite.texture = item.visual
	name_label.text = item.name
	init_bonues(item)
	show()
	pass

func init_bonues(item: ItemResource):
	if item.List_of_Bonus == null:
		return
	for bonus in item.List_of_Bonus  :
		var bonus_display = GlobalsVar.BONUS_DISPLAY.instantiate()
		bonus_display.init(bonus)
		%GridContainer.add_child(bonus_display)
		pass
	pass

func _process(delta: float) -> void:
	if self.visible == false:
		for child in %GridContainer.get_children():
			child.queue_free()
