extends VBoxContainer
class_name Squad_ZONE

var DISPLAYED_FIGHTER = GlobalsVar.DISPLAYED_FIGHTER
var DISPLAYED_HERO = GlobalsVar.DISPLAYED_HERO


func Generated_Displayed_Fighter(fighter_data :CurrentFighterResource):
	var diplayed_fighter = DISPLAYED_FIGHTER.instantiate() as Fighter_Container
	self.add_child(diplayed_fighter)
	diplayed_fighter.init(fighter_data)
	return


func Generated_Displayed_hero(fighter_data :Player_CurrentFighterResource):
	var diplayed_fighter = DISPLAYED_HERO.instantiate() 
	self.add_child(diplayed_fighter)
	diplayed_fighter.init(fighter_data)
	return

func _on_fighter_up_requested(fighter : Fighter_Container):
	var index = get_children().find(fighter)
	if index > 0:
		move_child(fighter, index - 1)
	SignalBus.fighter_order_has_been_changed.emit()

func _on_fighter_down_requested(fighter : Fighter_Container):
	var index = get_children().find(fighter)
	if index < get_child_count() - 1:
		move_child(fighter, index + 1)
	SignalBus.fighter_order_has_been_changed.emit()
