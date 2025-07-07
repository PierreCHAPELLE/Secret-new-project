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
@onready var states_machine_fight: StatesMachineFight = %StatesMachineFIGHT

@onready var end_round: StateFightEnd_ROUND = %End_ROUND
@onready var init_fight: StateFightInit_FIGHT = %Init_FIGHT

func _ready() -> void:
	GlobalsVar.Fight_Zone = self
	size_flags_stretch_ratio = 0.5

func _process(_delta: float) -> void:
	if progress_bar.visible ==  true:
		progress_bar.value = (1 - Turn_Timer.time_left / Turn_Timer.wait_time) * 100 
		%Fight_State.text = states_machine_fight.current_state.name
		pass
	else:
		pass
	pass

func _on_ready_pressed() -> void:
	end_round.round_ready = true
	pass

func _init_fight() -> void:
	start_fight.emit()
	pass
