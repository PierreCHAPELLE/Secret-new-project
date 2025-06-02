extends StatesMachine
class_name StatesMachineFight
 ##Parent var
#initial_state : State
#entity : Node2D
#current_state : State
#states: Dictionary = {}

var number_of_turn_by_round : int
var current_turn : int = 0
var current_fighter_a : Fighter
var current_fighter_e : Fighter


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
