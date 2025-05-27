@icon("uid://docaxsarho4b")
extends HBoxContainer
class_name Fight_ZONE


@export var Turn_Timer : Timer
@onready var progress_bar: ProgressBar = %ProgressBar


@export var allies_pool: Pool
@export var enemies_pool: Pool

var Number_Of_Turn_By_Round : int
var Current_Turn : int = 0


func init_fight():
	var Number_of_turn_by_round : int = max(
		allies_pool.get_children().size(),enemies_pool.get_children().size())
	Current_Turn = 0
	New_Round()
	Turn_Timer.start()
	pass


func New_Round()->void:
	allies_pool.Excute_Round()
	enemies_pool.Excute_Round()
	pass



func _process(delta: float) -> void:
	progress_bar.value = (1 - Turn_Timer.time_left / Turn_Timer.wait_time) * 100 
	
	return

func _on_timer_timeout() -> void:
	allies_pool.Excute_Turn(Current_Turn)
	enemies_pool.Excute_Turn(Current_Turn)
	if (allies_pool.All_Fighter_Attacked == false
	and enemies_pool.All_Fighter_Attacked == false):
		Turn_Timer.start()
	else:
		pass
	pass



func End_Fight():
	Turn_Timer.stop()
	progress_bar.set_value_no_signal(0)
	pass

func _on_fight_pressed() -> void:
	init_fight()
	pass
