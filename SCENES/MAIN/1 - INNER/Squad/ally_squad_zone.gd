@icon("uid://hosqbejfduy5")
extends  Squad_ZONE
class_name Ally_Squad_ZONE


@export var Hero_DATA : FighterResource


func _ready() -> void:
	Generated_Displayed_Fighter(Hero_DATA)
	SignalBus.get_new_fighter.connect(_get_new_fighter)
	pass



func _get_new_fighter(list_of_acquired_fighter : Array[FighterResource]):
	for fighter in list_of_acquired_fighter:
		Generated_Displayed_Fighter(fighter)
		pass
