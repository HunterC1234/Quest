extends Control

signal quest_menu_closed

var quest1_active = false
var quest1_completed = false
var sandle = 0
 
func _process(delta):
	if quest1_active:
		if sandle == 1:
			print("quest1 completed")
			quest1_active = false
			quest1_completed = true
			play_finish_quest_anim()
	#if quest 2 active.. etc.
	


func quest1_chat():
	$quest1_ui.visible = true 
	
func next_quest():
	if !quest1_completed:
		quest1_chat()
	#elif !quest2_completed
	else:
		$no_quest.visible = true
		await get_tree().create_timer(3).timeout
		$no_quest.visible = false




func _on_yes_button_1_pressed():
	$quest1_ui.visible = false
	quest1_active = true
	sandle = 0
	emit_signal("quest_menu_closed")
	$AudioStreamPlayer.play()


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
