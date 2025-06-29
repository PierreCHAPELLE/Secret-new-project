@icon("uid://dc4tnies86reb")
extends Control
class_name GAME



func _ready() -> void:
	Util.Game = self



func End_Game():
	%ENDING_SCREEN.end()
