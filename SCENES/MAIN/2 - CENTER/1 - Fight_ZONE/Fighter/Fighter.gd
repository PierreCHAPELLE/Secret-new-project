extends Node2D
class_name Fighter
signal ending_moving()

enum {
	ATTACK_SPEED = 1,
	PLACEMENT_SPEED = 2,
	
}

@export var Projectile_Visual : Array[Texture2D]
@export var row_y : Control



@onready var atk_label: Label = %"ATK Value"
@onready var hp_label: Label = %"HP Value"
@onready var sprite_2d: TextureRect =%Sprite2D

var Field_Index : float
var current_fight_pos : Vector2
var alive : bool = true
var Fighter_Current_Stat = CurrentFighterResource

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


func Calculate_damage()->int:
	var dmg :int = Fighter_Current_Stat.ATK
	if Fighter_Current_Stat.attack_type == FighterResource.ATTACK_TYPE.HEAL:
		return -dmg
	
	return dmg

func Take_Dmg(attacker:Fighter):
	Fighter_Current_Stat.HP -= attacker.Calculate_damage()
	Fighter_Current_Stat.HP = clamp(Fighter_Current_Stat.HP, 0, Fighter_Current_Stat.MAX_HP)
	update_ui()
	pass

func update_ui():
	hp_label.text = str(Fighter_Current_Stat.HP)


func move_to(pos: Vector2, back: bool = false) -> void:
	is_avaible = false
	tween = create_tween()
	tween.tween_property(self, "global_position", pos, 1.0)
	await tween.finished
	if back:
		tween = create_tween()
		tween.tween_property(self, "global_position", current_fight_pos, 1.0)
		await tween.finished
		pass
	is_avaible = true
	pass


func choose_destination(cible:Fighter,current_turn :int)->Vector2:
	var parent :Pool = get_parent() 
	var result : Vector2
	if current_turn ==0 and cible.Fighter_Current_Stat.ATTACK_TYPE == FighterResource.ATTACK_TYPE.CLOSE:
		if parent.Alignement == Pool.ALIGNEMENT.ALLY:
			result = Vector2(cible.get_parent().position.y,self.position.y)
			pass
		else:
			result = Vector2(parent.position.y,self.position.y)
			pass
	else:
		result = cible.get_parent().get_child(0).position
	return result


func Do_Action(cible:Fighter,current_turn:int):
	var destination = choose_destination(cible,current_turn)
	match Fighter_Current_Stat.attack_type:
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
	cible.Take_Dmg(self)
	pass

func Do_Action_range(cible:Fighter, destination : Vector2):
	await fire_at(destination,Fighter_Current_Stat.attack_type)
	cible.Take_Dmg(self)
	pass

func Do_Action_heal(cible:Fighter, destination : Vector2):
	var heal_target : Fighter
	if is_in_group("ALLIES"):
		heal_target = get_tree().get_nodes_in_group("AllIES").pick_random()
	else:
		heal_target = get_tree().get_nodes_in_group("ENEMIES").pick_random()
	await fire_at(heal_target.global_position,Fighter_Current_Stat.attack_type)
	heal_target.Take_Dmg(self)
	pass

func Do_Action_magic(cible:Fighter, destination : Vector2):
	await fire_at(destination,Fighter_Current_Stat.ATTACK_TYPE)
	cible.Take_Dmg(self)
	pass






func fire_at(pos: Vector2, type: bool = false) -> void:
	is_avaible = false
	tween = create_tween()
	
	%projectile.set_visible(true)
	%projectile.global_position = self.global_position
	
	if is_in_group("ALLIES"):
		%projectile.set_flip_h(false)
		%projectile.set_flip_v(false)
	else:
		%projectile.set_flip_h(true)
		%projectile.set_flip_v(true)
	
	match type:
		FighterResource.ATTACK_TYPE.RANGE:
			%projectile.texture = Projectile_Visual[0]
		FighterResource.ATTACK_TYPE.HEAL:
			%projectile.texture = Projectile_Visual[1]
		FighterResource.ATTACK_TYPE.MAGIC:
			%projectile.texture = Projectile_Visual[2]
	
	tween.tween_property(%projectile,"global_position", pos, 1.0)
	await tween.finished
	%projectile.set_visible(false)
	
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
