extends StateFight
class_name StateFightDo_Turn
@onready var turn_timer: Timer = %Turn_Timer

func Enter():
	super()
	var first_fighter_in_row_A : Fighter = fight_zone.allies_pool.get_child(0)
	var first_fighter_in_row_E : Fighter = fight_zone.enemies_pool.get_child(0)
	#%FIGHT_manager.do_actions(entity.current_fighter_a,entity.current_fighter_e)
	if  entity.current_fighter_a:
		entity.current_fighter_a.Do_Action(first_fighter_in_row_E,entity.current_turn)
		entity.current_fighter_a.Placed= false
	if entity.current_fighter_e:
		entity.current_fighter_e.Do_Action(first_fighter_in_row_A,entity.current_turn)
		entity.current_fighter_e.Placed= false
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
