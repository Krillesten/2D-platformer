extends Node2D

func _ready():
	get_tree().set_pause(false)
	get_node("Show highscore").set_text("Highscore: " + str(int(global.load_highscore()))) # Skriver ut fps
	pass


func SpelaClick():
	if $Click.playing == false:
		$Click.play()
		yield($Click, "finished")
#
# Fuktioner för knappar
#
func _on_Button_pressed():
		# Går vidare till Level 1
	if $Click.playing == false:
		$Click.play()
		yield($Click, "finished")
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")

# Växlar mellan fullscreen och window mode
func _on_fullscreen_pressed():
	if OS.is_window_fullscreen() == false:
		SpelaClick()
		OS.set_window_fullscreen(true)
		$fullscreen.set_text("Fullscreen On")
	elif OS.is_window_fullscreen() == true:
		SpelaClick()
		OS.set_window_fullscreen(false)
		$fullscreen.set_text("Fullscreen Off")
		

# Avslutar spel helt
func _on_Quit_pressed():
	if $Click.playing == false:
		$Click.play()
		yield(get_tree().create_timer(0.1), "timeout")
	get_tree().quit()
	pass
