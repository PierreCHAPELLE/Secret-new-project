@icon("uid://ceuhd5giof8ge")
extends Squad_ZONE
class_name Enemy_Squad_ZONE
func _ready() -> void:
	SignalBus.get_new_fighter.connect(cleanse_bis)
	SignalBus.Dialogue_ended.connect(cleanse)
	

func Generated_EnemySquad_Display(tile_data : CustomTile):
	if tile_data == null: 
		return
	var list_of_fighter_data:Array[FighterResource] = tile_data.Fighter_Resource
	if list_of_fighter_data == []:
		for child in get_children():
			child.queue_free()
	else:
		for fighter in list_of_fighter_data:
			Generated_Displayed_Fighter(fighter)
	return

func cleanse_bis(_list_of_acquired_fighter):
	cleanse()
	pass

func cleanse():
	if GlobalsVar.dialog_is_running == true:
		return
	
	for child in get_children():
			child.queue_free()
