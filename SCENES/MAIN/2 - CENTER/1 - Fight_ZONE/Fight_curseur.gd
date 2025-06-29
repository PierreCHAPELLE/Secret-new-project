extends Sprite2D
class_name  Fighter_Cursor




@export var Alignement : GlobalsVar.ALIGNEMENT


func _ready() -> void:
	if Alignement == GlobalsVar.ALIGNEMENT.ALLY:
		FightManager.Cursor_A = self
		pass
	else:
		FightManager.Cursor_E = self
		pass
	pass
