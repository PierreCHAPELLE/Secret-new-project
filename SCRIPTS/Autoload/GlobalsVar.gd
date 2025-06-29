extends Node

#var MAIN_Tileset : ready de map
var MAIN_Tileset : TileSet



var current_selected_tile : Array
var dialog_is_running : bool = false
var fight_is_running : bool = false
var Fight_Zone : Fight_ZONE
var Player_Is_Dead := false

#region DATA_SCENE
var DISPLAYED_FIGHTER = preload("uid://ddgm8cwaxuv0d")
var FIGHTER = preload("uid://bvfvfuyp0w2mo")
var  HP_INDICATEUR = preload("uid://bi35m6irf0n7k")
#endregion


#region Enum
enum ALIGNEMENT {ALLY,ENEMY,}
enum  ATTACK_TYPE{CLOSE, RANGE, HEAL, MAGIC,}
enum  BONUS{ARMOR,
	VENOM,
	LIFE_STEAL,
	HP,
	ATK,
	}
#endregion
