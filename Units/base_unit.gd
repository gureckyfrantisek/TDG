extends CharacterBody2D
class_name Unit

# Common params to override
@export var movement_speed = 100

# Movement management
@export_enum("left", "right") var side = "left"

var moving = true
var direction = 1

func _ready():
	if side == "left":
		direction = 1
	else:
		direction = -1
	
	if side == "right":
		$Sprite2D.modulate = Color.RED

func _physics_process(delta):
	if movement_speed == null or direction == null:
		return
	position.x += delta * movement_speed * direction
