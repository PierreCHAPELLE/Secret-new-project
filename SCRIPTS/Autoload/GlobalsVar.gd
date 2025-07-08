extends Node

#var MAIN_Tileset : ready de map
var MAIN_Tileset : TileSet


var GOLD_Owned : int = 0
var current_selected_tile : Array
var dialog_is_running : bool = false
var fight_is_running : bool = false
var Fight_Zone : Fight_ZONE
var Player_Is_Dead := false

var default_losing_dial : DialogueResource = preload("uid://c28dmoutvwj8m")



#region DATA_SCENE
var DISPLAYED_FIGHTER = preload("uid://ddgm8cwaxuv0d")
var DISPLAYED_HERO = preload("uid://dvnum3uveltg")
var FIGHTER = preload("uid://bvfvfuyp0w2mo")
var HP_INDICATEUR = preload("uid://bi35m6irf0n7k")
var ITEM_CONTAINER = preload("uid://v52yts8bhqal")
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
