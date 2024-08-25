extends Window

@onready var main := get_parent()
var bar_opened = false

func _ready():
	$"Buttons".show()
	$"CreditsText".hide()
	$"Back".hide()


func _on_close_requested():
	if bar_opened:
		queue_free()
	else:
		get_tree().quit()


func _on_credits_pressed():
	$"CreditsText".show()
	$"Back".show()
	$"Buttons".hide()


func _on_back_pressed():
	$"Buttons".show()
	$"CreditsText".hide()
	$"Back".hide()


func _on_launch_pressed():
	bar_opened = true
	main.add_bar()
	queue_free()
