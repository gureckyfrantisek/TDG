extends CharacterBody2D
class_name Unit

# Common params to override
@export var movement_speed = 100
@export var max_health = 100
var current_health = max_health # max health and health are used for health bar
@export var damage = 20
@export var attack_cooldown = 5 # in seconds
@export var input_cooldown = 10 # in seconds
var is_moving = true
var can_attack = true

# Movement management
@export_enum("left", "right") var side = "left"

var moving = true
var direction = 1

func _ready():
	if side == "left":
		direction = 1
	else:
		direction = -1
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.modulate = Color.RED
		
	$AnimatedSprite2D.play("moving")

func _physics_process(delta):
	if movement_speed == null or direction == null:
		return
	position.x += delta * movement_speed * direction
