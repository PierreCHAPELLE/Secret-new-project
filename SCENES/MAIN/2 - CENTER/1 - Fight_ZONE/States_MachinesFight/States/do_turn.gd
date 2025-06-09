extends StateFight
class_name StateFightDo_Turn

func Enter():
	super()
	%FIGHT_manager.do_actions(entity.current_fighter_a,entity.current_fighter_e)
	pass

func Exit():
	super()
	pass

func Update(delta : float):
	super(delta)
	pass

func Physics_Update(delta : float):
	super(delta)
	pass


func _on_turn_timer_timeout() -> void:
	Transitioned.emit(self,"End_TURN")
	pass # Replace with function body.
