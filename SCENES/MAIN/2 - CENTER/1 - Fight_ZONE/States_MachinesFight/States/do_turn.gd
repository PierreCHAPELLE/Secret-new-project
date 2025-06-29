extends StateFight
class_name StateFightDo_Turn
@onready var turn_timer: Timer = %Turn_Timer

func Enter():
	super()
	FightManager.do_turn()
	pass

func Exit():
	super()
	pass

func Update(delta : float):
	if can_i_transition() and turn_timer.is_stopped():
		Transitioned.emit(self,"End_TURN")
	else:
		return
	super(delta)
	pass

func Physics_Update(delta : float):
	super(delta)
	pass
