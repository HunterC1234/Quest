extends CharacterBody2D

var speed = 100

var man_in_range = false

var player_state

func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	if man_in_range == true:
		if Input.is_action_pressed("chat"):
			print("chatting")
			DialogueManager.show_example_dialogue_balloon(load("res://scripts/main.dialogue"), "main")
			return
		
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
		
		velocity = direction * speed
		move_and_slide()
		
		play_anim(direction)
		
func  play_anim(direction):
	var anim = $AnimatedSprite2D
	
	if player_state == "idle":
		$AnimatedSprite2D.play("front_idle")
	
		
	if player_state == "walking":
		if direction.y == -1:
			$AnimatedSprite2D.play("back_walk")
		if direction.x == 1:
			anim.flip_h = false
			$AnimatedSprite2D.play("side_walk")
		if direction.y == 1:
			$AnimatedSprite2D.play("front_walk")
		if direction.x == -1:
			anim.flip_h = true
			$AnimatedSprite2D.play("side_walk")

var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")




func _on_detection_area_body_entered(body):
	if body.has_method("old_man"):
		man_in_range = true


func _on_detection_area_body_exited(body):
	if body.has_method("old_man"):
		man_in_range = false
