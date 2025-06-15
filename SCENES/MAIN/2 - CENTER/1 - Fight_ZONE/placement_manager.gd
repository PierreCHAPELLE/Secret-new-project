extends Node
class_name Placement_Manager

@onready var allies_row_y: Control = %Allies_row_y

func  Init_placement(pool : Pool, squad : Squad_ZONE)->void:
	Attribution_of_ration(squad, pool)
	Place_Fighter(pool)
	return

func Place_Fighter(pool: Pool)->void:
	var index_rank := 0
	var PosY : float = allies_row_y.global_position.y + allies_row_y.size.y / 1.5
	var PosX:float
	var sizeX : float = allies_row_y.global_position.x + allies_row_y.size.x
	for fighter: Fighter in pool.get_children():
		if pool.Alignement == Pool.ALIGNEMENT.ALLY:
			PosX = sizeX - (sizeX * fighter.Field_Index)
			pass
		elif pool.Alignement == Pool.ALIGNEMENT.ENEMY:
			PosX = sizeX * fighter.Field_Index
			pass
		fighter.current_fight_pos = Vector2(PosX,PosY)
		fighter.move_to(Vector2(PosX,PosY))
		pass

func Attribution_of_ration(squad : Squad_ZONE, pool : Pool)->void:
	var Number_Of_Fighter :float = float(squad.get_children().size()+1)
	var ration_mult : float = float(1/Number_Of_Fighter)
	var index_rank := 0
	for fighterC: Fighter_Container in squad.get_children():
		var concerned_fighter : Fighter = Util.find_fighter_from_squad(fighterC,pool)
		index_rank +=1
		concerned_fighter.Field_Index = index_rank * ration_mult
		pool.move_child(concerned_fighter,index_rank-1)
		pass
	
