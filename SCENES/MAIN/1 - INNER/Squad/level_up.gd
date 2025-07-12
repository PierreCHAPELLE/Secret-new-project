extends Button
class_name level_up

@export var fighter_container : Player_Container

var current_level : int

func _process(delta: float) -> void:
	Handle_Showable()
	pass

func Handle_Showable():
	var player_data : Player_CurrentFighterResource = fighter_container.Fighter_Current_Stat 
	if current_level < player_data.level:
		self.show()
		pass
	else:
		self.hide()
		pass
	pass



func _on_pressed() -> void:
	current_level +1
	SignalBus.Level_Up.emit()
	pass
