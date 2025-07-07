@icon("uid://yfimiig37uft")
extends Resource
class_name CustomTile

@export var Title : String
@export var Dialog : DialogueResource
@export var Fighter_Resource : Array[CurrentFighterResource]

@export var End_Fight_Dialog : DialogueResource
@export var EXP_Expected : int
@export var GOLD_Expected : int
@export var ITEMS_Expected : Array[ItemResource]
