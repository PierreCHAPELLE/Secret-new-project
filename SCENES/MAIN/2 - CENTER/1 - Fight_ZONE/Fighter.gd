extends Node2D
class_name Fighter

@export var speed : int

@export var ATK : int
@export var HP : int

@onready var atk_label: Label = %"ATK Value"
@onready var hp_label: Label = %"HP Value"

var Field_Index


func _ready() -> void:
	atk_label.text = str(ATK)
	hp_label.text = str(HP)
	pass


func Attack():
	pass

func Take_Dmg(DMG:int):
	HP -= DMG
	hp_label.text = str(HP)
	pass

func Do_Action():
	modulate.g8 -= 20
