extends Node2D

@onready var pause_menu = $CanvasLayer/PauseMenu
@onready var player = $Player
@onready var campfire = $Campfire
@onready var items_container = $Items

@export var wood_spawn_interval = 3.0
@export var wood_spawn_amount = 3

var collectible_scene = preload("res://prefabs/collectible.tscn")
var time_since_last_spawn = 0.0

func _ready():
	# O diálogo é gerenciado pela cena
	pass

func _process(delta):
	if not get_tree().paused:
		GameManager.fire_level -= 2.0 * delta
		GameManager.game_time += delta
		
		# Spawn de madeira
		time_since_last_spawn += delta
		if time_since_last_spawn >= wood_spawn_interval:
			spawn_wood()
			time_since_last_spawn = 0.0
		
		if GameManager.fire_level <= 0:
			GameManager.game_over()
			
		if GameManager.game_time >= 300.0:
			win_game()

func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()

func toggle_pause():
	if pause_menu:
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		pause_menu.visible = new_pause_state

func spawn_wood():
	# Define área de spawn (floresta, não no centro)
	var spawn_radius_min = 150.0
	var spawn_radius_max = 350.0
	
	for i in range(wood_spawn_amount):
		var angle = randf() * TAU
		var radius = randf_range(spawn_radius_min, spawn_radius_max)
		var spawn_pos = campfire.global_position + Vector2(cos(angle), sin(angle)) * radius
		
		# Verifica se está dentro dos limites do mapa
		if spawn_pos.x > 50 and spawn_pos.x < 1230 and spawn_pos.y > 50 and spawn_pos.y < 670:
			var wood_type = "stick" if randf() > 0.3 else "log"
			var collectible = collectible_scene.instantiate()
			collectible.global_position = spawn_pos
			collectible.item_type = wood_type
			items_container.add_child(collectible)

func win_game():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_resume_pressed():
	toggle_pause()

func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
