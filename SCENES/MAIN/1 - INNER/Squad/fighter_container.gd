extends PanelContainer
class_name Fighter_Container




@export var Fighter_Resource : FighterResource
@export var Fighter_Current_Stat: CurrentFighterResource
@export_group("icon")
@export var close_icon1 : Texture2D
@export var close_icon2 : Texture2D
@export var range_icon1 : Texture2D
@export var range_icon2 : Texture2D
@export var heal_icon1 : Texture2D
@export var heal_icon2 : Texture2D
@export var magic_icon1 : Texture2D
@export var magic_icon2 : Texture2D

@export var dead : Texture2D



@onready var name_data: Label = %Name_Data
@onready var hp_data: Label = %HP_data
@onready var atk_data: Label = %ATK_data

@onready var atk_1: TextureRect = %ATK1
@onready var atk_2: TextureRect = %ATK2
@onready var skin: TextureRect = %Skin
@onready var hp_max_data: Label = %HP_MAX_data


func _ready() -> void:
	return

func init(fighter_resource : CurrentFighterResource):
	Fighter_Current_Stat = duplicate_template(fighter_resource)
	Update_DATA()


func Update_DATA():
	name_data.text = Fighter_Current_Stat.name
	hp_data.text = str(Fighter_Current_Stat.HP)
	hp_max_data.text = "/"+ str(Fighter_Current_Stat.MAX_HP)
	atk_data.text = str(Fighter_Current_Stat.ATK)
	if Fighter_Current_Stat.HP == 0:
		skin.texture = dead
	else:
		skin.texture = Fighter_Current_Stat.visual
	
	Define_range(Fighter_Current_Stat.attack_type)
	if get_parent() is not Ally_Squad_ZONE:
		%Boutton.set_visible(false)

func Define_range(attack_type : int):
	match  attack_type:
		GlobalsVar.ATTACK_TYPE.CLOSE:
			atk_1.texture = close_icon1
			atk_2.texture = close_icon2
		GlobalsVar.ATTACK_TYPE.RANGE:
			atk_1.texture = range_icon1
			atk_2.texture = range_icon2
		GlobalsVar.ATTACK_TYPE.HEAL:
			atk_1.texture = heal_icon1
			atk_2.texture = heal_icon2
		GlobalsVar.ATTACK_TYPE.MAGIC:
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


func duplicate_template(fighter_resource : CurrentFighterResource)->CurrentFighterResource:
	var current_resource = fighter_resource.duplicate()
	#var current_resource = CurrentFighterResource.new()
	#current_resource.visual = fighter_resource.visual
	#current_resource.name = fighter_resource.name
	#current_resource.ATK = fighter_resource.ATK
	#current_resource.attack_type = fighter_resource.attack_type
	#current_resource.bonus_type = fighter_resource.bonus_type
	#current_resource.item_wore = fighter_resource.item_wore
	#current_resource.HP = fighter_resource.HP
	#current_resource.MAX_HP = fighter_resource.HP
	return current_resource
