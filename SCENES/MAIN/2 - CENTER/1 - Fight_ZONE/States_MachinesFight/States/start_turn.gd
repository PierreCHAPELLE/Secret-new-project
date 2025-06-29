extends StateFight
class_name StateFightStart_TURN


@onready var turn_timer: Timer = %Turn_Timer


func Enter():
	turn_timer.start()
	super()
	var current_fighter_a = FightManager.Define_Currents_Fighter(GlobalsVar.ALIGNEMENT.ALLY)
	var current_fighter_e = FightManager.Define_Currents_Fighter(GlobalsVar.ALIGNEMENT.ENEMY)
	FightManager.Define_Selector_Placement(current_fighter_a,FightManager.Cursor_A)
	FightManager.Define_Selector_Placement(current_fighter_e,FightManager.Cursor_E)
	FightManager.init_round()
	pass

func Exit():
	super()
	pass

func Update(delta : float):
	Transitioned.emit(self,"Do_TURN")
	super(delta)
	pass

func Physics_Update(delta : float):
	super(delta)
	pass
