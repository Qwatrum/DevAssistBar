extends Node

@onready var launcher = preload("res://scenes/launcher.tscn")

func _ready():
	get_viewport().transparent_bg = true
	var launcher_inste = launcher.instantiate()
	add_child(launcher_inste)
