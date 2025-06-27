extends StateFight
class_name StateFightStart_TURN

@onready var selected_a: Sprite2D = %Selected_A
@onready var selected_e: Sprite2D = %Selected_E


@onready var turn_timer: Timer = %Turn_Timer


func Enter():
	turn_timer.start()
	super()
	pass

func Exit():
	super()
	pass

func Update(delta : float):
	Define_Currents_Fighter()
	Transitioned.emit(self,"Do_TURN")
	super(delta)
	pass

func Physics_Update(delta : float):
	super(delta)

	pass



func Define_Currents_Fighter():
	if entity.current_turn < fight_zone.allies_pool.get_children().size():
		entity.current_fighter_a =  fight_zone.allies_pool.get_children()[entity.current_turn]
	else:
		entity.current_fighter_a = null
	
	if entity.current_turn < fight_zone.enemies_pool.get_children().size():
		entity.current_fighter_e =  fight_zone.enemies_pool.get_children()[entity.current_turn]
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
