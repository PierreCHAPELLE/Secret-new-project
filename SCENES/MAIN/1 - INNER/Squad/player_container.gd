extends Fighter_Container
class_name Player_Container

@onready var level_up: Button = %"level up"
@onready var level: Label = %level
@onready var exp_to_go_label: Label = %"exp to go"

@onready var Level_up: level_up = %"level up"



func init_hero(fighter_resource : Player_CurrentFighterResource):
	Fighter_Current_Stat = duplicate_template(fighter_resource)
	Update_DATA()
	pass

func _process(delta: float) -> void:
	
	pass


func Update_hero_DATA():
	var player_data : Player_CurrentFighterResource = Fighter_Current_Stat
	var exp_to_go = player_data.Exp_to_next_level - player_data.Current_Exp
	#if exp_to_go
	exp_to_go_label.text = "next in" + str(Fighter_Current_Stat.Exp) +"exp"
	level.text =  "Level :" + str(Level_up.current_level)

func Get_EXP(EXP: int):
	var player_data : Player_CurrentFighterResource = Fighter_Current_Stat
	player_data.Current_Exp += EXP
	while player_data.Current_Exp > player_data.Exp_to_next_level:
		player_data.level += 1
		next_exp_to_go()
		player_data.Current_Exp - player_data.Exp_to_next_level
		pass
	Update_hero_DATA()
	pass

#ici je lanipule la courbe d'exp necessaire pour le prochain niveaux
func next_exp_to_go():
	pass
