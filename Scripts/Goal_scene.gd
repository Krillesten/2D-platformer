extends Node2D

func _ready():
	var player = "res://Scenes/Player/player.tscn"
	set_process_input(true)

func SpelaClick():
	if $Click.playing == false:
		$Click.play()
		yield($Click, "finished")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_node("Button").hide()
		get_tree().set_pause(false)

# Går tillbaka till menyn
func _on_Button_pressed():
	if get_node("Click").playing == false:
		get_node("Click").play()
		yield(get_node("Click"), "finished")
	get_tree().set_pause(false)
	get_node("Button").hide()
	get_tree().change_scene("res://Menu.tscn")
	pass

# Laddar om Scenen
func _on_Try_again_pressed():
	if get_node("Click").playing == false:
		get_node("Click").play()
		yield(get_node("Click"), "finished")
	get_node("Button").hide()
	get_tree().set_pause(false)
	get_tree().reload_current_scene()
	pass

# Fortsätt att spela
func _on_Continue_pressed():
	if get_node("Click").playing == false:
		get_node("Click").play()
		yield(get_node("Click"), "finished")
	get_node("Button").hide()
	get_tree().set_pause(false)

