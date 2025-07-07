extends PanelContainer
class_name Item_Panel


#@export var visual : Texture2D
#@export var name : String
#@export_multiline var description : String
#
#@export var bonus_type : Array[GlobalsVar.BONUS]


@onready var sprite: TextureRect = %Sprite
@onready var name_label: Label = %Name_label

func init(item: ItemResource)->void:
	sprite.texture = item.visual
	name_label.text = item.name
	
	
	
	
