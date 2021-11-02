extends "res://Scripts/enemy.gd"


func _physics_process(delta):
	
	if state == STATE_WALKING:
		linear_velocity += GRAVITY_VEC * delta
		linear_velocity.x = direction * WALK_SPEED
		linear_velocity = move_and_slide(linear_velocity, FLOOR_NORMAL)	
		
		# Kollar om det finns golv eller väggar om inte/finns vänd riktning
		if not detect_floor_left.is_colliding() or detect_wall_left.is_colliding():
			direction = 1
			$rolling.play("rollingR")
		if not detect_floor_right.is_colliding() or detect_wall_right.is_colliding():
			direction = -1
			$rolling.play_backwards("rollingR")
