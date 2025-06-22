extends StateFight
class_name StateFightStart_ROUND

@onready var progress_bar: ProgressBar = %ProgressBar
@onready var fight_state: Label = %Fight_State

@onready var placement_manager: Placement_Manager = %"Placement Manager"


func Enter():
	await get_tree().process_frame
	await placement_manager.Init_placement(fight_zone.allies_pool,fight_zone.allies_Squad)
	await placement_manager.Init_placement(fight_zone.enemies_pool,fight_zone.enemies_Squad)
	
	super()
	progress_bar.visible = true
	fight_state.visible = true
	Define_Number_Turn()
	entity.current_turn = 0
	pass

func Exit():
	super()
	pass

func Update(delta : float):
	if can_i_transition():
		Transitioned.emit(self,"Start_TURN")
	else:
		return
	super(delta)
	pass

func Physics_Update(delta : float):
	super(delta)
	pass






func Define_Number_Turn():
	var number_alive_in_pool_a : int = fight_zone.allies_pool.get_children().size()
	var number_alive_in_pool_e : int = fight_zone.enemies_pool.get_children().size()
	entity.number_of_turn_by_round = max(number_alive_in_pool_a,number_alive_in_pool_e)
	pass
