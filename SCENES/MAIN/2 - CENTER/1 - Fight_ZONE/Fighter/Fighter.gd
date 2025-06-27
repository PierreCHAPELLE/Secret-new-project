extends Node2D
class_name Fighter


const  HP_INDICATEUR = preload("uid://bi35m6irf0n7k")


#pas utiliser pour l'instant
@warning_ignore("unused_signal")
signal ending_moving()

enum {
	ATTACK_SPEED = 1,
	PLACEMENT_SPEED = 2,
	
}

@export var Projectile_Visual : Array[Texture2D]
@export var Dead_Visual : Texture2D
@export var row_y : Control



@onready var atk_label: Label = %"ATK Value"
@onready var hp_label: Label = %"HP Value"
@onready var sprite_2d: TextureRect =%Sprite2D

var Field_Index : float
var current_fight_pos : Vector2
var alive : bool = true
var Fighter_Current_Stat = CurrentFighterResource

var tween :Tween
var _is_available := true

var Placed := false

func init(fighter_resource: FighterResource) -> void:
	Fighter_Current_Stat = fighter_resource
	atk_label.text = str(fighter_resource.ATK)
	hp_label.text = str(fighter_resource.HP)
	sprite_2d.texture = fighter_resource.visual
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
	#print("je suis :" + Fighter_Current_Stat.name + "\n" +
		#"attaqué par : " + attacker.Fighter_Current_Stat.name + "\n"+
		#"J'ai : " + str(Fighter_Current_Stat.HP)+"hp" + "\n"+
		#"je vais prendre :" + str(attacker.Calculate_damage()) + "damag"+ "\n\n"
		#)
	var dmg : int = attacker.Calculate_damage()
	await generate_hp_indicateur(dmg).finished
	Fighter_Current_Stat.HP -= dmg
	Fighter_Current_Stat.HP = clamp(Fighter_Current_Stat.HP, 0, Fighter_Current_Stat.MAX_HP)
	update_ui()
	pass
func generate_hp_indicateur(dmg)->Hp_Indicateur:
	var hp_ind = HP_INDICATEUR.instantiate() as Hp_Indicateur
	%Indicateur_Spawn.add_child(hp_ind)
	hp_ind.init(dmg)
	return hp_ind

func generate_cant_attack()->Hp_Indicateur:
	var hp_ind = HP_INDICATEUR.instantiate() as Hp_Indicateur
	%Indicateur_Spawn.add_child(hp_ind)
	hp_ind.init_cant_attack()
	return hp_ind

func update_ui():
	hp_label.text = str(Fighter_Current_Stat.HP)
	if Fighter_Current_Stat.HP == 0:
		sprite_2d.texture = Dead_Visual


func move_to(pos: Vector2, back: bool = false, spd := 1.00, back_spd:=1.00) -> void:
	_is_available = false
	tween = create_tween()
	tween.tween_property(self, "position", pos, spd)
	await tween.finished
	if back:
		tween = create_tween()
		tween.tween_property(self, "position", current_fight_pos, back_spd)
		await tween.finished
		pass
	_is_available = true
	Placed = true
	pass


func choose_destination(cible:Fighter,current_turn :float)->Vector2:
	var parent :Pool = get_parent() 
	var result : Vector2
	if current_turn == 0 and cible.Fighter_Current_Stat.attack_type == FighterResource.ATTACK_TYPE.CLOSE:
		if parent.Alignement == Pool.ALIGNEMENT.ALLY:
			result = Vector2(parent.get_parent().size.x,self.position.y)
			pass
		else:
			result = Vector2(parent.position.x,self.position.y)
			pass
	else:
		result = cible.get_parent().get_child(0).global_position
	return result


func Do_Action(cible:Fighter,current_turn:int):
	var destination = choose_destination(cible,current_turn)
	match Fighter_Current_Stat.attack_type:
		FighterResource.ATTACK_TYPE.CLOSE:
			if current_turn != 0:
				await generate_cant_attack().finished
				Placed = true
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
	await move_to(destination,true,0.5)
	cible.Take_Dmg(self)
	pass

func Do_Action_range(cible:Fighter, destination : Vector2):
	await fire_at(destination,Fighter_Current_Stat.attack_type)
	cible.Take_Dmg(self)
	Placed= true
	pass

func Do_Action_heal(_cible:Fighter, _destination : Vector2):
	var heal_target : Fighter
	if is_in_group("ALLIES"):
		heal_target = get_tree().get_nodes_in_group("ALLIES").pick_random()
	else:
		heal_target = get_tree().get_nodes_in_group("ENEMIES").pick_random()
		#print(heal_target.Fighter_Current_Stat.name)
	await fire_at(heal_target.global_position,Fighter_Current_Stat.attack_type)
	heal_target.Take_Dmg(self)
	Placed= true
	pass

func Do_Action_magic(cible:Fighter, destination : Vector2):
	await fire_at(destination,Fighter_Current_Stat.attack_type)
	cible.Take_Dmg(self)
	Placed= true
	pass






func fire_at(pos: Vector2, type: FighterResource.ATTACK_TYPE) -> void:
	_is_available = false
	tween = create_tween()
	
	%projectile.set_visible(true)
	%projectile.position = Vector2.ZERO
	
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
	#print("pos" + str(pos))
	tween.tween_property(%projectile,"global_position", pos, 0.5)
	await tween.finished
	%projectile.set_visible(false)
	
	pass
