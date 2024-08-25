extends Window

var timer_duration = 0

func _ready():
	$"TimeUntil".hide()

func _process(delta):
	var time = Time.get_time_dict_from_system()
	var hour = time["hour"]
	var minute = time["minute"]
	var second = time["second"]
	
	$"Time".text = str(int(hour)).pad_zeros(2) + ":" + str(int(minute)).pad_zeros(2) + ":" + str(int(second)).pad_zeros(2)



func _on_close_requested():
	queue_free()


func _on_create_pressed():
	if timer_duration == 0:
		timer_duration = $"SpinBox".value
		$"TimeUntil".show()
		$"SpinBox".hide()
		$"Timer".wait_time = timer_duration*60
		$"Timer".start()
		
		var time = Time.get_time_dict_from_system()
		var hour = time["hour"]
		var minute = time["minute"]
		var second = time["second"]
		
		var total_sec = hour * 3600 + minute * 60 + second + timer_duration * 60
		total_sec = int(total_sec)
		hour = total_sec / 3600 % 24
		minute = total_sec / 60 % 60
		second = total_sec % 60
		
		$"TimeUntil".text = "Timer at\n"+str(int(hour)).pad_zeros(2) + ":" + str(int(minute)).pad_zeros(2) + ":" + str(int(second)).pad_zeros(2)
		$"Create".text = "Stop timer"
	else:
		timer_duration = 0
		$"Timer".stop()
		$"TimeUntil".hide()
		$"SpinBox".show()
		$"SpinBox".value = 1
		$"AlarmSound".stop()


func _on_timer_timeout():
	$"TimeUntil".text = "Time reached!"
	$"AlarmSound".play()
	


func _on_audio_stream_player_finished():
	$"AlarmSound".play()
