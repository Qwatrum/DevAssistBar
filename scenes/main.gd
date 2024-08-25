extends Node

@onready var bar = preload("res://scenes/bar.tscn")
@onready var launcher = preload("res://scenes/launcher.tscn")

func _ready():
	get_viewport().transparent_bg = true
	var launcher_inste = launcher.instantiate()
	add_child(launcher_inste)

func add_bar():
	var bar_inste = bar.instantiate()
	add_child(bar_inste)
