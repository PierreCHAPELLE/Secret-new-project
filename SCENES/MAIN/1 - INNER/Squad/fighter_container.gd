extends PanelContainer
class_name Fighter_Container




@export var Fighter_Resource : FighterResource
@export var Fighter_Current_Stat: FighterResource
@export_group("icon")
@export var close_icon1 : Texture2D
@export var close_icon2 : Texture2D
@export var range_icon1 : Texture2D
@export var range_icon2 : Texture2D
@export var heal_icon1 : Texture2D
@export var heal_icon2 : Texture2D
@export var magic_icon1 : Texture2D
@export var magic_icon2 : Texture2D

@onready var name_data: Label = %Name_Data
@onready var hp_data: Label = %HP_data
@onready var atk_data: Label = %ATK_data

@onready var atk_1: TextureRect = %ATK1
@onready var atk_2: TextureRect = %ATK2
@onready var skin: TextureRect = %Skin


func _ready() -> void:
	return

func init(fighter_resource : FighterResource):
	Fighter_Current_Stat = fighter_resource.duplicate(true)
	name_data.text = fighter_resource.name
	hp_data.text = str(fighter_resource.HP)
	atk_data.text = str(fighter_resource.ATK)
	skin.texture = fighter_resource.visual
	Define_range(fighter_resource.attack_type)
	if get_parent() is not Ally_Squad_ZONE:
		%Boutton.set_visible(false)

func Define_range(attack_type : int):
	match  attack_type:
		FighterResource.ATTACK_TYPE.CLOSE:
			atk_1.texture = close_icon1
			atk_2.texture = close_icon2
		FighterResource.ATTACK_TYPE.RANGE:
			atk_1.texture = range_icon1
			atk_2.texture = range_icon2
		FighterResource.ATTACK_TYPE.HEAL:
			atk_1.texture = heal_icon1
			atk_2.texture = heal_icon2
		FighterResource.ATTACK_TYPE.MAGIC:
			atk_1.texture = magic_icon1
			atk_2.texture = magic_icon2


func _on_up_pressed() -> void:
	var squad : Squad_ZONE = get_parent()
	squad._on_fighter_up_requested(self)
	pass 


func _on_down_pressed() -> void:
	var squad : Squad_ZONE = get_parent()
	squad._on_fighter_down_requested(self)
	pass
