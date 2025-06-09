extends StateFight
class_name StateFightEnd_FIGHT
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var fight_state: Label = %Fight_State




func Enter():
	super()
	%ProgressBar.set_visible(false)
	%Fight_State.set_visible(false)
	Transitioned.emit(self, "await_FIGHT")
	pass

func Exit():
	super()
	GlobalsVar.Fight_begun = false
	pass

func Update(delta : float):
	super(delta)
	pass

func Physics_Update(delta : float):
	super(delta)
	pass
