extends StateFight
class_name StateFightStart_ROUND

@onready var progress_bar: ProgressBar = %ProgressBar
@onready var fight_state: Label = %Fight_State

@onready var placement_manager: Placement_Manager = %"Placement Manager"


func Enter():
	placement_manager.Init_placement(fight_zone.allies_pool,fight_zone.allies_Squad)
	placement_manager.Init_placement(fight_zone.enemies_pool,fight_zone.enemies_Squad)
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
		print('je veux transitionné')
	else:
		print('je peux pas transitionné')
		return
	super(delta)
	pass

func Physics_Update(delta : float):
	super(delta)
	pass

func can_i_transition()->bool:
	var result : bool = false
	for fighter : Fighter in get_tree().get_nodes_in_group("FIGHTERS"):
		if fighter.tween.is_running():
			return false
	return true




func Define_Number_Turn():
	var number_alive_in_pool_a : int = fight_zone.allies_pool.get_children().size()
	var number_alive_in_pool_e : int = fight_zone.enemies_pool.get_children().size()
	entity.number_of_turn_by_round = max(number_alive_in_pool_a,number_alive_in_pool_e)
	pass
