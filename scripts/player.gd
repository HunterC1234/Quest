extends CharacterBody2D

signal sandle_collected

var speed = 100
var current_dir = "none"

@export var inv: Inv

func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	_player_movement(delta)

func _player_movement(_delta):
	
	if Input.is_action_just_pressed("sprint "):
		speed = 130
		print("running")
	if Input.is_action_just_released("sprint "):
		speed = 100
		

	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1: 
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1: 
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	
	if dir == "down":
		anim.flip_h = true
		if movement == 1: 
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")
	if dir == "up":
		anim.flip_h = true 
		if movement == 1: 
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")
			
func collect(item):
	inv.insert(item)
	print("picked up stick")
	emit_signal("sandle_collected")
	
	
func player():
	pass
	

