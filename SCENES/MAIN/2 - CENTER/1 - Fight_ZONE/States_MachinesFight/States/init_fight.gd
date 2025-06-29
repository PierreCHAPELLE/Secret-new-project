extends StateFight
class_name StateFightInit_FIGHT

func Enter():
	super()
	_init_fight()
	%ProgressBar.set_visible(true)
	%Fight_State.set_visible(true)
	GlobalsVar.fight_is_running = true
	FightManager.first_turn = true
	
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


func _init_fight() -> void:
	for fighter : Fighter_Container in fight_zone.allies_Squad.get_children():
		generate_fighter(fighter.Fighter_Current_Stat,FightManager.Ally_Pool)
		pass
	for fighter : CurrentFighterResource in FightManager.list_of_outer_fighter:
		generate_fighter(fighter,FightManager.Enemy_Pool)
		pass
	
	pass



func generate_fighter(Fighter_Current_Stat:FighterResource,pool : Pool):
	var allies_row_y: Control = %Allies_row_y
	var enemies_row_y: Control = %Enemies_row_y
	var fighter:Fighter = GlobalsVar.FIGHTER.instantiate()
	
	pool.add_child(fighter)
	fighter.init(Fighter_Current_Stat)
	
	var posX : float
	var posY : float
	if pool == FightManager.Ally_Pool:
		posX = allies_row_y.global_position.x
		posY = allies_row_y.global_position.y + (allies_row_y.size.y/2)
		pass
	else:
		posX = enemies_row_y.global_position.x + enemies_row_y.size.x
		posY = enemies_row_y.global_position.y + enemies_row_y.size.y/2
		pass
	
	fighter.global_position = Vector2(posX,posY)
	pass



func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	Transitioned.emit(self,"Start_ROUND")
	pass # Replace with function body.
