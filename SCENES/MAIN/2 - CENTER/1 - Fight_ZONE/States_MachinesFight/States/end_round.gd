extends StateFight
class_name StateFightEnd_ROUND

var round_ready :=false

func Enter():
	fight_zone.ready_button.show()
	super()
	deal_end_fight()
	pass

func Exit():
	super()
	round_ready = false
	fight_zone.ready_button.hide()
	pass

func Update(delta : float):
	super(delta)
	if round_ready == true:
		Transitioned.emit(self,"Start_ROUND")
		
	pass

func Physics_Update(delta : float):
	super(delta)
	pass


func deal_end_fight():
	if FightManager.is_there_alive_fighter() == FightManager.Ally_Pool:
		Transitioned.emit(self,"End_Fight")
		GlobalsVar.Player_Is_Dead = true
	if FightManager.is_there_alive_fighter() == FightManager.Enemy_Pool:
		await get_tree().process_frame
		Transitioned.emit(self,"End_Fight")
	else:
		pass
