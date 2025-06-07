extends StateFight
class_name StateFightStart_ROUND
@onready var fight_zone: Fight_ZONE = $"../.."

@onready var progress_bar: ProgressBar = %ProgressBar
@onready var fight_state: Label = %Fight_State

@onready var placement_manager: Placement_Manager = $"../../Placement Manager"


func Enter():
	placement_manager.Place_Fighter(fight_zone.allies_pool)
	super()
	
	print("la")
	pass

func Exit():
	super()
	pass

func Update(delta : float):
	super(delta)
	pass

func Physics_Update(delta : float):
	progress_bar.visible = true
	fight_state.visible = true
	Define_Number_Turn()
	entity.current_turn = 0
	Transitioned.emit(self,"Start_TURN")
	super(delta)
	pass






func Define_Number_Turn():
	var number_alive_in_pool_a : int = Allies_pool.get_children().size()
	var number_alive_in_pool_e : int = Enemies_pool.get_children().size()
	##pour plus tard
	#var number_alive_in_pool_a : int = 0
	#var number_alive_in_pool_e : int = 0
	#for fighter : Fighter in Allies_pool.get_children():
		#if fighter.alive == true:
			#number_alive_in_pool_a +=1
	#for fighter : Fighter in Enemies_pool.get_children():
		#if fighter.alive == true:
			#number_alive_in_pool_e +=1
	entity.number_of_turn_by_round = max(number_alive_in_pool_a,number_alive_in_pool_e)
	pass
