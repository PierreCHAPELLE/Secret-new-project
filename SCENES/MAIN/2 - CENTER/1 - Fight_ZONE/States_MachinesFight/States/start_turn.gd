extends StateFight
class_name StateFightStart_TURN

@onready var selected_a: Sprite2D = %Selected_A
@onready var selected_e: Sprite2D = %Selected_E




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
	Turn_timer.start()
	Define_Currents_Fighter()
	Transitioned.emit(self,"Do_TURN")
	pass



func Define_Currents_Fighter():
	if entity.current_turn < Allies_pool.get_children().size():
		entity.current_fighter_a =  Allies_pool.get_children()[entity.current_turn]
	else:
		entity.current_fighter_a = null
	
	if entity.current_turn < Enemies_pool.get_children().size():
		entity.current_fighter_e =  Enemies_pool.get_children()[entity.current_turn]
	else:
		entity.current_fighter_e = null
	Define_Selector_Placement(entity.current_fighter_a,selected_a)
	Define_Selector_Placement(entity.current_fighter_e,selected_e)
	pass

func Define_Selector_Placement(fighter,FightSelector):
	if fighter:
		FightSelector.visible = true
		FightSelector.global_position = fighter.global_position
		FightSelector.global_position.y += 80
	else:
		FightSelector.visible = false
