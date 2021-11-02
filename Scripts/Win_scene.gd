extends Node2D

func _ready():
	pass

func _on_Button_pressed():
	if get_node("Click").playing == false:
		get_node("Click").play()
		yield(get_node("Click"), "finished")
	get_tree().set_pause(false)
	get_node("Button").hide()
	get_tree().change_scene("res://Menu.tscn")
	pass

func _on_Try_again_pressed():
	if get_node("Click").playing == false:
		get_node("Click").play()
		yield(get_node("Click"), "finished")
	get_node("Button").hide()
	get_tree().set_pause(false)
	get_tree().reload_current_scene()
	pass
