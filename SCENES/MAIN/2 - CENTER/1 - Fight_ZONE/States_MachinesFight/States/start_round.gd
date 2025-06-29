extends StateFight
class_name StateFightStart_ROUND

@onready var progress_bar: ProgressBar = %ProgressBar
@onready var fight_state: Label = %Fight_State

@onready var placement_manager: Placement_Manager = %"Placement Manager"


func Enter():
	await get_tree().process_frame
	placement_manager.Init_placement(FightManager.Ally_Pool, fight_zone.allies_Squad)
	placement_manager.Init_placement_e(FightManager.Enemy_Pool)
	super()
	FightManager.Define_Number_Turn()
	FightManager.current_turn = 0
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
