extends Control

var button_type = null


func _on_start_button_pressed():
	button_type = "start"
	$fade_transition.show()
	$fade_transition/Fade_timer.start()
	$fade_transition/AnimationPlayer.play("Fade_out")
	
func _on_quit_pressed():
	get_tree().quit()
 

func _on_fade_timer_timeout():
	if button_type == "start":
		get_tree().change_scene_to_file("res://scenes/world.tscn") 


