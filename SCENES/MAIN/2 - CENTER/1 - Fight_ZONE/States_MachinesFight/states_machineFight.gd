extends StatesMachine
class_name StatesMachineFight
 ##Parent var
#initial_state : State
#entity : Node2D
#current_state : State
#states: Dictionary = {}



func _ready():
	super()


func _process(delta):
	super(delta)
	pass

func _physics_process(delta):
	super(delta)
	pass

func on_child_transition(state, new_state_name):
	super(state, new_state_name)
	pass
