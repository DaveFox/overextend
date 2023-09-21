extends Node

func _ready():
	pass

func _process(delta):
	if(Input.is_action_just_released("escape_pressed")):
		if($Menu.visible != true):
			$Menu.show()
		else:
			$Menu.hide()


func new_game():
	print('new game')
	$Player.start($StartPosition.position)

