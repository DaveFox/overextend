extends CanvasLayer

signal start_game

func _ready():
	pass

func _process(delta):
	pass

func showMessage(text):
	$Message.text = text
	$Message.show()
	$"Message Timer".start()

func _on_start_button_pressed():
	print('start pressed')
	$Title.hide()
	$VBoxContainer.hide()
	start_game.emit()
	hide()
	get_tree().change_scene_to_file("res://Main.tscn")

func _on_message_timer_timeout():
	$Message.hide()


func _on_quit_button_pressed():
	get_tree().quit()
