extends Control

func _ready():
	# Simula uma tela de loading/splash
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
