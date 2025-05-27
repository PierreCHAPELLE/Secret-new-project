extends Node
class_name Placement_Manager


@onready var allies_row_y: Control = %Allies_row_y
@onready var enemies_row_y: Control = %Enemies_row_y



func  Init_placement(pool : Pool)->void:
	Attribution_of_ration(pool)
	Place_Fighter(pool)
	
	return


func Place_Fighter(pool : Pool)->void:
	var index_rank := 0
	var PosY : float = pool.Row.size.y / 2
	var PosX:float
	var sizeX : float = pool.Row.size.x
	for fighter: Fighter in pool.get_children():
		if pool.Alignement == Pool.ALIGNEMENT.ALLY:
			PosX = sizeX - (sizeX * fighter.Field_Index)
		elif pool.Alignement == Pool.ALIGNEMENT.ENEMY:
			PosX = sizeX*fighter.Field_Index
			
			
		fighter.position = Vector2(PosX,PosY)
		pass

func Attribution_of_ration(pool : Pool)->void:
	var Number_Of_Fighter :float = float(pool.get_children().size()+1)
	var ration_mult : float = float(1/Number_Of_Fighter)
	var index_rank := 0
	for fighter: Fighter in pool.get_children():
		index_rank +=1
		fighter.Field_Index = index_rank * ration_mult
		pass
	


@onready var allies_pool: Pool = %Allies_Pool
@onready var enemies_pool: Pool = %Enemies_Pool
func _on_button_pressed() -> void:
	Init_placement(allies_pool)
	Init_placement(enemies_pool)
	pass # Replace with function body.
