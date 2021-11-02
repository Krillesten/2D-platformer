extends Node
####
#### GLOBALA VÄRDEN OCH FUNKTIONER
####

var lives = 3
var score = 0

###
### Spara och ladda funktioner
###
func save_highscore(content):
	var file = File.new()
	file.open("user://save_game.dat", file.WRITE)
	file.store_var(content)
	file.close()

func load_highscore():
	var file = File.new()
	file.open("user://save_game.dat", file.READ)
	var content = file.get_var()
	file.close()
	return content
