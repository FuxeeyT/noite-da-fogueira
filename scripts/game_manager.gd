extends Node

var score = 0
var player_health = 3
var fire_level = 100.0
var game_time = 0.0 # Segundos passados
var is_game_over = false

func reset_game():
	score = 0
	player_health = 3
	fire_level = 100.0
	game_time = 0.0
	is_game_over = false

func add_score(amount):
	score += amount

func take_damage(amount):
	player_health -= amount
	if player_health <= 0:
		game_over()

func game_over():
	is_game_over = true
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
