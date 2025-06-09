extends StateFight
class_name StateFightInit_FIGHT

func Enter():
	super()
	_init_fight()
	%Init_Fight_Timer.start()
	%ProgressBar.set_visible(true)
	%Fight_State.set_visible(true)
	%AnimationPlayer.play("start_fight")
	pass

func Exit():
	super()
	pass

func Update(delta : float):
	super(delta)
	pass

func Physics_Update(delta : float):
	super(delta)
	pass









@onready var placement_manager: Placement_Manager = %"Placement Manager"

func _init_fight() -> void:
	for fighter : Fighter_Container in fight_zone.allies_Squad.get_children():
		generate_fighter(fighter,fight_zone.allies_pool)
		pass
	for fighter : Fighter_Container in fight_zone.enemies_Squad.get_children():
		generate_fighter(fighter,fight_zone.enemies_pool)
		pass
	
	pass

@onready var allies_row_y: Control = %Allies_row_y
@onready var enemies_row_y: Control = %Enemies_row_y

var FIGHTER = preload("uid://bvfvfuyp0w2mo")
func generate_fighter(fighter_container:Fighter_Container,pool : Pool):
	var fighter:Fighter = FIGHTER.instantiate()
	pool.add_child(fighter)
	fighter.init(fighter_container.Fighter_Current_Stat)
	var posX : float
	var posY : float
	if pool == fight_zone.allies_pool:
		posX = allies_row_y.global_position.x
		posY = allies_row_y.global_position.y + (allies_row_y.size.y/2)
		pass
	else:
		posX = enemies_row_y.global_position.x + enemies_row_y.size.x
		posY = enemies_row_y.global_position.y + enemies_row_y.size.y/2
		pass
	fighter.global_position = Vector2(posX,posY)
	pass


func _on_timer_timeout() -> void:
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Transitioned.emit(self,"Start_ROUND")
	pass # Replace with function body.
