extends StateFight
class_name StateFightAwait_FIGHT

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
	Transitioned.emit(self, "init_FIGHT")
	pass
