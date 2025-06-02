extends StateFight
class_name StateFightInit_FIGHT

func Enter():
	super()

	pass

func Exit():
	super()
	pass

func Update(delta : float):
	super(delta)
	pass

func Physics_Update(delta : float):
	super(delta)
	pass


func _on_fight_zone_start_fight() -> void:
	Transitioned.emit(self, "Start_ROUND")
	pass
