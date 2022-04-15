extends Node2D


export var points:int = 1


func _enter_tree():
	$Label.text = "%d" % points
