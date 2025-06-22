extends Node2D
class_name Hp_Indicateur

signal finished()

@onready var label: Label = $Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func init(dmg : int):
	label.text = str(dmg)+"hp"
	animation_player.play("START")
	


func finished_signal():
	finished.emit()
