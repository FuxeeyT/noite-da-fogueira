extends Control

@onready var score_label = $VBoxContainer/ScoreLabel

func _ready():
	score_label.text = "Pontuação Final: " + str(GameManager.score)

func _on_restart_button_pressed():
	GameManager.reset_game()
	get_tree().change_scene_to_file("res://scenes/game_world.tscn")

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
