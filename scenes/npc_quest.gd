extends Control

signal quest_menu_closed

var quest1_active = false
var quest1_completed = false
var found_robe = false

func _process(delta):
	if quest1_active:
		if found_robe:
			print("quest1")
			quest1_active = false
			quest1_completed = true


func quest1_chat():
	$quest1_ui.visible = true
	
	

func _on_yes_button_pressed():
	$quest1_ui.visible = false
	quest1_active = true
	found_robe = false
	emit_signal("quest_menu_closed")



func _on_no_button_pressed():
	$quest1_ui.visible = false
	quest1_active = false
	emit_signal("quest_menu_closed")
