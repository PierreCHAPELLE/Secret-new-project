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
	
	pass


func _process(delta: float) -> void:
	handle_gold_display()
	



func handle_gold_display():
	if GlobalsVar.GOLD_Owned <= 0:
		%"Gold own".set_visible(false)
	else:
		%"Gold own".text = "Golds Owned:" + str(GlobalsVar.GOLD_Owned)
		pass
	pass
