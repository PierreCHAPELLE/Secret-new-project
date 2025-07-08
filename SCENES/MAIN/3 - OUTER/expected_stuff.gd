extends VBoxContainer
class_name EXPECTED_item_display
var ITEM_CONTAINER = GlobalsVar.ITEM_CONTAINER
@onready var exp: Label = %exp
@onready var gold: Label = %gold
@onready var grid_container: GridContainer = %GridContainer

func show_expected_lot(tile_data : CustomTile)->void:
	if tile_data.EXP_Expected>0:
		exp.text = str(tile_data.EXP_Expected)
		%EXP_Expected.show()
	else:
		%EXP_Expected.hide()
	if tile_data.GOLD_Expected >0:
		gold.text = str(tile_data.GOLD_Expected)
		%Gold_Expected.show()
	else:
		%Gold_Expected.hide()
	
	if tile_data.ITEMS_Expected == []:
		%Loot_Expected.hide()
		pass
	else:
		%Loot_Expected.show()
		for item : ItemResource in tile_data.ITEMS_Expected :
			var Item_container = ITEM_CONTAINER.instantiate() as Item_Container
			grid_container.add_child(Item_container)
			Item_container.init(item)
			
		pass
	self.show()
	pass


func Cleanse():
	for child in grid_container.get_children():
		child.queue_free()
	pass
