extends Window

var timer_duration = 0

func _ready():
	$"TimeUntil".hide()

func _process(delta):
	var time = Time.get_time_dict_from_system()
	$"Time".text = str(time["hour"]) + ":" + str(time["minute"]) + ":" + str(time["second"])



func _on_close_requested():
	queue_free()


func _on_create_pressed():
	timer_duration = $"SpinBox".value
	$"TimeUntil".show()
	$"SpinBox".hide()
