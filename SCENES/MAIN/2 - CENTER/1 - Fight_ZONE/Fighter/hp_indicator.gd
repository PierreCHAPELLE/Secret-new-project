extends Node2D
class_name Hp_Indicateur

signal finished()

@onready var label: Label = $Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func init(dmg : int):
	if dmg <0:
		label.text ="+" + str(abs(dmg))+"hp"
	else:
		label.text = "-" + str(dmg)+"hp"
	animation_player.play("START")

func init_cant_attack():
	label.text = ("can't" + "\n" + "attack")
	animation_player.play("START")



func finished_signal():
	finished.emit()
