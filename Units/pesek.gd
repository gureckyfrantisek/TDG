extends Unit

func _ready():
	movement_speed = 200
	max_health = 50
	damage = 20
	attack_cooldown = 3
	input_cooldown = 10
	super._ready()
