extends Fighter_Container
class_name Player_Container

@onready var level_up: Button = %"level up"
@onready var level: Label = %level
@onready var exp_to_go: Label = %"exp to go"




func init_hero(fighter_resource : Player_CurrentFighterResource):
	Fighter_Current_Stat = duplicate_template(fighter_resource)
	Update_DATA()
	
	


func _process(delta: float) -> void:
	
	pass
