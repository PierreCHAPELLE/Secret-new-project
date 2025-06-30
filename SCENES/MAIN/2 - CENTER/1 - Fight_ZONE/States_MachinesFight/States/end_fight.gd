extends StateFight
class_name StateFightEnd_FIGHT
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var fight_state: Label = %Fight_State




func Enter():
	super()
	%ProgressBar.set_visible(false)
	%Fight_State.set_visible(false)
	Update_dead_Ally()
	Cleanse_Pool()
	launch_EndFight_Dialogue(GlobalsVar.current_selected_tile[Maps.ENUM_SELECTED_TILE.TILEDATA])
	
	%AnimationPlayer.play("RESET")
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


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	GlobalsVar.fight_is_running = false
	Transitioned.emit(self, "await_FIGHT")
	pass # Replace with function body.



func launch_EndFight_Dialogue(CurrentTileSelected : TileData):
	var tile_custom_ressource: CustomTile = Util.data_to_resource(CurrentTileSelected)
	SignalBus.Launch_EndFight_Dialogue.emit(tile_custom_ressource.End_Fight_Dialog, "start")




func Update_dead_Ally()-> void:
	for child : Fighter_Container in fight_zone.allies_Squad.get_children():
		if child.Fighter_Current_Stat.HP == 0:
			child.queue_free()




func Cleanse_Pool()-> void:
	for child : Fighter in FightManager.Ally_Pool.get_children():
		if child.alive == false:
			child.queue_free()
	for child : Fighter in FightManager.Enemy_Pool.get_children():
		if child.alive == false:
			child.queue_free()
