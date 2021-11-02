extends KinematicBody2D

# Gravitation
const GRAVITY_VEC = Vector2(0, 900)
const FLOOR_NORMAL = Vector2(0, -1)
const WALK_SPEED = 50
const STATE_WALKING = 0
const STATE_KILLED = 1


var linear_velocity = Vector2()
var direction = -1
var anim=""

# Sätter npc state till walking
var state = STATE_WALKING

onready var detect_floor_left = $Detect_floor_left
onready var detect_floor_right = $Detect_floor_right
onready var detect_wall_left = $Detect_wall_left
onready var detect_wall_right = $Detect_wall_right
	
func _physics_process(delta):
	
	if state == STATE_WALKING:
		linear_velocity += GRAVITY_VEC * delta
		linear_velocity.x = direction * WALK_SPEED
		linear_velocity = move_and_slide(linear_velocity, FLOOR_NORMAL)	
		
		if not detect_floor_left.is_colliding() or detect_wall_left.is_colliding():
			direction = 1
			$Sprite.set_flip_h(true)
		if not detect_floor_right.is_colliding() or detect_wall_right.is_colliding():
			direction = -1
			$Sprite.set_flip_h(false)
		
