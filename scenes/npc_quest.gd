extends Control

signal quest_menu_closed

var quest1_active = false
var quest1_completed = false
var sandle = 0


func check_quest():
	if quest1_active:
		if sandle == 1:
			if Input.is_action_just_pressed("quest"):
				print("quest1 completed")
				quest1_active = false
				quest1_completed = true
				play_finish_quest_anim()


func quest1_chat():
	if quest1_completed == false:
		if quest1_active == false:
			$quest1_ui.visible = true 
			print("printing quest ui")
	
func next_quest():
	if !quest1_completed:
		quest1_chat()
	#elif !quest2_completed
	else:
		$no_quest.visible = true
		await get_tree().create_timer(3).timeout
		$no_quest.visible = false




func _on_yes_button_1_pressed():
	quest1_active = true
	print("quest1_active = true")
	$quest1_ui.visible = false
	$quest1_active.visible = true
	await get_tree().create_timer(3).timeout
	$quest1_active.visible = false
	sandle = 0
	emit_signal("quest_menu_closed")
<<<<<<< HEAD
	
=======
	$AudioStreamPlayer.play()
>>>>>>> 8451701eed52c14cbf30aa51c3df27af1621a685


func _on_no_button_1_pressed():
	$quest1_ui.visible = false
	quest1_active = false
	emit_signal("quest_menu_closed")
	
func sandle_collected():
		sandle += 1
		
func play_finish_quest_anim():
	$quest1_finished.visible = true
	await get_tree().create_timer(3).timeout
	$quest1_finished.visible = false
