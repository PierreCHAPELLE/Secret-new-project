@icon("uid://docaxsarho4b")
extends PanelContainer
class_name Fight_ZONE

signal start_fight()

@export var Turn_Timer : Timer
@export var progress_bar: ProgressBar 

@export var allies_pool: Pool
@export var enemies_pool : Pool

@export var allies_Squad: Squad_ZONE
@export var enemies_Squad : Squad_ZONE

@export var ready_button : Button
@onready var states_machine_fight: StatesMachineFight = $StatesMachineFIGHT

func _ready() -> void:
	GlobalsVar.Fight_Zone = self

func _process(delta: float) -> void:
	if progress_bar.visible ==  true:
		progress_bar.value = (1 - Turn_Timer.time_left / Turn_Timer.wait_time) * 100 
		pass
	else:
		return
	
	%Fight_State.text = states_machine_fight.current_state.name
	pass


func _init_fight() -> void:
	for fighter : Fighter_Container in allies_Squad.get_children():
		generate_fighter(fighter,allies_pool)
	for fighter : Fighter_Container in enemies_Squad.get_children():
		generate_fighter(fighter,enemies_pool)
	
	$"Placement Manager".Init_placement(allies_pool)
	$"Placement Manager".Init_placement(enemies_pool)
	start_fight.emit()


var FIGHTER = preload("uid://bvfvfuyp0w2mo")

func generate_fighter(fighter_container:Fighter_Container,pool : Pool):
	var fighter:Fighter = FIGHTER.instantiate()
	pool.add_child(fighter)
	fighter.init(fighter_container.Fighter_Current_Stat)
	pass



@onready var end_round: StateFightEnd_ROUND = %End_ROUND

func _on_ready_pressed() -> void:
	end_round.round_ready = true
	
	pass
