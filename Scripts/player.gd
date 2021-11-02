extends KinematicBody2D

const UP = Vector2(0, -1) # Används vid hoppar funk
export var GRAVITY = 30   # Håller grav värde
export var ACCELERATION = 50 # Håller acc värde
export var MAX_SPEED = 300 # Håller max_speed värde
export var JUMP_HEIGHT = -700 # Håller hoppar värde
var motion = Vector2() # Vecktor för motion/Gå/hoppa

# Inställning för spel score och liv
### Ska flyttas bort från spelar script ###
onready var score = global.score
onready var lives = global.lives
onready var end = false

func _ready():
	set_process_input(true)


func _physics_process(delta):
	
		### CONTROL ###
	if lives > 0:
		motion.y += GRAVITY
		var friction = false
		
		# Gå höger eller vänster annars sätt friction för att få stop på spelaren
		if Input.is_action_pressed("ui_right"):
			$anim.play("run")
			motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
			$anim.flip_h = false
			if $footsound.playing == false:
				$footsound.play()
		elif Input.is_action_pressed("ui_left"):
			$anim.play("run")
			motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
			$anim.flip_h = true
			if $footsound.playing == false:
				$footsound.play()
		else:
			friction = true 
			$anim.play("idle")
			$footsound.stop()
		# Kollar om spelaren är på golvet
		if is_on_floor():
			if Input.is_action_just_pressed("ui_up"):
				motion.y = JUMP_HEIGHT
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.2)
		else:
			if motion.y < 0:
				# ANIMATION
				pass
			else:
				# ANIMATION
				pass
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.1)
		
		motion = move_and_slide(motion, UP) # Tillämpar allt ovan för att gå/hoppa
		

# Om spelaren hoppar på fiende ge poäng och döda fienden
# Om hoppar på lava döda spelaren
func _on_kill_enemy_body_enter( body ):
	if body.get_groups().has("enemies"):
		score += 1
		print(score)
		motion.y = JUMP_HEIGHT
		$pickable.play()
		body.queue_free()
	elif body.get_groups().has("lava"):
		lives -= 3

# Om spelaren går in i fienden så förlorar spelaren 1 liv
# Om går in i lava döda spelaren
func _on_collide_enemy_body_enter( body ):
	if body.get_groups().has("enemies"):
		body.queue_free()
		lives -= 1
	elif body.get_groups().has("lava"):
		lives -= 3

# Kollar om spelaren går in i collectebles/interatives
func _on_collide_enemy_area_enter( area ):
	if area.get_groups().has("beer"):
		area.queue_free()
		score += 1
		$hit_enemie.play()
	if area.get_groups().has("checkpoint"):
		global.save_highscore(score)
		end = true
		
		
		
		
		
		
		
		
		
		
		
		
		
		
