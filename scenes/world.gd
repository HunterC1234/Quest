extends Node2D

func _ready():
	$fadein/AnimationPlayer.play("Fade_in")
	print("called") 
