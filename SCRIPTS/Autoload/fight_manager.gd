extends Node
class_name Fight_Manager


var Cursor_A: Sprite2D
var Cursor_E: Sprite2D
var Ally_Pool :Pool
var Enemy_Pool:Pool

var list_of_outer_fighter : Array[CurrentFighterResource]

var number_of_turn_by_round : int
var current_turn : int = 0



var first_turn


func Define_Number_Turn():
	var number_alive_in_pool_a : int = Ally_Pool.get_children().size()
	var number_alive_in_pool_e : int = Enemy_Pool.get_children().size()
	number_of_turn_by_round = max(number_alive_in_pool_a,number_alive_in_pool_e)
	pass



func Define_Currents_Fighter(Ali: GlobalsVar.ALIGNEMENT) -> Fighter:
	var concerned_pool : Pool
	var concerned_fighter : Fighter
	 
	if Ali == GlobalsVar.ALIGNEMENT.ALLY :
		concerned_pool = Ally_Pool
	else:
		concerned_pool = Enemy_Pool
	
	if current_turn < concerned_pool.get_children().size():
		concerned_fighter = concerned_pool.get_children()[current_turn]
	else:
		concerned_fighter = null
	
	return concerned_fighter

func Define_Selector_Placement(fighter : Fighter,FightSelector : Fighter_Cursor):
	var fighter_offset: int = 80 
	
	if current_turn == 0:
		FightSelector.visible = true
		FightSelector.global_position = fighter.global_position
		FightSelector.global_position.y += fighter_offset
		return
	elif fighter == null:
		FightSelector.visible = false
		return
	
	var tween = create_tween()
	var destination : Vector2 = fighter.global_position
	destination.y += fighter_offset
	tween.tween_property(FightSelector,"global_position",destination, 0.1)
	pass
	


func Define_First_Fighter_In_Pool(Ali: GlobalsVar.ALIGNEMENT) -> Fighter:
	var concerned_pool : Pool
	var concerned_fighter : Fighter
	 
	if Ali == GlobalsVar.ALIGNEMENT.ALLY :
		concerned_pool = Ally_Pool
	else:
		concerned_pool = Enemy_Pool
	
	
	for child : Fighter in concerned_pool.get_children():
		if child.alive == true:
			concerned_fighter= child
			return concerned_fighter
	push_error()
	return null



func init_round():
	var current_fighter_a : Fighter = Define_Currents_Fighter(GlobalsVar.ALIGNEMENT.ALLY)
	var current_fighter_e : Fighter = Define_Currents_Fighter(GlobalsVar.ALIGNEMENT.ENEMY)
	
	if current_fighter_a:
		current_fighter_a.Placed = false
	if current_fighter_e:
		current_fighter_e.Placed = false
	pass




func do_turn():
	var current_fighter_a : Fighter = Define_Currents_Fighter(GlobalsVar.ALIGNEMENT.ALLY)
	var current_fighter_e : Fighter = Define_Currents_Fighter(GlobalsVar.ALIGNEMENT.ENEMY)
	
	if current_fighter_a:
		current_fighter_a.Do_Action()
	if current_fighter_e:
		current_fighter_e.Do_Action()
	pass


func is_there_alive_fighter() -> Pool:
	var PoolA := false
	for child in Ally_Pool.get_children():
		if child.alive == true:
			PoolA = true
	var PoolE := false
	for child in Enemy_Pool.get_children():
		if child.alive == true:
			PoolE = true
	
	if PoolA == false :
		return Ally_Pool
	
	if PoolE == false :
		return Enemy_Pool
	
	return null
	
