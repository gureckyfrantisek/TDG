extends CharacterBody2D
class_name Unit

@export var movement_speed = 100
const max_health = 100
@export var current_health = max_health # max health and health are used for health bar
@export var damage = 20
@export var attack_cooldown = 5 # in seconds
@export var input_cooldown = 10 # in seconds
var is_moving = true
var can_attack = true

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	pass
