extends PanelContainer
class_name Bonus_Display
#enum  BONUS{ARMOR,
	#VENOM,
	#LIFE_STEAL,
	#HP,
	#ATK,
	#}
@export var Type_Of_Bonus : GlobalsVar.BONUS
@export var List_OF_Visual : Array[Texture2D]
func init(bonus : GlobalsVar.BONUS):
	Type_Of_Bonus = bonus
	%Visual.texture = List_OF_Visual[Type_Of_Bonus]
