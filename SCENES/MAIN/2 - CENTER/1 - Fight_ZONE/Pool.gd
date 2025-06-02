extends Node2D
class_name Pool

enum ALIGNEMENT {ALLY,ENEMY}
@export var Row : Control

@export var Alignement : ALIGNEMENT


@export var Fight_Zone : Fight_ZONE

var All_Fighter_Attacked : bool = false
func Excute_Round():
	All_Fighter_Attacked = false
	pass 

func Excute_Turn(current_turn:int):
	verif_available_fighter(current_turn) 
	if All_Fighter_Attacked == true:
		return
	else:
		Do_Current_Fighter_Action(current_turn) 
		verif_available_fighter(current_turn) 
	pass

func Do_Current_Fighter_Action(current_turn:int):
	get_children()[current_turn].Do_Action()
	pass

func verif_available_fighter(current_turn:int):
	if current_turn + 1 > get_children().size():
		All_Fighter_Attacked = true
	pass
