extends StateFight
class_name StateFightEnd_TURN

func Enter():
	super()
	FightManager.current_turn +=1
	pass

func Exit():
	super()
	pass

func Update(delta : float):
	super(delta)
	if FightManager.current_turn >= FightManager.number_of_turn_by_round:
		Transitioned.emit(self,"End_ROUND")
	else:
		Transitioned.emit(self,"Start_TURN")
	pass

func Physics_Update(delta : float):
	super(delta)
	pass
