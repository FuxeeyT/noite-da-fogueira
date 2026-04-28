extends Control

# Usamos @onready para garantir que o nó já exista antes de acessá-lo
@onready var volume_slider = $VBoxContainer/VolumeSlider

func _ready():
	# Verifica se o slider existe antes de configurar
	if volume_slider:
		var bus_index = AudioServer.get_bus_index("Master")
		volume_slider.value = AudioServer.get_bus_volume_db(bus_index)

func _on_play_button_pressed():
	# GameManager é um AutoLoad, então ele sempre existe
	GameManager.reset_game()
	get_tree().change_scene_to_file("res://scenes/game_world.tscn")

func _on_volume_slider_value_changed(value):
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, value)
	
	# Muta se o volume estiver no mínimo
	if value <= -29:
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)

func _on_quit_button_pressed():
	get_tree().quit()
