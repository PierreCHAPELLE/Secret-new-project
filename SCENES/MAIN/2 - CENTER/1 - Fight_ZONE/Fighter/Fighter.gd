extends Node2D
class_name Fighter
signal ending_moving()

enum {
	ATTACK_SPEED = 1,
	PLACEMENT_SPEED = 2,
	
}

@export var move_curve : Curve
@export var row_y : Control

@onready var atk_label: Label = %"ATK Value"
@onready var hp_label: Label = %"HP Value"
@onready var sprite_2d: TextureRect =%Sprite2D

var Field_Index : float
var current_fight_pos : Vector2
var alive : bool = true
var Fighter_Current_Stat = FighterResource

var tween :Tween
var is_avaible := true

func init(fighter_resource: FighterResource) -> void:
	Fighter_Current_Stat = fighter_resource
	atk_label.text = str(fighter_resource.ATK)
	hp_label.text = str(fighter_resource.HP)
	sprite_2d.texture = fighter_resource.visual
	print("j'existe")
	var parent : Pool = get_parent()
	if parent.Alignement == Pool.ALIGNEMENT.ALLY:
		add_to_group("ALLIES")
	else:
		add_to_group("ENEMIES")
		
	pass


func Attack()->int:
	var dmg :int
	return dmg

func Take_Dmg(fighter_resource:Fighter):
	fighter_resource.HP -= fighter_resource.atk
	hp_label.text = str(fighter_resource.HP)
	pass




#var destination_point : Vector2
#var Should_i_move = [false,false,null]
#func move_to(pos: Vector2,back : bool)->void:
	#tween.is_running()
	#destination_point = pos
	#var old_pos = Vector2(global_position.x,global_position.y)
	#Should_i_move = [true,back,old_pos]
	#pass
#func _process(delta: float) -> void:
	##if Should_i_move[0]:
		##global_position.y = lerp(global_position.y,destination_point.y, 0.1)
		##if global_position.y == destination_point.y:
			##if Should_i_move[1]:
				##destination_point.y = Should_i_move[2]
				##Should_i_move[1] = false
			##else:
				##[false,false,null]
				##ending_moving.emit()
	#pass

func move_to(pos: Vector2, back: bool = false) -> void:
	is_avaible = false
	tween = create_tween()
	tween.tween_property(self, "position", pos, 1.0)
	await tween.finished
	if back:
		tween = create_tween()
		tween.tween_property(self, "position", current_fight_pos, 1.0)
		await tween.finished
		pass
	is_avaible = true
	pass


func Do_Action(cible:Fighter, destination : Vector2,current_turn):
	match Fighter_Current_Stat.ATTACK_TYPE:
		FighterResource.ATTACK_TYPE.CLOSE:
			if current_turn != 0:
				return
			else:
				Do_Action_close(cible, destination)
			pass
		FighterResource.ATTACK_TYPE.RANGE:
			Do_Action_range(cible, destination)
			pass
		FighterResource.ATTACK_TYPE.HEAL:
			Do_Action_heal(cible, destination)
		FighterResource.ATTACK_TYPE.MAGIC:
			Do_Action_magic(cible, destination)
			pass
	pass

func Do_Action_close(cible:Fighter, destination : Vector2):
	await move_to(destination,true)
	cible.Take_Dmg(Fighter_Current_Stat.ATK)
	pass

func Do_Action_range(cible:Fighter, destination : Vector2):
	await move_to(destination,true)
	cible.Take_Dmg(Fighter_Current_Stat.ATK)
	pass

func Do_Action_heal(cible:Fighter, destination : Vector2):
	var heal_target : Fighter
	if is_in_group("ALLIES"):
		get_tree().get_nodes_in_group("AllIES")
	pass

func Do_Action_magic(cible:Fighter, destination : Vector2):
	
	pass
