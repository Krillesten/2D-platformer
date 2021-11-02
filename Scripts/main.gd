extends Node2D

onready var player = get_node("player")
onready var time = get_node("Timer")

func _ready():
	# Gömmer popup ruta
	get_tree().set_pause(false)
	get_node("GUI/Win_scene/Button").hide()
	get_node("GUI/Goal_scene/Button").hide()
	set_process(true)
	
# Möjlighet att pausa spel
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_node("GUI/Goal_scene/Button").show()
		$player/footsound.stop()
		get_tree().set_pause(true)

func _process(delta):
	var score = player.score
	var lives = player.lives
	var time_left = time.get_time_left()
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	get_node("GUI/score").set_text("Score: " + str(score))
	get_node("GUI/Win_scene/Button/show_score").set_text("Score: " + str(score))
	get_node("GUI/Goal_scene/Button/show_score").set_text("Score: " + str(score))
	get_node("GUI/lives").set_text("Lives: " + str(lives))
	get_node("GUI/time").set_text("Time: " + str(int(time_left)))
	get_node("GUI/FPS").set_text("FPS: " + str(int(fps)))
	
		# Om spelaren förlorat allt liv
	# Visa pop up rutan för game over och pausa spel
	
	if $player.lives <= 0:
		$player/footsound.stop()
		get_tree().set_pause(true)
		get_node("GUI/Goal_scene/Button").show()
		
	if $player.end == true:
		$player/footsound.stop()
		get_tree().set_pause(true)
		get_node("GUI/Win_scene/Button").show()
	

# pausar spel när tiden går ut 
func _on_Timer_timeout():
	get_node("GUI/Goal_scene/Button").show()
	get_tree().set_pause(true)
