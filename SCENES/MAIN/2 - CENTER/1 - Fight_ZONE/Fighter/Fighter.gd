extends Node2D
class_name Fighter



@export var row_y : Control


@export var speed : int

@export var ATK : int
@export var HP : int

@onready var atk_label: Label = %"ATK Value"
@onready var hp_label: Label = %"HP Value"
@onready var sprite_2d: TextureRect =%Sprite2D

var Field_Index : float

var alive : bool = true

func init(fighter_resource: FighterResource) -> void:
	atk_label.text = str(fighter_resource.ATK)
	hp_label.text = str(fighter_resource.HP)
	sprite_2d.texture = fighter_resource.visual
	print("j'existe")
	pass


func Attack()->int:
	var dmg :int
	return dmg

func Take_Dmg(fighter_resource:Fighter):
	fighter_resource.HP -= fighter_resource.atk
	hp_label.text = str(HP)
	pass

func Do_Action():
	modulate.g8 -= 20
	
