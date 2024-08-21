extends StaticBody2D


func _ready():
	fallfromtree()

func fallfromtree():
	$AnimationPlayer.play("falling_from_tree")
	await get_tree().create_timer(1.5).timeout
	$AnimationPlayer.play("fade")
	print("plus 1 apple")
	await get_tree().create_timer(0.3).timeout
	queue_free()

