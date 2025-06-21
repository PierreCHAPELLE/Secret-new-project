extends Node
class_name Fight_Manager
@onready var states_machine_fight: StatesMachineFight = %StatesMachineFIGHT
@onready var allies_pool: Pool = %Allies_Pool
@onready var enemies_pool: Pool = %Enemies_Pool
@onready var margin_container_meetingpoint: MarginContainer = %MarginContainer_meetingpoint

var first_fighter_in_row_A
var first_fighter_in_row_E

#
#
#func do_actions(fighterA : Fighter, fighterE : Fighter)->void:
	#first_fighter_in_row_A = allies_pool.get_child(0)
	#first_fighter_in_row_E = enemies_pool.get_child(0)
	#if fighterA and fighterE:
		#both_fighter_do_action(fighterA, fighterE)
	#elif fighterA == null and fighterE == null:
		#push_error()
	#else:
		#var solo_fighter = fighterA if fighterA != null else fighterE
		#if solo_fighter.get_parent().Alignement = Pool.ALIGNEMENT.ALLY:
			#solo_fighter.Do_Action(first_fighter_in_row_E),
	#pass
#
#
#
#func both_fighter_do_action(fighterA : Fighter, fighterE : Fighter)->void:
	#first_fighter_in_row_A = allies_pool.get_child(0)
	#first_fighter_in_row_E = enemies_pool.get_child(0)
	#var typeA = fighterA.Fighter_Current_Stat.attack_type
	#var typeE = fighterE.Fighter_Current_Stat.attack_type
	#var  destination : Vector2
	#if states_machine_fight.current_turn == 0:
		#if typeA == FighterResource.ATTACK_TYPE.CLOSE and typeE == FighterResource.ATTACK_TYPE.CLOSE:
			#destination = margin_container_meetingpoint.global_position
			#fighterA.Do_Action(fighterE, destination,0)
			#fighterE.Do_Action(fighterA, destination,0)
			#
		#elif typeA == FighterResource.ATTACK_TYPE.CLOSE:
			#destination = fighterE.global_position
			#fighterA.Do_Action(fighterE, destination,0)
			#fighterE.Do_Action(fighterA, destination,0)
		#
		#elif typeE == FighterResource.ATTACK_TYPE.CLOSE:
			#destination = fighterA.global_position
			#fighterA.Do_Action(fighterE, destination,0)
			#fighterE.Do_Action(fighterA, destination,0)
		#else:
			#fighterA.Do_Action(fighterE, destination,0)
			#fighterE.Do_Action(fighterA, destination,0)
			#pass
		#pass
#
#func single_fighter_do_action(fighter:Fighter):
	#first_fighter_in_row_A = allies_pool.get_child(0)
	#first_fighter_in_row_E = enemies_pool.get_child(0)
#
	#pass
#
#
#
#
#
#
#
#
#
#
##
##func do_actions(fighterA : Fighter, fighterE : Fighter)->void:
	##first_fighter_in_row_A = allies_pool.get_child(0)
	##first_fighter_in_row_E = enemies_pool.get_child(0)
	##if fighterA and fighterE:
		##both_fighter_do_action(fighterA, fighterE)
	##elif fighterA == null and fighterE == null:
		##push_error()
	##else:
		##var solo_fighter = fighterA if fighterA != null else fighterE
		##single_fighter_do_action(solo_fighter)
	##pass
##
##
##
##func both_fighter_do_action(fighterA : Fighter, fighterE : Fighter)->void:
	##first_fighter_in_row_A = allies_pool.get_child(0)
	##first_fighter_in_row_E = enemies_pool.get_child(0)
	##var typeA = fighterA.Fighter_Current_Stat.attack_type
	##var typeE = fighterE.Fighter_Current_Stat.attack_type
	##var  destination : Vector2
	##if states_machine_fight.current_turn == 0:
		##if typeA == FighterResource.ATTACK_TYPE.CLOSE and typeE == FighterResource.ATTACK_TYPE.CLOSE:
			##destination = margin_container_meetingpoint.global_position
			##fighterA.Do_Action(fighterE, destination,0)
			##fighterE.Do_Action(fighterA, destination,0)
			##
		##elif typeA == FighterResource.ATTACK_TYPE.CLOSE:
			##destination = fighterE.global_position
			##fighterA.Do_Action(fighterE, destination,0)
			##fighterE.Do_Action(fighterA, destination,0)
		##
		##elif typeE == FighterResource.ATTACK_TYPE.CLOSE:
			##destination = fighterA.global_position
			##fighterA.Do_Action(fighterE, destination,0)
			##fighterE.Do_Action(fighterA, destination,0)
		##else:
			##fighterA.Do_Action(fighterE, destination,0)
			##fighterE.Do_Action(fighterA, destination,0)
			##pass
		##pass
##
##func single_fighter_do_action(fighter:Fighter):
	##first_fighter_in_row_A = allies_pool.get_child(0)
	##first_fighter_in_row_E = enemies_pool.get_child(0)
##
	##pass
