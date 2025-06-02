extends Node
class_name State

signal Transitioned 

@export var entity : Node

func Enter():
	pass

func Exit():
	pass

func Update(_delta : float):
	pass

func Physics_Update(_delta : float):
	pass



func fix_error():
	Transitioned.emit("pour corriger une erreur",self)
	pass
