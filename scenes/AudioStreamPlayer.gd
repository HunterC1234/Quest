extends AudioStreamPlayer

@onready var asp = $"."

var vol = 0  

func _ready():
	AudioServer.set_bus_volume_db(0,vol)
	
	
	

func _process(delta):
	pass
