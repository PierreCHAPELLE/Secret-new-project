extends State
class_name StateFight

@export var Turn_timer : Timer
@export var fight_zone : Fight_ZONE

func Enter():
	super()
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



func can_i_transition()->bool:
	var result : bool = false
	for fighter : Fighter in get_tree().get_nodes_in_group("FIGHTERS"):
		if fighter.tween.is_running():
			return false
	return true
