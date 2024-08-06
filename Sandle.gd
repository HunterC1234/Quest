extends StaticBody2D

var player = null


func _on_interactable_area_body_entered(body):
	if body.has_method("player"):
		player = body
		playercollect()
		
func playercollect():
	
	
