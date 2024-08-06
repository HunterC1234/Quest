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
	#if quest 2 active.. etc.
	


func quest1_chat():
	$quest1_ui.visible - true
	
func next_quest():
	if !quest1_completed:
		quest1_chat()
	#elif !quest2_completed
	else:
		$no_quest.visible = true
		await get_tree()




func _on_yes_button_1_pressed():
	$quest1_ui.visible = false
	quest1_active = true
	sandle = 0
	emit_signal("quest_menu_closed")


func _on_no_button_1_pressed():
	$quest1_ui.visible = false
	quest1_active = false
	emit_signal("quest_menu_closed")
