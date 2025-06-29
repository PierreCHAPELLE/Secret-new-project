@icon("uid://bbjlw16np6hgv")
extends VBoxContainer
class_name Main_Inventory

var deplayed :=false
@onready var animation_player: AnimationPlayer = %AnimationPlayer

func _on_button_pressed() -> void:
	if deplayed == false:
		animation_player.play("OPEN")
		deplayed = true
	else:
		animation_player.play("CLOSE")
		deplayed = false
	
	pass # Replace with function body.
