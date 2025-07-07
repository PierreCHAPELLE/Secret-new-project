extends VBoxContainer
class_name EXPECTED_item_display

@onready var exp: Label = %exp
@onready var gold: Label = %gold

func show_expected_lot(tile_data : CustomTile)->void:
	if tile_data.EXP_Expected:
		exp.text = str(tile_data.EXP_Expected)
	if tile_data.GOLD_Expected:
		exp.text = str(tile_data.GOLD_Expected)
	
	
	self.show()
	
	pass
