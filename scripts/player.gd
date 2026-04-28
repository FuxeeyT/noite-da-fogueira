extends CharacterBody2D

@export var speed = 200.0
@export var run_speed = 350.0
@export var stamina = 100.0
@export var stamina_regen = 10.0
@export var stamina_cost = 25.0

var wood_inventory = 0
var max_wood = 5

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var current_speed = speed
	
	if Input.is_action_pressed("run") and stamina > 0 and direction != Vector2.ZERO:
		current_speed = run_speed
		stamina -= stamina_cost * delta
	else:
		stamina = min(100.0, stamina + stamina_regen * delta)
		
	velocity = direction * current_speed
	move_and_slide()
	
	# Verifica interação com a fogueira
	if Input.is_action_just_pressed("interact"):
		deposit_wood_to_fire()

func collect_item(type):
	match type:
		"stick":
			if wood_inventory < max_wood:
				wood_inventory += 1
				GameManager.add_score(5)
		"log":
			if wood_inventory < max_wood:
				wood_inventory += 2
				GameManager.add_score(15)
		"marshmallow":
			GameManager.player_health = min(3, GameManager.player_health + 1)

func deposit_wood_to_fire():
	if wood_inventory > 0:
		var wood_amount = wood_inventory
		var fire_increase = wood_amount * 15.0  # Cada madeira aumenta 15 segundos
		GameManager.fire_level = min(100.0, GameManager.fire_level + fire_increase)
		GameManager.add_score(wood_amount * 10)
		wood_inventory = 0
