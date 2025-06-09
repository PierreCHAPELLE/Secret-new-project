extends StateFight
class_name StateFightEnd_ROUND

var round_ready :=false
func Enter():
	fight_zone.ready_button.show()
	super()
	pass

func Exit():
	super()
	round_ready = false
	fight_zone.ready_button.hide()
	pass

func Update(delta : float):
	super(delta)
	
	if (fight_zone.allies_pool.get_children().size() == 0 or
	 fight_zone.allies_pool.get_children().size() ==0):
		Transitioned.emit(self,"End_Fight")
	elif round_ready == true:
		Transitioned.emit(self,"Start_ROUND")
	
	pass

func Physics_Update(delta : float):
	super(delta)
	pass
