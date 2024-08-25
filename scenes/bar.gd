extends Window

@onready var notes = preload("res://scenes/notes.tscn")
@onready var clock = preload("res://scenes/clock.tscn")
@onready var main := get_parent()

var has_border = true
var is_transparence = false

func _on_close_requested():
	get_tree().quit()


func _on_border_pressed():
	has_border = !has_border
	borderless = has_border
	size = Vector2(360, 50)


func _on_transparency_pressed():
	is_transparence = !is_transparence
	get_viewport().transparent_bg = is_transparence
	$"Background".visible = !is_transparence


func _on_git_hub_pressed():
	
	OS.shell_open("https://github.com")


func _on_notes_pressed():
	var notes_inste = notes.instantiate()
	add_child(notes_inste)


func _on_exit_pressed():
	main.show_launcher()
	queue_free()


func _on_ai_pressed():
	
	OS.shell_open("https://chatgpt.com")


func _on_clock_pressed():
	var clock_inste = clock.instantiate()
	add_child(clock_inste)
