extends StateFight
class_name StateFightEnd_ROUND

func Enter():
	
	super()
	pass

func Exit():
	super()
	pass

func Update(delta : float):
	super(delta)
	if (Allies_pool.get_children().size() == 0 or
	 Enemies_pool.get_children().size() ==0):
		Transitioned.emit(self,"End_Fight")
	else:
		Transitioned.emit(self,"Start_ROUND")
	
	pass

func Physics_Update(delta : float):
	super(delta)
	pass
